#!/bin/bash
set -ex

if [ "$#" -lt 2 ]; then
    echo "Usage $0 [openwrt version]  [arch]";
    exit 1;
fi
openwrtVersion="$1"
arch="$2"
archPath="$(echo \"$arch\" | sed s/-/\\//)"

echo "$arch -> $archPath";
exit 0;

sudo apt install -y build-essential libncurses5-dev libncursesw5-dev zlib1g-dev gawk git gettext libssl-dev xsltproc rsync wget unzip python

wget https://downloads.openwrt.org/releases/21.02.2/targets/x86/64/openwrt-imagebuilder-21.02.2-x86-64.Linux-x86_64.tar.xz
tar -J -x -f openwrt-imagebuilder-*.tar.xz
cd openwrt-imagebuilder-*/

make image PACKAGES="luci luci-ssl qmi-utils kmod-usb-net-qmi-wwan libqmi luci-proto-qmi uqmi"

