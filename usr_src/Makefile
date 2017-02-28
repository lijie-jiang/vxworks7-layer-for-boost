# Makefile - for boost
#
# Copyright 2014-2016 Wind River Systems, Inc.
#
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0.  (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#
# modification history
# -------------------- 
# 10oct16,brk  fix windows URL for cURL
# 24may15,brk  HLD review changes
# 26nov15,brk  use b2 build utility wrapped by vxworks_env.sh
#              (similar to autoconf/automake support,)  
#				in preperation for regression test harness support   
# 12sep15,brk  switched to tar download for unix compatiblity
# 28nov14,brk  created


include $(WIND_KRNL_MK)/defs.ver.mk

ifneq  "$(WIND_HOST_TYPE)" "x86-win32" 
PKG_URL = http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.gz/download
PKG_NAME = boost_1_59_0.tar.gz
else
PKG_URL = http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.zip/download
PKG_NAME = boost_1_59_0.zip
endif


PKG_BUILD_DIR = boost_1_59_0

PKG_BUILD_TARGETS = boost

PKG_FILE_TYPE = unpack

PRE_NOBUILD_RTPH_FILES := 

# due to boosts large size, we selectively unzip only what we need 
# (unlike other packages) 

UNTAR_FILES := --exclude $(PKG_BUILD_DIR)/boost/mpi     \
       --exclude $(PKG_BUILD_DIR)/boost/python          \
       --exclude $(PKG_BUILD_DIR)/boost/wave            \
       --exclude $(PKG_BUILD_DIR)/doc                   \
       --exclude $(PKG_BUILD_DIR)/more                  \
       $(PKG_BUILD_DIR)

UNZIP_FILES := $(PKG_BUILD_DIR)/* -x  \
        $(PKG_BUILD_DIR)/boost/mpi/*             \
        $(PKG_BUILD_DIR)/boost/python/*          \
        $(PKG_BUILD_DIR)/boost/wave/*            \
        $(PKG_BUILD_DIR)/doc/*                   \
        $(PKG_BUILD_DIR)/more/*                  

export BOOST_TEST_DIRS
export BOOST_BUILD

PKG_EXTRA_SRC := project-config.jam status/vxworks_boost_test_run.exp status/boost_test.exe

ifeq  "$(WIND_HOST_TYPE)" "x86-win32" 
PKG_EXTRA_SRC += b2.exe
else
PKG_EXTRA_SRC += b2
endif


PKG_BUILD_TARGETS:= boost

include $(WIND_KRNL_MK)/rules.unix.ports.mk
 
