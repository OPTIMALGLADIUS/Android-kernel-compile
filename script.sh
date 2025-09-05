#!/bin/bash

#Synchronize Google's kernel toolchains
repo --trace sync -c -j$(nproc --all) --no-tags --fail-fast

#Getting the kernel source
git clone --depth=1 https://github.com/OPTIMALGLADIUS/android_kernel_6.1_nothing_mt6878.git -b mt6878/Tetris/v cmf1

#Building kernel with full LTO
tools/bazel build //cmf1:kernel_aarch64_dist

#Packing the out directory
zip -r kernel.zip /home/runner/work/Android-kernel-compile/Android-kernel-compile/build/bazel-bin/cmf1
