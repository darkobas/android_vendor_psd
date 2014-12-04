ifneq ($(PSD_TYPE),)
        ROM_NAME := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)-$(PSD_TYPE)
        PSD_VERSION := $(PSD_TYPE)$(PSD_VERSION_MAJOR).$(PSD_VERSION_MINOR)$(PSD_VERSION_MAINTENANCE)
else
        PSD_VERSION := $(PSD_VERSION_MAJOR).$(PSD_VERSION_MINOR)$(PSD_VERSION_MAINTENANCE)
endif

export BUILD_DATE := $(shell date -u +%Y%m%d)
ifeq ($(TARGET_BUILD_VARIANT),user)
        export ODEX_BUILD := true
endif
export PSD_BUILD_NAME := $(PSD_VERSION)-$(BUILD_DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.psd.device=$(DEVICE) \
    ro.psd.version=$(PSD_VERSION) \
    ro.psd.modversion=$(PSD_BUILD_NAME)



ifneq ($ROM_VERSION_TAG,"")
        VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)-$(PA_VERSION_TAG)
else
        VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
endif

export ROM_VERSION := $(VERSION)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pa.modversion=$(ROM_VERSION) \
    ro.pa.version=$(VERSION)

