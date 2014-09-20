ifeq (psd_moto_msm8960,$(TARGET_PRODUCT))

# Use 4.9.x for the kernel
GCC_VERSION_ARM := 4.9
# Override ARM settings
SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (SM-Toolchain) (SaberMod%),$(SM_ARM)),)
# GCC Colors only works on gcc >=4.9.x
export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
SM_ARM_VERSION := $(filter 4.8 4.8.% 4.9 4.9.% 4.10 4.10.%,$(SM_ARM))
SM_ARM_NAME := $(filter (SM-Toolchain) (SaberMod%),$(SM_ARM))
SM_ARM_DATE := $(filter 20130% 20131% 20140% 20141%,$(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
ifeq ($(filter (SaberMod%),$(SM_ARM)),)
SM_ARM_VERSION := $(SM_ARM_NAME)_$(SM_ARM_VERSION)_$(SM_ARM_DATE)-$(SM_ARM_STATUS)
else
SM_ARM_VERSION := $(SM_ARM_NAME)-$(SM_ARM_DATE)-$(SM_ARM_STATUS)
endif
endif

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Add other categories to common list to pass onto build repo
DISABLE_STRICT_MODULES += \
		$(DISABLE_STRICT_QCOM) \
		mm-vdec-omx-test \
		mm-video-driver-test \
		libOmxVdec \
		libqcomvisualizer \
		audio.primary.msm8960 \
		audio_policy.msm8960 

# Set -fstrict-aliasing flag to global
MAKE_STRICT_GLOBAL := true

# Enable memory optimization
OPT_MEMORY := true

#Enable Graphite OPT
ENABLE_GRAPHITE := false

# Call pa device
$(call inherit-product, vendor/pa/products/pa_moto_msm8960.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/moto_msm8960/full_moto_msm8960.mk)

# Override AOSP build properties
PRODUCT_DEVICE := moto_msm8960
PRODUCT_NAME := psd_moto_msm8960
PRODUCT_BRAND := motorola
PRODUCT_MODEL := MOTOROLA MSM8960
PRODUCT_MANUFACTURER := motorola

endif

