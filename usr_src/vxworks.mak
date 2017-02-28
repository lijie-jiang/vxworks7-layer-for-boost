#  vxworks.mak - for boost test code
#
# Copyright 2015,2016 Wind River Systems, Inc.
#
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0.  (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#
#  modification history
#  --------------------
#  06dec16,brk  add rule for build_run_tests.sh
#  29sep16,brk  add bin directory to LD_LIBRARY_PATH
#  26aug15,brk  written
#
ifndef __DEFS_VSBVARS_MK_INCLUDED
include $(WIND_KRNL_MK)/defs.vsbvars.mk
endif

ifneq ($(wildcard $(VSB_MAKE_CONFIG_FILE)),)
include $(VSB_MAKE_CONFIG_FILE)
endif



ifdef _WRS_CONFIG_BOOST_ACCUMULATORS_TESTS
BOOST_BUILD_TEST += accumulators 
endif

ifdef _WRS_CONFIG_BOOST_ALGORITHM_TESTS
BOOST_BUILD_TEST += algorithm
endif

ifdef _WRS_CONFIG_BOOST_ALIGN_TESTS
BOOST_BUILD_TEST += align
endif

ifdef _WRS_CONFIG_BOOST_ARRAY_TESTS
BOOST_BUILD_TEST += array
endif

ifdef _WRS_CONFIG_BOOST_ASIO_TESTS
BOOST_BUILD_TEST += asio
endif

ifdef _WRS_CONFIG_BOOST_ASSERT_TESTS
BOOST_BUILD_TEST += assert
endif

ifdef _WRS_CONFIG_BOOST_ATOMIC_TESTS
BOOST_BUILD_TEST += atomic
endif

ifdef _WRS_CONFIG_BOOST_BIMAP_TESTS
BOOST_BUILD_TEST += bimap
endif

ifdef _WRS_CONFIG_BOOST_BIND_TESTS
BOOST_BUILD_TEST += bind
endif

ifdef _WRS_CONFIG_BOOST_CHRONO_TESTS
BOOST_BUILD_TEST += chrono
endif

ifdef _WRS_CONFIG_BOOST_CIRCULAR_BUFFER_TESTS
BOOST_BUILD_TEST += circular_buffer
endif

ifdef _WRS_CONFIG_BOOST_CONCEPT_CHECK_TESTS
BOOST_BUILD_TEST += concept_check
endif

ifdef _WRS_CONFIG_BOOST_CONFIG_TESTS
BOOST_BUILD_TEST += config
endif

ifdef _WRS_CONFIG_BOOST_CONTAINER_TESTS
BOOST_BUILD_TEST += container
endif

ifdef _WRS_CONFIG_BOOST_CONTEXT_TESTS
BOOST_BUILD_TEST += context
endif

ifdef _WRS_CONFIG_BOOST_CONVERSION_TESTS
BOOST_BUILD_TEST += conversion
endif

ifdef _WRS_CONFIG_BOOST_CONVERT_TESTS
BOOST_BUILD_TEST += convert
endif

ifdef _WRS_CONFIG_BOOST_CORE_TESTS
BOOST_BUILD_TEST += core
endif

ifdef _WRS_CONFIG_BOOST_COROUTINE_TESTS
BOOST_BUILD_TEST += coroutine 
endif

# coroutine2 - C++14 version of coroutine

ifdef _WRS_CONFIG_BOOST_CRC_TESTS
BOOST_BUILD_TEST += crc
endif

ifdef _WRS_CONFIG_BOOST_DATE_TIME_TESTS
BOOST_BUILD_TEST += date_time
endif

ifdef _WRS_CONFIG_BOOST_DETAIL_TESTS
BOOST_BUILD_TEST += detail
endif

ifdef _WRS_CONFIG_BOOST_DISJOINT_SETS_TESTS
BOOST_BUILD_TEST += disjoint_sets
endif

ifdef _WRS_CONFIG_BOOST_DYNAMIC_BITSET_TESTS
BOOST_BUILD_TEST += dynamic_bitset 
endif

ifdef _WRS_CONFIG_BOOST_ENDIAN_TESTS
BOOST_BUILD_TEST += endian
endif

ifdef _WRS_CONFIG_BOOST_EXCEPTION_TESTS
BOOST_BUILD_TEST += exception
endif

ifdef _WRS_CONFIG_BOOST_FILESYSTEM_TESTS
BOOST_BUILD_TEST += filesystem
endif

ifdef _WRS_CONFIG_BOOST_FLYWEIGHT_TESTS
BOOST_BUILD_TEST += flyweight
endif

ifdef _WRS_CONFIG_BOOST_FOREACH_TESTS
BOOST_BUILD_TEST += foreach
endif

ifdef _WRS_CONFIG_BOOST_FORMAT_TESTS
BOOST_BUILD_TEST += format
endif

ifdef _WRS_CONFIG_BOOST_FUNCTION_TESTS
BOOST_BUILD_TEST += function
endif

ifdef _WRS_CONFIG_BOOST_FUNCTIONAL_TESTS
BOOST_BUILD_TEST += functional
endif

ifdef _WRS_CONFIG_BOOST_FUNCTIONAL_TYPES_TESTS
BOOST_BUILD_TEST += functional_types
endif

ifdef _WRS_CONFIG_BOOST_FUSION_TESTS
BOOST_BUILD_TEST += fusion
endif

ifdef _WRS_CONFIG_BOOST_GEOMETRY_TESTS
BOOST_BUILD_TEST += geometry
endif

ifdef _WRS_CONFIG_BOOST_GIL_TESTS
BOOST_BUILD_TEST += gil 
endif

ifdef _WRS_CONFIG_BOOST_GRAPH_TESTS
BOOST_BUILD_TEST += graph
endif

# graph_parallel requires MPI support

ifdef _WRS_CONFIG_BOOST_HEAP_TESTS
BOOST_BUILD_TEST += heap
endif

ifdef _WRS_CONFIG_BOOST_ICL_TESTS
BOOST_BUILD_TEST += icl
endif

ifdef _WRS_CONFIG_BOOST_INTEGER_TESTS
BOOST_BUILD_TEST += integer
endif

ifdef _WRS_CONFIG_BOOST_INTERPROCESS_TESTS
BOOST_BUILD_TEST += interprocess
endif

ifdef _WRS_CONFIG_BOOST_INTRUSIVE_TESTS
BOOST_BUILD_TEST += intrusive
endif

ifdef _WRS_CONFIG_BOOST_IO_TESTS
BOOST_BUILD_TEST += io
endif 

ifdef _WRS_CONFIG_BOOST_IOSTREAMS_TESTS
BOOST_BUILD_TEST += iostreams
endif 

ifdef _WRS_CONFIG_BOOST_LAMBDA_TESTS
BOOST_BUILD_TEST += lambda
endif

ifdef _WRS_CONFIG_BOOST_LEXICAL_CAST_TESTS
BOOST_BUILD_TEST += lexical_cast
endif

ifdef _WRS_CONFIG_BOOST_LOCAL_FUNCTION_TESTS
BOOST_BUILD_TEST += local_function
endif 

ifdef _WRS_CONFIG_BOOST_LOCALE_TESTS
BOOST_BUILD_TEST += locale
endif 

ifdef _WRS_CONFIG_BOOST_LOG_TESTS
BOOST_BUILD_TEST += log
endif 

ifdef _WRS_CONFIG_BOOST_LOGIC_TESTS
BOOST_BUILD_TEST += logic
endif

ifdef _WRS_CONFIG_BOOST_LOCKFREE_TESTS
BOOST_BUILD_TEST += lockfree
endif

ifdef _WRS_CONFIG_BOOST_MATH_TESTS
BOOST_BUILD_TEST += math
endif

ifdef _WRS_CONFIG_BOOST_MATH_TESTS
BOOST_BUILD_TEST += math
endif

ifdef _WRS_CONFIG_BOOST_MOVE_TESTS
BOOST_BUILD_TEST += move
endif

# mpi requires MPI support
# (some VX partner did a MPI port, but it's not generally avalible )

ifdef _WRS_CONFIG_BOOST_MPL_TESTS
BOOST_BUILD_TEST += mpl
endif

ifdef _WRS_CONFIG_BOOST_MSM_TESTS
BOOST_BUILD_TEST += msm
endif

ifdef _WRS_CONFIG_BOOST_MULTI_ARRAY_TESTS
BOOST_BUILD_TEST += multi_array
endif

ifdef _WRS_CONFIG_BOOST_MULTI_INDEX_TESTS
BOOST_BUILD_TEST += multi_index
endif

ifdef _WRS_CONFIG_BOOST_MULTIPRECISION_TESTS
BOOST_BUILD_TEST += multiprecision
endif

ifdef _WRS_CONFIG_BOOST_OPTIONAL_TESTS
BOOST_BUILD_TEST += optional
endif

ifdef _WRS_CONFIG_BOOST_PARAMETER_TESTS
BOOST_BUILD_TEST += parameter
endif

ifdef _WRS_CONFIG_BOOST_PHOENIX_TESTS
BOOST_BUILD_TEST += phoenix
endif

ifdef _WRS_CONFIG_BOOST_POLYGON_TESTS
BOOST_BUILD_TEST += polygon
endif

ifdef _WRS_CONFIG_BOOST_POOL_TESTS
BOOST_BUILD_TEST += pool
endif

ifdef _WRS_CONFIG_BOOST_PREDEF_TESTS
BOOST_BUILD_TEST += predef
endif

ifdef _WRS_CONFIG_BOOST_PREPROCESSOR_TESTS
BOOST_BUILD_TEST += preprocessor
endif

ifdef _WRS_CONFIG_BOOST_PROGRAM_OPTIONS_TESTS
# environ conflict
BOOST_BUILD_TEST += program_options
endif 

ifdef _WRS_CONFIG_BOOST_PROPERTY_MAP_TESTS
BOOST_BUILD_TEST += property_map
endif

ifdef _WRS_CONFIG_BOOST_PROPERTY_TREE_TESTS
BOOST_BUILD_TEST += property_tree
endif

ifdef _WRS_CONFIG_BOOST_PROTO_TESTS
BOOST_BUILD_TEST += proto
endif

# python requires python support

ifdef _WRS_CONFIG_BOOST_RANDOM_TESTS
# looks like it needs /dev/urandom for entropy?
BOOST_BUILD_TEST += random
endif 

ifdef _WRS_CONFIG_BOOST_RANGE_TESTS
BOOST_BUILD_TEST += range
endif

ifdef _WRS_CONFIG_BOOST_RATIO_TESTS
BOOST_BUILD_TEST += ratio
endif

ifdef _WRS_CONFIG_BOOST_RATIONAL_TESTS
BOOST_BUILD_TEST += rational
endif

ifdef _WRS_CONFIG_BOOST_REGEX_TESTS
BOOST_BUILD_TEST += regex
endif 

ifdef _WRS_CONFIG_BOOST_SCOPE_EXIT_TESTS
BOOST_BUILD_TEST += scope_exit
endif 

ifdef _WRS_CONFIG_BOOST_SERIALIZATION_TESTS
BOOST_BUILD_TEST += serialization
endif 

# signals is depricated (use signals2 )

ifdef _WRS_CONFIG_BOOST_SIGNALS2_TESTS
BOOST_BUILD_TEST += signals2
endif 

ifdef _WRS_CONFIG_BOOST_SMART_PTR_TESTS
BOOST_BUILD_TEST += smart_ptr
endif 

ifdef _WRS_CONFIG_BOOST_SORT_TESTS
BOOST_BUILD_TEST += sort
endif

ifdef _WRS_CONFIG_BOOST_SPIRIT_TESTS
BOOST_BUILD_TEST += spirit
endif

ifdef _WRS_CONFIG_BOOST_STATECHART_TESTS
BOOST_BUILD_TEST += statechart
endif

ifdef _WRS_CONFIG_BOOST_STATIC_ASSERT_TESTS
BOOST_BUILD_TEST += static_assert
endif

ifdef _WRS_CONFIG_BOOST_SYSTEM_TESTS
BOOST_BUILD_TEST += system
endif 

ifdef _WRS_CONFIG_BOOST_TEST_TESTS
BOOST_BUILD_TEST += test
endif 

ifdef _WRS_CONFIG_BOOST_THREAD_TESTS
BOOST_BUILD_TEST += thread
endif

ifdef _WRS_CONFIG_BOOST_THROW_EXCEPTION_TESTS
BOOST_BUILD_TEST += throw_exception
endif

ifdef _WRS_CONFIG_BOOST_TIMER_TESTS
BOOST_BUILD_TEST += timer
endif 

ifdef _WRS_CONFIG_BOOST_TOKENIZER_TESTS
BOOST_BUILD_TEST += tokenizer
endif 

ifdef _WRS_CONFIG_BOOST_TTI_TESTS
BOOST_BUILD_TEST += tti
endif 

ifdef _WRS_CONFIG_BOOST_TUPLE_TESTS
BOOST_BUILD_TEST += tuple
endif 

ifdef _WRS_CONFIG_BOOST_TYPE_ERASURE_TESTS
BOOST_BUILD_TEST += type_erasure
endif 

ifdef _WRS_CONFIG_BOOST_TYPE_INDEX_TESTS
BOOST_BUILD_TEST += type_index
endif 

ifdef _WRS_CONFIG_BOOST_TYPE_TRAITS_TESTS
BOOST_BUILD_TEST += type_traits
endif 

ifdef _WRS_CONFIG_BOOST_TYPEOF_TESTS
BOOST_BUILD_TEST += typeof
endif 

ifdef _WRS_CONFIG_BOOST_UNITS_TESTS
BOOST_BUILD_TEST += units
endif 

ifdef _WRS_CONFIG_BOOST_UNORDERED_TESTS
BOOST_BUILD_TEST += unordered
endif 

ifdef _WRS_CONFIG_BOOST_UTILITY_TESTS
BOOST_BUILD_TEST += utility
endif 

ifdef _WRS_CONFIG_BOOST_UUID_TESTS
BOOST_BUILD_TEST += uuid
endif 

ifdef _WRS_CONFIG_BOOST_VARIANT_TESTS
BOOST_BUILD_TEST += variant
endif 

# wave - a C++ preprocessor, I can't imagine an embbeded application for it?

ifdef _WRS_CONFIG_BOOST_XPRESSIVE_TESTS
BOOST_BUILD_TEST += xpressive
endif 


empty:=
space:= $(empty) $(empty)
BOOST_LIMIT_TESTS=$(subst $(space),|,$(strip $(BOOST_BUILD_TEST)))

.PHONY: boost_default boost_build boost_install

boost_default : boost_build   


EXTRA_INCLUDE += -I$(realpath .) 
EXTRA_DEFINE += -DBOOST_TEST_LIMITED_SIGNAL_DETAILS -DBOOST_LOG_WITHOUT_DEFAULT_FACTORIES 
# dlmalloc in containers should not use sbrk()
EXTRA_DEFINE += -DHAVE_MORECORE=0

# Rather than removing all warnings, suppress the ones that are obviously extranious 
ifeq ($(TOOL),gnu)
EXTRA_DEFINE += -Wno-comment -Wno-parentheses -Wno-reorder -Wno-narrowing -Wno-error=unused-parameter
BOOST_TOOL:= gcc
endif

ifeq ($(TOOL),diab)
EXTRA_DEFINE += -ei4236,4940,5386,1122,4381,4261,4340,1522,1606
BOOST_TOOL:= diab
# some compiles fail with too many sections if default debug release is used 
BOOST_WORKAROUND += "variant=release"
endif

ifeq ($(TOOL),icc)
EXTRA_DEFINE += -DBOOST_NO_CXX11_HDR_INITIALIZER_LIST -CG_allow_xmm -CG_allow_x87
BOOST_TOOL:= intel
endif

ifeq ($(TOOL),llvm)
EXTRA_DEFINE += 
BOOST_TOOL:= clang-vxworks
endif

RTP_BASE_DIR = boost

LIB_BASE_NAME = boost

OBJS=$(CPP_SOURCE:.cpp=.o) 

ADDED_LIBS = -lunix 

LIB_FORMAT:= static

include $(WIND_USR_MK)/rules.rtp.mk

include $(WIND_USR_MK)/rules.env.sh.mk

JOBS ?= 1

# a path to the layer in the workspace from the targets filesystem point of view
#  for the testing script
WORKSPACE :=$(strip $(dir $(VSB_DIR)))
LAYER_SRC_PATH :=$(_WRS_CONFIG_BOOST_HOST_FILEPATH_MAPPING_PREFIX)$(subst $(WORKSPACE),,$(PKG_SRC_BUILD_DIR))
VSB_LD_LIBRARY_PATH :=$(_WRS_CONFIG_BOOST_HOST_FILEPATH_MAPPING_PREFIX)$(subst $(WORKSPACE),,$(ROOT_DIR)/$(TOOL)/bin);$(_WRS_CONFIG_BOOST_HOST_FILEPATH_MAPPING_PREFIX)$(subst $(WORKSPACE),,$(LIBDIR)/$(TOOL_COMMON_DIR))

ifneq ($(strip $(_WRS_CONFIG_BOOST_TELNET_ADDR)),)
 ifeq "$(WIND_HOST_TYPE)" "x86-win32"
BOOST_TEST_EXE = "testing.launcher=vxworks_boost_test_run.bat"
 else
BOOST_TEST_EXE ="testing.launcher=./vxworks_boost_test_run.exp"
endif
else
BOOST_TEST_EXE ="testing.execute=off"  
endif  

ifeq "$(WIND_HOST_TYPE)" "x86-win32"
# Shorten paths on windows to avoid path length issues 
BOOST_WORKAROUND += --abbreviate-paths  --layout=system
CHMOD = touch 
else
CHMOD = chmod +x 
endif 

BOOST_ARGS =  --prefix=$(ROOT_DIR) --libdir=$(LIBDIR)/$(TOOL_COMMON_DIR) --includedir=$(VSB_DIR)/usr/h/public   
BOOST_ARGS+=  link=static toolset=$(BOOST_TOOL) cross-compile=vxworks $(BOOST_WORKAROUND)

# create a shell script for customers who whould prefer to invoke the test harness outside 
# the VSB build
build_run_tests.sh: $(AUTO_INCLUDE_VSB_CONFIG_QUOTE) $(VXWORKS_ENV_SH)  $(__AUTO_INCLUDE_LIST_UFILE)
	@echo "#!/bin/bash"                                                 > $@
	@echo "# build and run boost test harness "                         >> $@
	@echo ". ./$(VXWORKS_ENV_SH)"                                       >> $@
	@echo "if [ -z \"\$$BOOST_TELNET_ADDR\" ] ; then                  " >> $@
	@echo "    export BOOST_TELNET_ADDR=\"$(_WRS_CONFIG_BOOST_TELNET_ADDR)\" " >> $@
	@echo "fi "                                                         >> $@
	@echo "if [ -z \"\$$LAYER_SRC_PATH\" ] ; then                     " >> $@
	@echo "    export LAYER_SRC_PATH=\"$(LAYER_SRC_PATH)\"            " >> $@
	@echo "fi "                                                         >> $@
	@echo "export PKG_SRC_BUILD_DIR=\"$(PKG_SRC_BUILD_DIR)\"          " >> $@ 
	@echo "export VSB_LD_LIBRARY_PATH=\"$(VSB_LD_LIBRARY_PATH)\"      " >> $@ 
	@echo "cd status  "                                                 >> $@
	@echo "../b2 $(BOOST_ARGS) \\">> $@
	@echo "     \"\$$@\"  testing.launcher=./vxworks_boost_test_run.exp" >>$@
	@$(CHMOD)  $@


ifdef BOOST_BUILD_TEST
boost_build: $(AUTO_INCLUDE_VSB_CONFIG_QUOTE) $(VXWORKS_ENV_SH)  $(__AUTO_INCLUDE_LIST_UFILE) build_run_tests.sh
	. ./$(VXWORKS_ENV_SH) &&  cd status   &&  \
			BOOST_TELNET_ADDR="$(_WRS_CONFIG_BOOST_TELNET_ADDR)"  \
			LAYER_SRC_PATH="$(LAYER_SRC_PATH)" \
			PKG_SRC_BUILD_DIR="$(PKG_SRC_BUILD_DIR)"  \
			VSB_LD_LIBRARY_PATH="$(VSB_LD_LIBRARY_PATH)" \
	nice ../b2 -j$(JOBS) $(BOOST_ARGS) $(BOOST_TEST_EXE) "--limit-tests=$(BOOST_LIMIT_TESTS)"  -q  -d2
else
boost_build: build_run_tests.sh 
	$(info No BOOST tests are selected, nothing will be built) 
endif


