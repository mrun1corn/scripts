echo Initializing repo to rom 
cd /home/mrun1corn/rom/
mkdir omni
cd omni
echo Working direcory $(pwd)

# git config
echo COnfiguring git
git config --global user.email robinisalegend01@gmail.com && git config --global user.name MrUn1corn

# repo init
echo initializing rom repo

repo init --depth=1 --no-repo-verify -u https://github.com/omnirom/android.git -b android-12.1 -g default,-mips,-darwin,-notdefault

# repo sync

echo initializing repo sync, take rest

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)


# Clone hals 
# Remove Default Hals
rm -rf hardware/qcom-caf/wlan
rm -rf hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/media
rm -rf hardware/qcom-caf/msm8996/display
# Redownload Hals
git clone https://github.com/bibarub/hardware_qcom_wlan -b 12.x hardware/qcom-caf/wlan
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-19.1-caf-msm8996 hardware/qcom-caf/msm8996/audio
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-19.1-caf-msm8996 hardware/qcom-caf/msm8996/media
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-19.1-caf-msm8996 hardware/qcom-caf/msm8996/display

# Download Kernel
git clone https://github.com/LineageOS/android_kernel_xiaomi_onclite -b lineage-19.1 kernel/xiaomi/onclite

#Download Vendor
https://github.com/mrun1corn/android_vendor_xiaomi_onclite.git -b twelve vendor/xiaomi/onclite
