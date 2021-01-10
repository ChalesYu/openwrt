#
# Copyright (C) 2020-2021 ChalesYu <574249312@qq.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

ARCH:=arm
SUBTARGET:=meson8b
BOARDNAME:=Amlogic S805 boards (32 bit)
CPU_TYPE:=cortex-a5
CPU_SUBTYPE:=vfpv4
MAINTAINER:=ChalesYu <574249312@qq.com>

define Target/Description
	Build firmware image for Trash Amlogic S805 SoC devices.
	This firmware features a 32 bit kernel.
endef

