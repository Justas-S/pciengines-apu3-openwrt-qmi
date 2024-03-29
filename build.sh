#!/bin/bash
set -e

if [ "$#" -lt 2 ]; then
    echo "Usage $0 [openwrt version]  [arch]";
    exit 1;
fi
openwrtVersion="$1"
arch="$2"
archPath="$(echo $arch | sed s/-/\\//)"

sudo apt install -y build-essential libncurses-dev zlib1g-dev gawk git gettext libssl-dev xsltproc rsync wget unzip python3 python3-distutils

wget "https://downloads.openwrt.org/releases/$openwrtVersion/targets/$archPath/openwrt-imagebuilder-$openwrtVersion-$arch.Linux-x86_64.tar.xz"
tar -J -x -f openwrt-imagebuilder-*.tar.xz
cd openwrt-imagebuilder-*/

make image PACKAGES="luci luci-ssl qmi-utils kmod-usb-net-qmi-wwan libqmi luci-proto-qmi uqmi"

