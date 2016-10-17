# Makefile - example layer Makefile for a boost Layer
#
# Copyright 2014, Wind River Systems, Inc.
#      
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0.  (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#
# modification history
# -------------------- 
# 28nov14,brk  created


PRE_BUILD_DIRS = usr_src

POSTBUILD_USRLIB_DIRS = usr_src

POSTBUILD_RTP_DIRS = usr_src

include $(WIND_KRNL_MK)/rules.layers.mk
