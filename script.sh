#!/bin/bash

#Getting the kernel source
git clone --depth=1 https://github.com/OPTIMALGLADIUS/android_kernel_6.1_nothing_mt6878.git -b mt6878/Tetris/v cmf1

#Building kernel with full LTO
tools/bazel build //common:kernel_aarch64_dist

#Packing the out directory
zip -r kernel.zip /home/runner/work/Android-kernel-compile/Android-kernel-compile/build/out
