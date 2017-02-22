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
    else:
        stdout.write("Failed to connect to telnet \n\n")

    tn.write("cmd\r\n".encode("UTF-8"))
    r = tn.expect(["#".encode("UTF-8")], 45)
    stdout.write("Executed: " + r[2].decode("UTF-8").replace("\r\n", "\nResult: ", 1).replace("\r\n[vxWorks *]#","[vxWorks *]#") + "\n\n")
    
    tn.write('set env "LD_LIBRARY_PATH={ld_library_path}"\r\n'.format(ld_library_path=ld_library_path).encode("UTF-8"))
    r = tn.expect(["#".encode("UTF-8")], 45)
    stdout.write("Executed: " + r[2].decode("UTF-8").replace("\r\n", "\nResult: ", 1).replace("\r\n[vxWorks *]#","\n[vxWorks *]#") + "\n\n")
    
    tn.write("cd {src_dir}/status\r\n".format(src_dir=src_dir).encode("UTF-8"))
    r = tn.expect(["#".encode("UTF-8")], 45)
    stdout.write("Executed: " + r[2].decode("UTF-8").replace("\r\n", "\nResult: ", 1).replace("\r\n[vxWorks *]#","\n[vxWorks *]#") + "\n\n")
    to_run = "run -x -t 0x01000000 -u 100000 -- "
    for arg in args.argv:
        to_run += arg.replace("\\","/") + " "
    to_run += "\r\n"
    tn.write(to_run.encode("UTF-8"))
    #tn.write("\r\n".encode("UTF-8"))
    test = tn.expect(["due to signal 6.".encode("UTF-8"), "due to signal 11.".encode("UTF-8"), "and has been deleted.".encode("UTF-8"), "#".encode("UTF-8")], 100)
    result = test[0] #will give the index of which ever thing our expeect found (-1 for timeout)
    if result != 3:
        stdout.write("\n\nAn error occured when trying to execute: " + to_run + "The error was:\n\t\t\t")
    if result == -1:
        stdout.write("After trying to run, we timed out... Rebooting...\n")
        tn.write("\x18".encode("UTF-8")) #resart the telnet session
        from time import sleep
        sleep(25)
        exited = True
        raise ValueError("We timed out and rebooted the session")
    elif result == 0:
        stdout.write("SIGABRT related error \n")
        raise ValueError("SIGABRT")
    elif result == 1:
        stdout.write("SEGFAULT related error \n")
        raise ValueError("SEGFAULT")
    elif result == 2:
        stdout.write("Something has been deleted \n")
        raise ValueError("Something was deleted")
    #else '#', which is what we want to see
    stdout.write("Executed: " + test[2].decode("UTF-8").replace("\r\n", "\nResult: ", 1).replace("\r\n[vxWorks *]#","\n[vxWorks *]#") + "\n\n")
    tn.write("echo \$?\r\n".encode("UTF-8"))
    stdout.write("Executed: " + tn.read_until("#".encode("UTF-8"), 60).decode("UTF-8").replace("\r\n", "\nResult: ", 1).replace("\r\n[vxWorks *]#","\n[vxWorks *]#") + "\n\n") #output the last bit of output before exiting
    
except Exception as error:
    stdout.write("\n\nAn error occured:\n\t\t\t" + str(error) + "\n\n")
    tn.write("exit\r\n".encode("UTF-8"))
    stdout.write("Telnet disconnected...")
    stdout.close()
    sys.exit(-1)
if not exited: #if we did not timeout. If we did, we do not want to stop things at the base terminal level
    tn.write("exit\r\n".encode("UTF-8"))
stdout.write("Telnet disconnected...")
stdout.close()
sys.exit(0)
