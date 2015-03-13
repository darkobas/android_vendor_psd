ifeq (psd_bacon,$(TARGET_PRODUCT))

# Use 4.x for the kernel
GCC_VERSION_ARM := 4.8
# Override ARM settings
SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (UBERTC) (UBERTC%),$(SM_ARM)),)
# GCC Colors only works on gcc >=4.9.x
export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
SM_ARM_VERSION := $(filter 4.8 4.8.% 4.9 4.9.% 4.10 4.10.%,$(SM_ARM))
SM_ARM_NAME := $(filter (UBERTC) (UBERTC%),$(SM_ARM))
SM_ARM_DATE := $(filter 20150% 20151% 20140% 20141%,$(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
ifeq ($(filter (UBERTC%),$(SM_ARM)),)
SM_ARM_VERSION := $(SM_ARM_NAME)_$(SM_ARM_VERSION)_$(SM_ARM_DATE)-$(SM_ARM_STATUS)
else
SM_ARM_VERSION := $(SM_ARM_NAME)-$(SM_ARM_DATE)-$(SM_ARM_STATUS)
endif
endif

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif

# Set -fstrict-aliasing flag to global for hammerhead
#MAKE_STRICT_GLOBAL := true
#GRAPHITE_OPTS := true
#FLOOP_NEST_OPTIMIZE := true
#STRICT_ALIASING :=true
#KRAIT_TUNINGS := true
include vendor/psd/configs/psd_modular.mk


# Inherit telephony common stuff
$(call inherit-product, vendor/psd/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/psd/main.mk

# Inherit device configuration
$(call inherit-product, device/oneplus/bacon/full_bacon.mk)

# next camera
CAMERA_NEXT := true
PRODUCT_PACKAGES += \
    CameraNext

# Override AOSP build properties
PRODUCT_NAME := psd_bacon
PRODUCT_DEVICE := bacon
PRODUCT_BRAND := Oneplus
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := Oneplus

# Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=bacon TARGET_DEVICE=bacon

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

endif
