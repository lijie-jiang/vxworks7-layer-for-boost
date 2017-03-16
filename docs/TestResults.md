
This table indicates the Boost test results we have obtained on an Intel Q35 target, using a 64-bit SMP VSB based upon the **itl_generic** BSP, and built with the GNU compiler, with the default C++ support (C++03, not C++11) selected.

Other configurations are selectable, but have not been verified by Wind River.

The number of test failures are indicated in the chart below. Failures are classified as follows:

* UNABLE_TO_LAUNCH - shell reports 'rtp exec: unable to launch process'
* WRONGSEG         - shell reports 'wrong number of segments'
* FATAL            - shell reports 'Fatal error'
* INVALIDARG       - test RTP reports 'invalid argument'
* SETUPERR         - test RTP reports 'Test setup error'
* NOTIMP           - test RTP reports function 'not implemented'
* STDEXC           - test RTP reports '* std::exception *'
* SIGABRT          - shell reports RTP 'has been deleted due to signal 6'
* SIGSEGV          - shell reports RTP 'has been deleted due to signal 11'
* EXCGEN           - shell reports RTP 'has had a failure and has been deleted'
* TIMEOUT          - test RTP fails to exit within timeout (100s)
* STDFAIL          - test RTP exits normally, reporting test errors with nonzero exit status
* LINK             - Failure to link the test executible
* COMPILE          - Failure to compile the test executible 
* NO_CONN          - Unable to telnet to target system  


| Library        |  Test Results     |  Notes                          | 
| -------------- | ----------------- | ---------------------------------------- | 
| Accumulators   | TOTAL: 47 PASSED: 45 <br> STDFAIL: 2
| Algorithum     | Pass  	    
| Align	         | Pass
| Array	         | Pass  
| ASIO	         | TOTAL: 174 PASSED: 150 <br> SIGABRT: 24
| Assert	     | Pass
| Atomic	     | Pass 
| bimap	         | Pass
| bind	         | Pass  
| chrono	     | TOTAL: 113 PASSED: 105 <br> SIGABRT: 8
| circular buffer  | Pass 	
| concept check	   | -- | Not supported |
| config	     | TOTAL: 20 PASSED: 19 <br> LINK: 1
| container	     | Pass
| context	     | Pass
| conversion	 | Pass
| convert	     | Pass
| core	         | Pass
| coroutine	     | Pass
| CRC	         | Pass
| date time	     | Pass
| detail	     | Pass
| disjoint sets	 | Pass
| dynamic bitsets  | Pass
| endian	     | Pass
| exception	     | Pass
| filesystem	 | TOTAL: 16 PASSED: 7 <br> LINK: 4 <br> SIGABRT: 2 <br> STDEXC: 3
| flyweight	     | TOTAL: 10 PASSED: 9 <br> LINK: 1
| foreach	     | Pass
| format	     | Pass
| function	     | Pass
| functional	 | Pass
| functional types	| TOTAL: 40 PASSED: 38 <br> COMPILE: 2
| fusion	     | Pass
| geometry	     | TOTAL: 332 PASSED: 172 <br> COMPILE: 153 <br> LINK: 6 <br> STDFAIL: 1
| GIL	         | Pass
| graph	         | TOTAL: 91 PASSED: 55 <br> COMPILE: 36
| graph_parrellel   |  -- | Not Supported, requires MPI
| heap	         | Pass
| ICL	         | Pass
| integer	     | Pass
| interprocess	 | TOTAL: 120 PASSED: 38 <br> INVALIDARG: 2 <br> NOTIMP: 4 <br> SIGABRT: 76
| intrusive	     | TOTAL: 67 PASSED: 66 <br> SIGABRT: 1
| IO	         | Pass
| iostream	     | TOTAL: 44 PASSED: 21 <br> STDFAIL: 23
| iterator    | Pass
| lambda	     | Pass
| lexical cast	 | TOTAL: 27 PASSED: 25 <br> STDFAIL: 2
| Locale	     | -- | Not Supported, requires supporting library
| local function    | Pass	
| lockfree	     | TOTAL: 14 PASSED: 1 <br> NO_CONN: 7 <br> SIGABRT: 2 <br> TIMEOUT: 4
| log	         | TOTAL: 45 PASSED: 41 <br> LINK: 1 <br> SETUPERR: 2 <br> STDFAIL: 1
| logic	         | Pass
| math	         | TOTAL: 364 PASSED: 350 <br> STDFAIL: 14
| move	         | Pass
| MPI	         | --  |  Not Supported, requires supporting library
| MPL	         | Pass
| MSM	         | Pass
| multi-array    | Pass	
| multi-index	 | Pass
| multiprecision | TOTAL: 230 PASSED: 217 <br> SIGSEGV: 2 <br> TIMEOUT: 11
| numeric        | TOTAL: 122 PASSED: 93 <br> COMPILE: 29
| optional	     | Pass
| parameter	     | --- |  Not Supported, requires Python
| phoenix	     | Pass
| polygon	     | Pass
| pool	         | Pass
| predef	     | Pass
| preprocessor	 | Pass
| program options  | TOTAL: 24 PASSED: 12 <br> LINK: 12
| property map	 | Pass
| property tree	 | TOTAL: 7 PASSED: 6  <br> STDFAIL: 1
| proto 	     | TOTAL: 23 PASSED: 22 COMPILE: 1
| python	     | --- |  Not Supported, requires supporting library
| random	     | TOTAL: 92 PASSED: 90 <br> LINK: 1 <br> STDFAIL: 1
| range	         | TOTAL: 184 PASSED: 164 <br> COMPILE: 20
| ratio	         | Pass
| rational	     | Pass
| regex	         |TOTAL: 43 PASSED: 42 <br> COMPILE: 1  
| scope exit     | 	TOTAL: 34 PASSED: 31 <br> COMPILE: 3
| serialization	 | TOTAL: 303 PASSED: 39 <br> STDFAIL: 264
| signals   	 | -- | Not Supported, depricated | 
| signals 2	     | TOTAL: 15 PASSED: 14 <br> STDFAIL: 1
| smart pointer	 | Pass
| sort	         | Pass
| spirit	     | TOTAL: 348 PASSED: 334 <br> COMPILE: 3 <br> LINK: 2 <br> SIGABRT: 2 <br> SIGSEGV: 2 STDFAIL: 5
| statechart	 | TOTAL: 132 PASSED: 130 <br> LINK: 2
| static assert	 | Pass
| system	     | TOTAL: 10 PASSED: 4 <br> LINK: 5 <br> STDFAIL: 1
| test	         | TOTAL: 152 PASSED: 2 <br> COMPILE: 150
| thread	     | TOTAL: 764 PASSED: 737 <br> SIGABRT: 2 <br> SIGSEGV: 2 <br> STDFAIL: 23
| throw exception   | Pass	
| timer	         | Pass
| tokenizer	     | Pass
| TTI	         | TOTAL: 103 PASSED: 97 <br> COMPILE: 6
| tuple	         | Pass
| type erasure   | Pass	
| type index     | --- |  Not Supported, for use with no RTTI	
| type traits    | TOTAL: 150 PASSED: 140 <br> COMPILE: 10	
| typeof	     |  TOTAL: 39 PASSED: 38 <br> COMPILE: 1
| units	         | Pass
| unordered	     | Pass
| utility	     | Pass
| UUID	         | Pass
| varient	     | Pass
| xpressive	     | Pass
| wave 	         | --- | Not Supported, no embedded application
   
To obtain these results, a Linux build host was used with the filesystem mounted by the VxWorks NFS client using the method described in the [README](../README.md).
The VxWorks 7 March 2017 release was used with addtional workarounds:
* Fix inconsistent wide character support for VxWorks RTPs (V7COR-4768) by defining **MB_LEN_MAX** as 5 (instead of 1) in **vxworks-7/pkgs/os/lang-lib/tool/toolsrc_gnu/usr/h/tool/gnu/limits.h**.
* Increase the default stack size for pthread_create() in RTPs by setting **DEF_STACK_SIZE** to 100000 (instead of (20 * 1024)) in **vxworks-7/pkgs/os/core/user/src/posix/pthreads/pthreadLib.c**

