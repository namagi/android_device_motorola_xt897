#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product, device/motorola/msm8960_jbbl-common/msm8960.mk)

LOCAL_PATH := device/motorola/xt897

# xt897 specific overlay
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

# NFC
PRODUCT_PACKAGES += \
    nfc.msm8960

# Alternate optional key maps
PRODUCT_PACKAGES += \
    AsantiKeypad

# Camera (Snap Camera App)
PRODUCT_PACKAGES += \
    Snap

PRODUCT_PACKAGES += \
    iozone

# Unlock for US GSM
PRODUCT_PACKAGES += \
    unlock-us-gsm

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=1 \
    ro.config.svdo=true \
    ro.config.svlte1x=true \
    ro.cdma.nbpcd=0 \
    ro.telephony.default_network=10 \
    ro.cdma.subscription=1 \
    DEVICE_PROVISIONED=1

# Low RAM device optimizations
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.low_ram=true \
    persist.sys.force_highendgfx=true \
    config.disable_atlas=true \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.bg_apps_limit=16

$(call inherit-product, device/motorola/qcom-common/modules/nfc/nfc.mk)
$(call inherit-product, vendor/motorola/xt897/xt897-vendor.mk)

