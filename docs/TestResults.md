
This table indicates the results we have obtained with a Intel BSP **itl_generic** using the GNU compiler with C++03 and 64bit support selected.  
Other configurations are selectable, but have not been verified by Wind River.
The number of test failures are indicated in the chart below, they are classified as follows:
* UNABLE_TO_LAUNCH - shell reports 'rtp exec: unable to launch process'
* WRONGSEG         - shell reports 'wrong number of segments'
* INVALIDARG       - test RTP reports 'invalid argument'
* SETUPERR         - test RTP reports 'Test setup error'
* NOTIMP           - test RTP reports function 'not implemented'
* SIGABRT          - shell reports RTP 'has been deleted due to signal 6'
* SIGSEGV          - shell reports RTP 'has been deleted due to signal 11'
* STDEXC           - shell reports RTP 'has had a failure and has been deleted'
* TIMEOUT          - test RTP fails to exit within timeout (90s)
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
| chrono	     | TOTAL: 113 PASSED: 104 <br> UNABLE_TO_LAUNCH: 1 <br> SIGABRT: 8
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
| geometry	     | TOTAL: 332 PASSED: 163 <br> COMPILE: 153 <br> LINK: 6 <br> UNABLE_TO_LAUNCH: 9 <br> STDFAIL: 1
| GIL	         | Pass
| graph	         | TOTAL: 91 PASSED: 55 <br> COMPILE: 36
| graph_parrellel   |  -- | Not Supported, requires MPI
| heap	         | Pass
| ICL	         | Pass
| integer	     | Pass
| interprocess	 | TOTAL: 120 PASSED: 38 <br> UNABLE_TO_LAUNCH: 1 <br> INVALIDARG: 2 <br> NOTIMP: 4 <br> SIGABRT: 75
| intrusive	     | TOTAL: 67 PASSED: 66 <br> SIGABRT: 1
| IO	         | Pass
| iostream	     | TOTAL: 44 PASSED: 21 <br> STDFAIL: 23
| lambda	     | Pass
| lexical cast	 | TOTAL: 27 PASSED: 24 <br> UNABLE_TO_LAUNCH: 1 <br> STDFAIL: 2
| Locale	     | -- | Not Supported, requires supporting library
| local function    | Pass	
| log	         | TOTAL: 45 PASSED: 41 <br> LINK: 1 <br> SETUPERR: 2 <br> STDFAIL: 1
| logic	         | Pass
| lockfree	     | TOTAL: 14 PASSED: 1 <br> NO_CONN: 7 <br> TIMEOUT: 6
| math	         | TOTAL: 364 PASSED: 350 <br> STDFAIL: 14
| move	         | Pass
| MPI	         | --  |  Not Supported, requires supporting library
| MPL	         | Pass
| MSM	         | Pass
| multi-array    | Pass	
| multi-index	 | Pass
| multiprecision | TOTAL: 230 PASSED: 216 <br> UNABLE_TO_LAUNCH: 1 <br> SIGSEGV: 2 <br> TIMEOUT: 11
| numeric        | TOTAL: 122 PASSED: 93 <br> COMPILE: 29
| optional	     | TOTAL: 42 PASSED: 38 <br> UNABLE_TO_LAUNCH: 4
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
| random	     | TOTAL: 92 PASSED: 89 <br> LINK: 1 <br> UNABLE_TO_LAUNCH: 1 <br> STDFAIL: 1
| range	         | TOTAL: 184 PASSED: 164 <br> COMPILE: 20
| ratio	         | Pass
| rational	     | Pass
| regex	         |TOTAL: 43 PASSED: 42 <br> COMPILE: 1  
| scope exit     | 	TOTAL: 34 PASSED: 31 <br> COMPILE: 3
| serialization	 | TOTAL: 301 PASSED: 35 <br> UNABLE_TO_LAUNCH: 53 <br> STDFAIL: 213
| signals   	 | -- | Not Supported, depricated | 
| signals 2	     | TOTAL: 132 PASSED: 126 <br> LINK: 2 <br> UNABLE_TO_LAUNCH: 4
| smart pointer	 | Pass
| sort	         | Pass
| spirit	     | TOTAL: 348 PASSED: 330 <br> COMPILE: 3 <br> LINK: 2 <br> UNABLE_TO_LAUNCH: 4 <br> SIGABRT: 2 <br> SIGSEGV: 2 STDFAIL: 5
| statechart	 | TOTAL: 132 PASSED: 126 <br> LINK: 2 <br> UNABLE_TO_LAUNCH: 4
| static assert	 | Pass
| system	     | TOTAL: 10 PASSED: 4 <br> LINK: 5 <br> STDFAIL: 1
| test	         | TOTAL: 152 PASSED: 2 <br> COMPILE: 150
| thread	     | TOTAL: 764 PASSED: 705 <br> UNABLE_TO_LAUNCH: 34 <br> SIGABRT: 1 <br> SIGSEGV: 2 <br> STDFAIL: 22
| throw exception   | TOTAL: 5 PASSED: 3 <br> UNABLE_TO_LAUNCH: 2	
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
   
To obtain thses results a Linux build host was used with the filesystem mounted by the VxWorks NFS client using the method described in the README.
The VxWorks 7 March 2017 release was used with addtional workarounds:
* Fix inconsistent wide character support for VxWorks RTPs (V7COR-4768)
* Increase the default stack size for pthread_create() in RTPs

