#  vxworks.mak - for boost
#
# Copyright 2014-15, Wind River Systems, Inc.
#
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0.  (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#
#  modification history
#  --------------------
# 26nov15,brk  use b2 build utility wrapped by vxworks_env.sh
#              (similar to autoconf approch,)  
#				in preperation for regression test harness support  
#  26aug15,brk  updates for newer boost and C11 support in VX 
#  30nov14,brk  written
#
ifndef __DEFS_VSBVARS_MK_INCLUDED
include $(WIND_KRNL_MK)/defs.vsbvars.mk
endif

ifneq ($(wildcard $(VSB_MAKE_CONFIG_FILE)),)
include $(VSB_MAKE_CONFIG_FILE)
endif

include $(WIND_USR_MK)/defs.unix.friend.mk


ifdef _WRS_CONFIG_BOOST_ATOMIC
BOOST_BUILD_WITH += --with-atomic
endif

ifdef _WRS_CONFIG_BOOST_CHRONO
BOOST_BUILD_WITH += --with-chrono
endif

# builds dlmalloc C code?
#ifdef _WRS_CONFIG_BOOST_CONTAINER
#BOOST_BUILD += --with-container
#endif

# context - TODO need logic to build correct assembly code 
ifdef _WRS_CONFIG_BOOST_CONTEXT
BOOST_BUILD_WITH += --with-context
endif

ifdef _WRS_CONFIG_BOOST_COROUTINE
BOOST_BUILD_WITH += --with-coroutine
endif

# coroutine2 - C++14 version of coroutine

ifdef _WRS_CONFIG_BOOST_DATE_TIME
BOOST_BUILD_WITH += --with-date_time
endif

ifdef _WRS_CONFIG_BOOST_EXCEPTION
BOOST_BUILD_WITH += --with-exception
endif

ifdef _WRS_CONFIG_BOOST_FILESYSTEM
BOOST_BUILD_WITH += --with-filesystem
endif

ifdef _WRS_CONFIG_BOOST_GRAPH
BOOST_BUILD_WITH += --with-graph
endif

# graph_parallel requires MPI support

ifdef _WRS_CONFIG_BOOST_IOSTREAMS
BOOST_BUILD_WITH += --with-iostreams
endif 

ifdef _WRS_CONFIG_BOOST_LOCALE
BOOST_BUILD_WITH += --with-locale
# posix backend requires a lot that VxWorks ain't got
# it uses POSIX.1-2008 extensions to C, that aren�t in our VxWorks Dinkum C libraries.
# boost_1_59_0/libs/locale/src/posix/converter.cpp
# Specifically APIs that manipulate the locale_t type.
# http://pubs.opengroup.org/onlinepubs/9699919799/functions/uselocale.html
# wcsxfrm_l,  wcscoll_l, strcoll_l, strxfrm_l
# BOOST_BUILD_EXTRA += locale/src/posix
endif 

ifdef _WRS_CONFIG_BOOST_LOG
BOOST_BUILD_WITH += --with-log
endif 

ifdef _WRS_CONFIG_BOOST_MATH
BOOST_BUILD_WITH += --with-math
#BOOST_BUILD_EXTRA += math/src/tr1
endif

# mpi requires MPI support
# (some VX partner did a MPI port, but it's not generally avalible )

ifdef _WRS_CONFIG_BOOST_PROGRAM_OPTIONS
# environ conflict
BOOST_BUILD_WITH += --with-program_options
endif 

# python requires python support

ifdef _WRS_CONFIG_BOOST_RANDOM
# looks like it needs /dev/urandom for entropy?
BOOST_BUILD_WITH += --with-random
endif 

ifdef _WRS_CONFIG_BOOST_REGEX
BOOST_BUILD_WITH += --with-regex
endif 

ifdef _WRS_CONFIG_BOOST_SERIALIZATION
BOOST_BUILD_WITH += --with-serialization
endif 

# signals is depricated (use signal2 )
# signal2 is header only 
#ifdef _WRS_CONFIG_BOOST_SIGNALS
#BOOST_BUILD += signals
#endif 

# smart_ptr has some debug hooks that require compilation

ifdef _WRS_CONFIG_BOOST_SYSTEM
BOOST_BUILD_WITH += --with-system
endif 

ifdef _WRS_CONFIG_BOOST_THREAD
BOOST_BUILD_WITH += --with-thread
#BOOST_BUILD_EXTRA += thread/src/pthread
endif

ifdef _WRS_CONFIG_BOOST_TIMER
BOOST_BUILD_WITH += --with-timer
endif 

# wave - a C++ preprocessor, I can't imagine an embbeded application for it?

ifdef _WRS_CONFIG_BOOST_TESTS
BOOST_BUILD_WITH += --with-test
endif 


.PHONY: boost_default boost_build 

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
EXTRA_DEFINE += -ei4236,4940,5386,1122,4381,4193 
BOOST_TOOL:= diab

endif

ifeq ($(TOOL),icc)
EXTRA_DEFINE += -DBOOST_NO_CXX11_HDR_INITIALIZER_LIST -CG_allow_xmm -CG_allow_x87
BOOST_TOOL:= intel-vxworks
endif

RTP_BASE_DIR = boost

LIB_BASE_NAME = boost

OBJS=$(CPP_SOURCE:.cpp=.o) 

ADDED_LIBS = -Wl,-lunix 

LIB_FORMAT:= static

include $(WIND_USR_MK)/rules.rtp.mk

include $(WIND_USR_MK)/rules.env.sh.mk

JOBS ?= 1


ifeq "$(BUILDSTAGE)" "POST_USR_BUILD_SHARED"
BOOST_BUILD_LIB_FORMAT:= link=shared 

ifdef _WRS_CONFIG_BOOST_BUILD_ALL_SHARED
BOOST_BUILD_WITH_TARGETS:= $(BOOST_BUILD_WITH)

else 
ifdef _WRS_CONFIG_BOOST_BUILD_NO_SHARED

BOOST_BUILD_WITH_TARGETS:= 

else
# _WRS_CONFIG_BOOST_BUILD_NO_MINIMAL

ifdef _WRS_CONFIG_BOOST_TESTS
BOOST_BUILD_WITH_TARGETS:= --with-system
endif 
endif
endif
else 
BOOST_BUILD_LIB_FORMAT:= link=static 
BOOST_BUILD_WITH_TARGETS:=$(BOOST_BUILD_WITH)
endif

ifeq "$(WIND_HOST_TYPE)" "x86-win32"
# Shorten paths on windows to avoid path length issues 
BOOST_WIN_WORKAROUND :=  --abbreviate-paths
endif 

ifdef BOOST_BUILD_WITH_TARGETS
boost_build: $(AUTO_INCLUDE_VSB_CONFIG_QUOTE) $(VXWORKS_ENV_SH)  $(__AUTO_INCLUDE_LIST_UFILE) 
	. ./$(VXWORKS_ENV_SH) &&      \
	./b2 install -j$(JOBS) --prefix=$(ROOT_DIR) --libdir=$(LIBDIR)/$(TOOL_COMMON_DIR) --includedir=$(VSB_DIR)/usr/h/public   \
		   $(BOOST_BUILD_LIB_FORMAT) toolset=$(BOOST_TOOL) cross-compile=vxworks  $(BOOST_WIN_WORKAROUND)   \
		   $(BOOST_BUILD_WITH_TARGETS) -q -d2
else
boost_build:
	$(info No BOOST libraries are selected, nothing will be built) 
endif