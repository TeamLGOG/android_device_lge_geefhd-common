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

# This file includes all definitions that apply to ALL geefhd-common devices, and
# are also specific to geefhd-common devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS += device/lge/geefhd-common/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES := \
    charger_res_images \
    charger

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Enable Torch
PRODUCT_PACKAGES += Torch

# Ramdisk
PRODUCT_COPY_FILES += \
        device/lge/geefhd-common/ramdisk/init.geefhd.rc:root/init.geefhd.rc \
        device/lge/geefhd-common/ramdisk/init.geefhd.usb.rc:root/init.geefhd.usb.rc \
        device/lge/geefhd-common/ramdisk/init.qcom.sh:root/init.qcom.sh \
        device/lge/geefhd-common/ramdisk/fstab.geefhd:root/fstab.geefhd

# Camera BINs
PRODUCT_COPY_FILES += \
        device/lge/geefhd-common/camera/CE170F00.bin:root/sbin/CE170F00.bin \
        device/lge/geefhd-common/camera/CE170F01.bin:root/sbin/CE170F01.bin \
        device/lge/geefhd-common/camera/CE170F02.bin:root/sbin/CE170F02.bin \
        device/lge/geefhd-common/camera/CE170F03.bin:root/sbin/CE170F03.bin

# WiFi
PRODUCT_COPY_FILES += \
        device/lge/geefhd-common/wifimac/wlan-precheck:system/bin/wlan-precheck \
        device/lge/geefhd-common/wifi/wpa_supplicant.conf:obj/etc/wifi/wpa_supplicant.conf \
        device/lge/geefhd-common/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Audio SND SOC Config
PRODUCT_COPY_FILES += \
	device/lge/geefhd-common/snd_soc_msm/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

# Audio Policy Config
PRODUCT_COPY_FILES += \
        device/lge/geefhd-common/configs/audio_policy.conf:system/etc/audio_policy.conf \

# Thermal Daemon
PRODUCT_COPY_FILES += \
	device/lge/geefhd-common/configs/thermald-geefhd-common.conf:system/etc/thermald.conf

# EGL Config
PRODUCT_COPY_FILES += \
        device/lge/geefhd-common/configs/egl.cfg:system/lib/egl/egl.cfg

# Media
PRODUCT_COPY_FILES += \
	device/lge/geefhd-common/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/lge/geefhd-common/configs/media_codecs.xml:system/etc/media_codecs.xml 

# Non-Ramdisk Init Scripts
PRODUCT_COPY_FILES += \
	device/lge/geefhd-common/scripts/kickstart_checker.sh:system/etc/kickstart_checker.sh \
	device/lge/geefhd-common/scripts/init.geefhd.bt.sh:system/etc/init.geefhd.bt.sh \
	device/lge/geefhd-common/scripts/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
 	device/lge/geefhd-common/scripts/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh

# Keylayouts
PRODUCT_COPY_FILES += \
	device/lge/geefhd-common/keylayouts/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
	device/lge/geefhd-common/keylayouts/external_kbd.kl:system/usr/keylayout/external_kbd.kl \
	device/lge/geefhd-common/keylayouts/gk-keypad-8064.kl:system/usr/keylayout/gk-keypad-8064.kl \
	device/lge/geefhd-common/keylayouts/MHLRCP.kl:system/usr/keylayout/MHLRCP.kl \
	device/lge/geefhd-common/keylayouts/osp3-input.kl:system/usr/keylayout/osp3-input.kl 

# Input calibration
PRODUCT_COPY_FILES += \
	device/lge/geefhd-common/input/touch_dev.idc:system/usr/idc/touch_dev.idc \
	device/lge/geefhd-common/input/osp3-input.idc:system/usr/idc/osp3-input.idc

# Liblight
PRODUCT_PACKAGES += \
	lights.msm8960

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# NFC packages geehrc for geefhd-common
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/lge/geefhd-common/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/lge/geefhd-common/nfc/nfcee_access_debug.xml
endif

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += \
        packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Script for baseband name resolution
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fetch-swv:system/bin/fetch-swv

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=480

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic=digital \
	persist.audio.fluence.mode=endfire \
        persist.audio.lowlatency.rec=false \
	af.resampler.quality=4

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
        persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=0

# Custom RILJ
PRODUCT_PROPERTY_OVERRIDES += \
        ro.telephony.ril_class=LgeLteRIL \
        ro.telephony.ril.v3=qcomdsds

# Our Modem responds slowly
PRODUCT_PROPERTY_OVERRIDES += \
        ro.telephony.slowModem=1

# RIL properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        rild.libpath=/system/lib/libril-qc-qmi-1.so \
        telephony.lteOnCdmaDevice=0 \
        ro.telephony.default_network=9 \
        telephony.lteOnGsmDevice=1

#Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += persist.hwc.mdpcomp.enable=true

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960

PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

PRODUCT_PACKAGES += \
	power.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
        libmm-omxcore \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libstagefrighthw \
	libc2dcolorconvert

PRODUCT_PACKAGES += \
	libloc_adapter \
	libloc_eng \
	libloc_api_v02 \
	libgps.utils \
	gps.msm8960

PRODUCT_PACKAGES += \
	bdAddrLoader \
	libwfcu \
	conn_init \
	wifimac

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=60 \
	persist.radio.kickstart=on

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
        media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	debug.prerotation.disable=1

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

BOARD_WLAN_DEVICE_REV := bcm4330_b2
WIFI_BAND := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
