### VxWorks&reg; 7 Recipe Layer for Boost

This repository contains a VxWorks&reg;  7 Source Build (VSB) layer. 
Add this layer to your VxWorks install to build and verify Boost as part of your board's VSB project.  

This repository contains a collection of patches to adapt Boost to VxWorks.
Boost is many libraries and not all of them will work with VxWorks, some of them require
C++ support not available in VxWorks, or are dependent on other libraries not available 
for VxWorks. The **vxworks7-boost** project goal is to validate as many boost libraries
as possible and then push the required changes to boost.org. Until the patches are
incorporated into boost they will exist here.

This layer does not contain boost and only provides a recipe to adapt boost to VxWorks. 
Boost is not part of any VxWorks product, and is not covered by your Wind River support agreement.
If you need help, please use the resources available and boost.org, or contact your Wind River sales
representative to arrange for consulting services.

### Project License

The source code for this project is provided under the Boost Software License - Version 1.0 (BSL-1.0). Text for the BSL-1.0 and other applicable license notices can be found in the LICENSE_NOTICES.txt file in the project top level directory. Different files may be under different licenses. Each source file should include a license notice that designates the licensing terms for the respective file.

### Prerequisite(s)

Install the Wind River&reg; VxWorks&reg; 7 operating system from March 2017 or later.
The Boost layer has a dependency on the Unix compatibility layer in this release;
***InstallDir*/vxworks-7/pkgs/os/utils/unix** 

If you are on system **without internet conectivity** you must obtain the boost sources and put them in: ***InstallDir*/vxworks-7/download**. On a Linux build host from http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.gz/download, and on Windows  http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.zip/download. If you are online these will downloaded by **wget** or **curl** during the build. 

The **expect** executable used for adapting the Boost test harness to cross compilation is not provided on Windows build host, and must be licensed separately, it has not been verified. It can be obtained from http://www.activestate.com/activetcl/expect. It is not required to build Boost, only to execute the test harness.


### Setup

1) Obtain the VxWorks Boost layer:

     -  Go to  https://github.com/Wind-River/vxworks7-layer-for-boost

     -  Download a zip of the layer using the link provided by github.
	 ![](./docs/download.png)

     -	Unzip into your VxWorks install directory in an appropriate place in the packages directory, typically;
      ***InstallDir*/vxworks-7/pkgs/app**
	  
2) If you are using the Boost **streams** library you must obtain the **bzip2** layer and place it in your vxworks 7 install in a similar manner: https://github.com/Wind-River/vxworks7-layer-for-bzip2 	  

3) From a shell prompt: 	  

```
$ cd InstallDir
$ ./wrenv.linux �p vxworks-7
$ cd ../workspace
$ export WIND_WRTOOL_WORKSPACE=`pwd`
$ wrtool prj vsb create �bsp vxsim_linux simVSB
$ cd simVSB  
```

### Building

1) After creating the VSB (VxWorks Source Build Project) include the Boost layer in the Workbench configuration editor:
![](./docs/layer selection.png)

   The VSB build will unpack Boost into ***vsbDir*/3pp/BOOST**.
And copy the headers to ***vsbDir*/usr/h/public/boost**.
The buildable portions of Boost become visible selections in the Workbench configuration menu once the layer is enabled. 
![](./docs/wb_boost_menu.png)

   Only the Boost timer library is built by default, selecting the layer also installs the headers in the VSB.
Other libraries must be selected in the Workbench configuration tool before they are built. 
You can also select to build the portions of Boost you want on the command line with **vxprj** or **wrtool**:
```
$ vxprj vsb add BOOST
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_MATH=y"
$ make 
``` 
or 
```
$ wrtool prj vsb add BOOST
$ wrtool prj vsb value set BOOST_MATH y
$ make 
```

The Makefile that actually builds the code is ***InstallDir*/vxworks-7/pkgs/app/boost/usr_src/vxworks.lib.mak**. This is copied to the Boost source directory ***vsbDir*/3pp/BOOST/boost_1_59_0/**.
 
The initial build of the Boost layer creates the **vxworks_env.sh** which contains the current VSB cross build environment. This is propagated to the Boost jam build environment by the generic **project_config.jam** file provided in the Boost layer. Once these files are in place it is possible to invoke the **b2** outside the VSB build by first sourcing **vxworks_env.sh**.  Duplicate the command found in the build log. For example:

```
$ cd  3pp/BOOST/boost_1_59_0
$ . ./vxworks_env.sh 
$ ./b2 install --prefix=VSBDir/usr/root --libdir=VSBDir/usr/lib/common \
--includedir=VSBDir/usr/h/public  link=static  toolset=gcc cross-compile=vxworks     \
--with-atomic --with-chrono --with-context --with-coroutine --with-exception \
--with-test -q -d2
```

It is recommended you simply build the BOOST layer for incremental builds. 
```
$ vxprj vsb build BOOST
```
NOTE: The thread library has an additional dependency.
```
$ vxprj vsb config -s -add "_WRS_CONFIG_DEFAULT_PTHREAD_PRIO_INHERIT=y"
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_THREAD=y"
``` 

### Testing 
 Most of Boost is header only libraries and so to verify them with a specific VxWorks configuration requires running the regression tests for the library you wish to verify.  All regression tests are dependent on the tests harness library. So it must be included first, for example:
``` 
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_TESTS=y"
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_MATH_TESTS=y"
```
The default behavior is to simply build the tests during the final VSB build stage.
To actually execute the tests after each one is built you specify the telnet address of your tests system.
```
$ vxprj vsb config -s -add "BOOST_TELNET_ADDR=192.168.200.1"
```
The target's path to the workspace defaults to using the TFC path, but can be set to another method. 
```
$ vxprj vsb config -s  \
-add "_WRS_CONFIG_BOOST_HOST_FILEPATH_MAPPING_PREFIX=bkuhlfedora:"
```
The tests are executed by telnet-ing to the target using an expect script found in the Boost layer: **vxworks_boost_test_run.exp.** 

There is a *chicken and egg* problem here. You must create a VIP from the VSB before running the Boost tests, so it is necessary to build the VSB twice in order to run the tests. For example; execute the following in you workspace:

```
$ wrtool prj vsb create �bsp simVSB vxsim_linux
$ cd simVSB  
$ vxprj vsb add BOOST
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_MATH=y"
$ make 
$ cd ..
$ wrtool prj vip create �vsb simVSB vxsim_linux gnu simVIP
$ cd simVIP 
$ vxprj component add INCLUDE_IPTELNETS
$ vxprj component add INCLUDE_PX_SCHED_DEF_POLICIES
$ vxprj component add 
$ vxprj build
$ sudo ../../wrenv.linux -p vxworks-7
> vxsimnetd �sv &
> exit
$ gnome-terminal -e "vxsim -netif simnet0=192.168.200.1 -f default/vxWorks"
$ cd .. 

$ cd simVSB  
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_TESTS=y"
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_MATH_TESTS=y"
$ vxprj vsb config -s -add "_WRS_CONFIG_BOOST_TELNET_ADDR=192.168.200.1"
$ vxprj vsb config -s -add  \
"_WRS_CONFIG_BOOST_HOST_FILEPATH_MAPPING_PREFIX=bkuhlfedora:"
$ make
```
Test pass/failure results appear on the console; the results are also stored in the Boost build directory: 
***vsbDir*/3pp/BOOST/boost_1_59_0/bin.v2/libs/*library_name***.

### Notes:
* The ***exceptions/copy_exception_test*** will fail with the debugger attached, it launches 1000s of threads and overwhelms the debugger, and may require a longer timeout in the expect script to pass.
* Workbench users should disable source indexing for the VSB; otherwise java will run out of memory. 
* No clean rule is provided for the Boost layer, but cleaning the VSB will rebuild Boost as well. The download directory is not touched, so the re-build will begin from the unpack stage.
* Removing the ***vsbDir*/3pp/BOOST**  directory or  ***vsbDir*/3pp/BOOST/boost_1_59_0/bin.v2/libs/*library_name*** will incrementally rebuild Boost independent of the VSB.
* The boost library core tests will fail if not executed with a target IP configured, the boost test harness does not properly deal with �run fail� targets this library uses 
* The number of make build threads used in the VSB build is propagated to the Boost build though the -j option. But during the testing this means multiple telnet sessions run concurrently on the target system, and may overwhelm the memory on the target system.   If you have unreproducible, odd errors, or out of memory errors like the one shown below, repeat the testing single threaded to confirm the test is not failing due to target resource limitations.
```
0x81e4b180 (iTest_random_generator): memPartAlloc: block too big 520 bytes (0x8 aligned) in partition 0xe27312a0
0x81e4b180 (iTest_random_generator): memPartAlloc: block too big 520 bytes (0x8 aligned) in partition 0xe27312a0
```

### Porting Status 

This table indicates the results we have obtained with an 32bit build of Intel BSP using the GNU compiler with C++03 support selected.  


| Library        |  Test Results     |  Notes                          | 
| -------------- | ----------------- | ---------------------------------------- | 
| Accumulators   | 
| Algorithum     | Pass  	    
| Align	         | 
| Array	         | Pass  
| ASIO	         | 
| Assert	     | Pass
| Atomic	     |  
| bimap	         | Pass
| bind	         | Pass  
| chrono	     | 
| circular buffer  | Pass 	
| concept check	   | -- | Not supported |
| config	     | 
| container	     | Pass
| context	     | Pass
| conversion	 | Pass
| convert	     | Pass
| core	         | Pass
| coroutine	     | Pass
| CRC	         | Pass
| date time	     | 
| detail	     | Pass
| disjoint sets	 | Pass
| dynamic bitsets  | Pass
| endian	     | Pass
| exception	     | Pass
| filesystem	 | 
| flyweight	     | 
| foreach	     | Pass
| format	     | Pass
| function	     | 
| functional	 | 
| functional types	| Pass
| fusion	     | Pass
| geometry	     | 
| GIL	         | 
| graph	         | 
| graph_parrellel   |  -- | Not Supported, requires MPI
| heap	         | Pass
| ICL	         | Pass
| integer	     | Pass
| interprocess	 | 
| intrusive	     | 
| IO	         | 
| iostream	     | 
| lambda	     | Pass
| lexical cast	 | 
| Locale	     | -- | Not Supported, requires supporting library
| local function    | Pass	
| log	         | 
| logic	         | Pass
| lockfree	     | 
| math	         | 
| move	         | Pass
| MPI	         | --  |  Not Supported, requires supporting library
| MPL	         | Pass
| MSM	         | Pass
| multi-array    | Pass	
| multi-index	 | Pass
| multiprecision | 
| optional	     | Pass
| parameter	     | --- |  Not Supported, requires python
| phoenix	     | Pass
| polygon	     | Pass
| pool	         | 
| predef	     | Pass
| preprocessor	 | Pass
| program options  | 
| property map	 | Pass
| property tree	 | 
| proto 	     | 
| python	     | --- |  Not Supported, requires supporting library
| random	     | 
| range	         | 
| ratio	         | Pass
| rational	     | Pass
| regex	         | 
| scope exit     | 	
| serialization	 | --- |   Not Supported, depricated
| signals   	 | 
| signals 2	     | 
| smart pointer	 | Pass
| sort	         | Pass
| spirit	     | 
| statechart	 | 
| static assert	 | Pass
| system	     | 
| test	         | 
| thread	     | 
| throw exception   |  Pass 	
| timer	         | 
| tokenizer	     | Pass
| TTI	         | 
| tuple	         | Pass
| type erasure   | Pass	
| type index     | --- |  Not Supported, for use with no RTTI	
| type traits    | 	
| typeof	     |  
| units	         | Pass
| unordered	     | Pass
| utility	     | Pass
| UUID	         | Pass
| varient	     | Pass
| xpressive	     | Pass
| wave 	         | --- | Not Supported, no embedded application
   

### Legal Notices

Disclaimer of Warranty / No Support: Wind River does not provide support and maintenance services for this software, under Wind River�s standard Software Support and Maintenance Agreement or otherwise. Unless required by applicable law, Wind River provides the software (and each contributor provides its contribution) on an �AS IS� BASIS, WITHOUT WARRANTIES OF ANY KIND, either express or implied, including, without limitation, any warranties of TITLE, NONINFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the software and assume any risks associated with your exercise of permissions under the license.
