# Copyright (C) 2014 ParanoidAndroid Project
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


# Add PA bootanimation based on xxhdpi xhdpi hdpi tvdpi resolution


# PA XXHDPI Devices
ifneq ($(filter psd_bacon pa_d801 psd_d802 pa_d850 pa_d851 pa_d852 pa_honami pa_find5 pa_find7 pa_find7u pa_hlte pa_i9500 pa_jflte pa_ls980 pa_m7 pa_m7spr pa_m7vzw pa_m8 pa_n1 pa_odin pa_sirius pa_vs980 pa_yuga,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/psd/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif
