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

# We optimize for cortex-a15 since krait is closer to a15 than a9
# and slightly benefits in testing done.

TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_EXTRA_CFLAGS := -mtune=cortex-a15 -mcpu=cortex-a15
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_ARMV7A := true
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_VARIANT := cortex-a15
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true

BOARD_VENDOR := lge

## Enable Loki Recovery
ENABLE_LOKI_RECOVERY := true

# Compiler Optimizations
ARCH_ARM_HIGH_OPTIMIZATION := true

## TWRP Flags
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_USE_CUSTOM_RECOVERY_FONT:= \"roboto_15x24.h\"
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
RECOVERY_SDCARD_ON_DATA := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
# I'll enable this later just for ext_sd
TW_NO_USB_STORAGE := true
TW_NO_EXFAT := true
BOARD_HAS_LARGE_FILESYSTEM := true
# disable SD partitioning
BOARD_HAS_NO_REAL_SDCARD := true
# Enable various prefetch optimizations
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

#Include our own header for camera hal
TARGET_SPECIFIC_HEADER_PATH := device/lge/geefhd-common/include

# Camera
COMMON_GLOBAL_CFLAGS += -DLG_CAMERA_HARDWARE
USE_CAMERA_STUB := true

BOARD_USES_ALSA_AUDIO:= true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_HAVE_LOW_LATENCY_AUDIO := true

TARGET_PROVIDES_LIBLIGHT := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno320
TARGET_BOOTLOADER_BOARD_NAME := geefhd

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/geefhd-common/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/lge/geefhd-common/bluetooth/vnd_geefhd.txt

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/etc/firmware/fw_bcmdhd_p2p.bin"

#Ril
BOARD_RIL_CLASS := ../../../device/lge/geefhd-common/ril

# Flags 
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP_CAMERA_ABI_HACK

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
TARGET_QCOM_DISPLAY_VARIANT := caf
#TARGET_QCOM_AUDIO_VARIANT := caf
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := true
BOARD_EGL_CFG := device/lge/geefhd-common/configs/egl.cfg

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 880803840 # 840M

BOARD_USERDATAIMAGE_PARTITION_SIZE := 6189744128 # 5.9G
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_USES_SECURE_SERVICES := true

BOARD_USES_EXTRA_THERMAL_SENSOR := true
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lge/geefhd-common/vibrator/vibrator.c

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

#Preload Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true

BOARD_HAS_NO_SELECT_BUTTON := true

# Charger
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'

BOARD_SEPOLICY_DIRS += \
        device/lge/geefhd-common/sepolicy

BOARD_SEPOLICY_UNION += \
	file_contexts \
	property_contexts \
	te_macros \
	bluetooth_loader.te \
	bridge.te \
	camera.te \
	conn_init.te \
	device.te \
	dhcp.te \
	domain.te \
	drmserver.te \
	file.te \
	kickstart.te \
	init.te \
	mediaserver.te \
	mpdecision.te \
	netmgrd.te \
	property.te \
	qmux.te \
	rild.te \
	rmt.te \
	sensors.te \
	surfaceflinger.te \
	system.te \
	tee.te \
	thermald.te \
	ueventd.te \
	wpa_supplicant.te
