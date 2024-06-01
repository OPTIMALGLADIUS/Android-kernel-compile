#!/bin/bash

#This is to add the additional architecture to get necessary packages
sudo dpkg --add-architecture i386

#This is so that the packages are updated before moving ahead
sudo apt update && sudo apt upgrade -y

#This is to install necessary packages
sudo apt install git ccache automake cpio flex lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx-doc libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng maven libssl-dev pwgen libswitch-perl policycoreutils minicom libxml-sax-base-perl libxml-simple-perl bc libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev xsltproc unzip -y

#Going to kernel directory
cd

#Downloading necessary package for Google Drive
pip3 install gdown

#Downloading kernel
gdown https://drive.google.com/uc?id=1NmtDxeqYg5M-gsybfdsD5COJA97kTUiT

#Extracting kernel
tar -xf kernel-4.19.127.tar.gz

#Downloading a crucial config file
wget https://download1649.mediafire.com/n20wnv956itgZYiz8_gdtZ8v1LyI_h35e3unUdgXS9PtF0OdLPrkvPHx0xr8YhiOPnWvdyC_bsL33dWJEMULWkHBguzautwD-6ohmNHN5dpQiPyDQwwe_7pcMkGW-Pkd9JyyRb7CcP4Xl6OIs2cl7J51vGvGxkO1wfWAMXe_kJ4K/andty4h43p3y4t4/config

#Going to kernel directory
cd kernel-4.19

#Making the defconfig
make ARCH=arm64 CC=$PWD/../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$PWD/../prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9.1/bin/aarch64-linux-androidkernel- O=out tb8768tp1_64_bsp_defconfig

#Editing config file
cp ../config out/.config

#Making kernel
make ARCH=arm64 CC=$PWD/../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$PWD/../prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9.1/bin/aarch64-linux-androidkernel- O=out -j$(nproc --all)
