#
#  Copyright (c) 2019    European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
#
# Author  : Jeong Han Lee
# email   : jeonghan.lee@gmail.com
# Date    : Tuesday, November 26 16:30:16 CET 2019
# version : 0.0.3
#

## The following lines are mandatory, please don't change them.
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS


APP:=
APPSRC:=lib
APPINC:=include
TSCMON:=src/TscMon

USR_INCLUDES += -I$(where_am_I)/$(APPINC)

HEADERS     += $(wildcard $(where_am_I)/include/*.h)

# libadc
ADCLIB_SRCS += $(APPSRC)/adc3110lib.c
ADCLIB_SRCS += $(APPSRC)/adc3112lib.c
ADCLIB_SRCS += $(APPSRC)/adc3117lib.c
ADCLIB_SRCS += $(APPSRC)/adc3210lib.c
ADCLIB_SRCS += $(APPSRC)/adclib.c
# libtsc
TSCLIB_SRCS += $(APPSRC)/clilib.c
TSCLIB_SRCS += $(APPSRC)/fbi1482lib.c
TSCLIB_SRCS += $(APPSRC)/fscope3112lib.c
TSCLIB_SRCS += $(APPSRC)/gscope3110lib.c
TSCLIB_SRCS += $(APPSRC)/gscopelib.c
TSCLIB_SRCS += $(APPSRC)/i2ceepromlib.c
TSCLIB_SRCS += $(APPSRC)/mtca4amclib.c
TSCLIB_SRCS += $(APPSRC)/mtca4rtmlib.c
TSCLIB_SRCS += $(APPSRC)/pca9539lib.c
TSCLIB_SRCS += $(APPSRC)/ponmboxlib.c
TSCLIB_SRCS += $(APPSRC)/rcc1466lib.c
TSCLIB_SRCS += $(APPSRC)/rcf1450lib.c
TSCLIB_SRCS += $(APPSRC)/rdt1465lib.c
TSCLIB_SRCS += $(APPSRC)/rsp1461lib.c
TSCLIB_SRCS += $(APPSRC)/tscextlib.c
TSCLIB_SRCS += $(APPSRC)/tsculib.c
TSCLIB_SRCS += $(APPSRC)/tstlib.c


SOURCES += $(ADCLIB_SRCS)
SOURCES += $(TSCLIB_SRCS)


.PHONY: vlibs db

db:

vlibs:


