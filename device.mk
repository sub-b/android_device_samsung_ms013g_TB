# Copyright (C) 2014 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/matissewifi

PRODUCT_CHARACTERISTICS := tablet

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Proprietary files
$(call inherit-product, vendor/samsung/ms013g/ms013g-vendor.mk)

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.carrier.rc \
    init.crda.sh \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

# Ramdisk
#PRODUCT_PACKAGES += \
#    init.crda.sh \
#    init.qcom.bt.sh

#PRODUCT_PACKAGES += \
#    fstab.qcom \
#    init.qcom.rc \
#    init.qcom.usb.rc \
#    ueventd.qcom.rc

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf

# Wifi
PRODUCT_PACKAGES += \
    hostapd_default.conf \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp

# Override build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    ro.carrier=wifi-only

# Inherit from qcom-common
$(call inherit-product, device/samsung/msm8226-common/msm8226.mk)
