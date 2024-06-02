#Adding required architecture
sudo dpkg --add-architecture i386

#Updating and upgrading repository and packages
sudo apt update && sudo apt upgrade -y

#Going to home directory
cd

#Downloading necessary packages
sudo apt install git ccache automake flex lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx-doc libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng maven libssl-dev pwgen libswitch-perl policycoreutils minicom libxml-sax-base-perl libxml-simple-perl bc libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev xsltproc unzip -y

#Downloading gdown
pip3 install gdown

#Downloading kernel
gdown https://drive.google.com/uc?id=1NmtDxeqYg5M-gsybfdsD5COJA97kTUiT

#Downloading necessary config
gdown https://drive.google.com/uc?id=1QskASJX1dT53l0oHP62iwN3RqqyNeROx

#Extracting kernel
tar -xf kernel-4.19.127.tar.gz

#Going to kernel directory
cd kernel-4.19

#Copying config
cp ../config arch/arm64/configs/tb8768tp1_64_bsp_defconfig

#Making defcinfig
make O=out ARCH=arm64 CC=$PWD/../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$PWD/../prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9.1/bin/aarch64-linux-androidkernel- tb8768tp1_64_bsp_defconfig

#Making modules
make O=out ARCH=arm64 CC=$PWD/../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$PWD/../prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9.1/bin/aarch64-linux-androidkernel- modules