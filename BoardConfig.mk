#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#BOARD_KERNEL_CMDLINE := console=ttySHL0,115200,n8 androidboot.hardware=gkatt lpj=67677
BOARD_KERNEL_CMDLINE := vmalloc=600M console=ttyHSL0,115200,n8 lpj=67677 user_debug=31 msm_rtb.filter=0x0 ehci-hcd.park=3 coresight-etm.boot_enable=0 androidboot.hardware=gkatt uart_console=disable lge.rev=rev_10 lcd_maker_id=primary lge.hreset=off, lge.reset=rst_etc gpt=enable logoentry=0x77665501+0+0 lge.batt_info=ds2704_l lge.crash=0x0 lge.crash_enable=0x0
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
#BOARD_FORCE_RAMDISK_ADDRESS := 0x82200000

TARGET_KERNEL_CONFIG := gkatt_bcm-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/lge/geefhd

# inherit from gee-common
-include device/lge/gee-common/BoardConfigCommon.mk

# assert
TARGET_OTA_ASSERT_DEVICE := gkatt

# board-info
TARGET_BOARD_INFO_FILE := device/lge/gkatt/board-info.txt

# inherit from the proprietary version
-include vendor/lge/gee/BoardConfigVendor.mk
