# -*- coding: utf-8 -*-
"""
Created on Mon Feb 13 13:26:17 2017

@author: oneuber
"""


import telnetlib
import os
import argparse
from sys import stdout
import sys
import re
from time import sleep

#from datetime import datetime
#now = datetime.now() #for a timestamped log file
#t_stamp = #str(now.year)+"-"+str(now.month)+"-"+str(now.day)+"-"+str(now.minute)+"-"+str(now.second)+"-"+str(now.microsecond)

parser = argparse.ArgumentParser()
parser.add_argument("argv", nargs=argparse.REMAINDER, help="Takes in argv arguments for use with the run command")
args = parser.parse_args() #argparse.REMAINDER allows the nargs to accept flags in addition to normal things

try:
    l_name = os.path.basename(args.argv[0]).replace(".","-")
except:
    l_name = ""
#TODO: comment out this bit for production
#stdout = open("C:/Owen/{l_name}.log".format(l_name=l_name), 'w') #comment out to have output go to terminal
stdout.write("Our argv elements:\n"+str(args.argv) + "\n\n")
exited = False
try:
    telnet_ip = os.environ['BOOST_TELNET_ADDR'] # the host and port we want to run on
    ld_library_path = os.environ['VSB_LD_LIBRARY_PATH'] #'/hostfs/wssimVSB_new/usr/root/gnu/bin;/hostfs/wssimVSB_new/usr/lib/common'
    src_dir = os.environ['LAYER_SRC_PATH'] #'/hostfs/wssimVSB_new/3pp/BOOST/boost_1_59_0'
    stdout.write("Environment variables: " + str([telnet_ip, ld_library_path, src_dir]) + "\n")
    
    host = telnet_ip.split(" ")[0]
    port = int(telnet_ip.split(" ")[1])
    tn = telnetlib.Telnet(host, port, 60)
    con = tn.expect(["->".encode("UTF-8"), "fail".encode("UTF-8")], 45)
    if con[0] == 0:
        stdout.write("Connected to telnet... \n")
        stdout.write(con[2].decode("UTF-8"))
    else:
        stdout.write("Failed to connect to telnet \n\n")

    tn.write("cmd\r\n".encode("UTF-8"))
    r = tn.expect(["vxWorks *]#".encode("UTF-8")], 45)
    stdout.write(r[2].decode("UTF-8"))
    
    tn.write('set env "LD_LIBRARY_PATH={ld_library_path}"\r\n'.format(ld_library_path=ld_library_path).encode("UTF-8"))
    r = tn.expect(["vxWorks *]#".encode("UTF-8")], 45)
    stdout.write(r[2].decode("UTF-8"))
    
    tn.write("cd {src_dir}/status\r\n".format(src_dir=src_dir).encode("UTF-8"))
    r = tn.expect(["vxWorks *]#".encode("UTF-8")], 45)
    stdout.write(r[2].decode("UTF-8"))
    to_run = "run -x -t 0x01000000 -u 100000 -- "
    for arg in args.argv:
        to_run += arg.replace("\\","/") + " "
    to_run += "\r\n"
    tn.write(to_run.encode("UTF-8"))
    #sleep(1)
    test = tn.expect(["due to signal 6.".encode("UTF-8"), "due to signal 11.".encode("UTF-8"), "and has been deleted.".encode("UTF-8"), "vxWorks *".encode("UTF-8")], 100)
    result = test[0] #will give the index of which ever thing our expeect found (-1 for timeout)
    stdout.write(test[2].decode("UTF-8")+"\n")
    if result == -1:
        stdout.write("After trying to run, we timed out... Rebooting...\n")
        tn.write("\x18".encode("UTF-8")) #resart the telnet session
        sleep(25)
        exited = True
        raise ValueError("We timed out and rebooted the session")
    elif result == 0:
        raise ValueError("SIGABRT")
    elif result == 1:
        raise ValueError("SEGFAULT")
    elif result == 2:
        raise ValueError("Something was deleted")
    #else '#', which is what we want to see
    tn.write("echo \$?\r\n".encode("UTF-8"))
    echo_output = tn.read_until("vxWorks *]#".encode("UTF-8"), 60).decode("UTF-8")
    stdout.write(echo_output) #output the last bit of output before exiting
    echo_value = int(re.findall(r'\d+', echo_output)[0]) #finds the first integer inside the echo string
                
except Exception as error:
    if not tn: #if we failed before telnet was even defined
        stdout.write("Telnet connection error. Ensure your BOOST_TELNET_ADDR environment variable is correct.")
        sys.exit(-1)
    tn.write("exit\r\n".encode("UTF-8"))
    stdout.write("Telnet disconnected...")
    stdout.close()
    sys.exit(-1)
if not exited: #if we did not timeout. If we did, we do not want to stop things at the base terminal level
    tn.write("exit\r\n".encode("UTF-8"))
stdout.write("\nTelnet disconnected...")
stdout.close()
sys.exit(echo_value)