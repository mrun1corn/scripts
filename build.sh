echo Initializing repo to rom 
mkdir rd
cd rd

# git config
echo Configuring git
git config --global user.email robinisalegend01@gmail.com && git config --global user.name mrun1corn

# repo init
echo initializing rom repo

repo init -u https://github.com/RisingTechOSS/android -b thirteen --git-lfs

# repo sync

echo Initializing repo sync, take rest

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)


# Clone hals 
# Remove Default Hals
rm -rf hardware/qcom-caf/wlan
rm -rf hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/media
rm -rf hardware/qcom-caf/msm8996/display
# Redownload Hals
git clone https://github.com/mrun1corn/hardware_qcom-caf_msm8996_audio.git -b 13 hardware/qcom-caf/msm8996/audio
git clone https://github.com/mrun1corn/hardware_qcom-caf_msm8996_media.git -b 12 hardware/qcom-caf/msm8996/media
git clone https://github.com/mrun1corn/hardware_qcom-caf_msm8996_display.git -b 13 hardware/qcom-caf/msm8996/display
git clone https://github.com/mrun1corn/hardware_qcom-caf_wlan.git -b 12 hardware/qcom-caf/wlan

#Download device tree
git clone https://github.com/mrun1corn/device_xiaomi_onclite -b 13-rising device/xiaomi/onclite

# Download Kernel
git clone https://github.com/mrun1corn/kernel_onclite -b 13 kernel/xiaomi/onclite

#Download Vendor
git clone https://github.com/mrun1corn/android_vendor_xiaomi_onclite.git -b 13-fp3 vendor/xiaomi/onclite

#Clone clang
git clone --depth=1 https://github.com/kdrag0n/proton-clang.git -b master prebuilts/clang/host/linux-x86/clang-proton

#start build
source build/envsetup.sh
lunch lineage_onclite-userdebug && make bacon 

