
### Script(and Action) to build OpenWrt for PC Engines APU3 with an 4G QMI module

OpenWrt supports using an [LTE modem for Wan access](https://openwrt.org/docs/guide-user/network/wan/wwan/ltedongle) however it requires additional packages. This repository provides a build script to build an OpenWrt image with those packages installed ready to be flashed onto OpenWrt-compatible device

[This change](https://forum.openwrt.org/t/solved-lte-qmi-troubles/28379/26) may also be necessary to get the interface up and running
