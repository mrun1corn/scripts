git clone https://github.com/mrun1corn/device_google_redbull -b lineage-20 device/google/redbull
git clone https://github.com/mrun1corn/device_google_bramble -b lineage-20 device/google/bramble
git clone https://github.com/TheMuppets/proprietary_vendor_google_bramble.git -b lineage-20 vendor/google/bramble
git clone https://github.com/LineageOS/android_kernel_google_redbull -b lineage-20 kernel/google/redbull

rm -rf hardware/qcom/sm7250/display/
rm -rf hardware/qcom-caf/wlan/
rm -rf hardware/qcom/sm7250/media/
git clone https://github.com/LineageOS/android_hardware_qcom_sm7250_display -b lineage-20  hardware/qcom/sm7250/display/
git clone https://github.com/PixelExperience/hardware_qcom-caf_wlan -b thirteen  hardware/qcom-caf/wlan/
git clone https://github.com/LineageOS/android_hardware_qcom_sm7250_media -b lineage-20.0 hardware/qcom/sm7250/media/
