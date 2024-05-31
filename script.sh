#!/bin/bash

#This is to add the additional architecture to get necessary packages
sudo dpkg --add-architecture i386

#This is so that the packages are updated before moving ahead
sudo apt update && sudo apt upgrade -y

#This is to install necessary packages
sudo apt install git ccache automake flex lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx-doc libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng maven libssl-dev pwgen libswitch-perl policycoreutils minicom libxml-sax-base-perl libxml-simple-perl bc libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev xsltproc unzip -y

#Going to kernel directory
cd

#Downloading necessary package for Google Drive
pip3 install gdown

#Downloading kernel
gdown https://drive.google.com/uc?id=1NmtDxeqYg5M-gsybfdsD5COJA97kTUiT

#Extracting kernel
tar -xf kernel-4.19.127.tar.gz

#Going to kernel directory
cd kernel-4.19
