#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Enable Wi-Fi
sed -i 's/wireless.radio${devidx}.disabled=1/wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify SSID
sed -i 's/wireless.default_radio${devidx}.ssid=OpenWrt/wireless.default_radio${devidx}.ssid=RedmiAC2100/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify TimeZone
sed -i 's/system.@system[-1].timezone='UTC'/system.@system[-1].timezone='Kuala Lumpur'/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/RedmiAC2100/g' package/base-files/files/bin/config_generate

# Add kernel build user
sed -i 's/CONFIG_KERNEL_BUILD_USER=""/CONFIG_KERNEL_BUILD_USER="SolomonRicky"/g' .config

# Add kernel build domain
sed -i 's/CONFIG_KERNEL_BUILD_DOMAIN=""/CONFIG_KERNEL_BUILD_DOMAIN="yzyz.ga"/g' .config

# Add build information
echo -e '\nOpenWrt by SolomonRicky\n'  >> package/base-files/files/etc/banner
sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
# echo "DISTRIB_REVISION='v21.02.0-rc3'" >> package/base-files/files/etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt by SolomonRicky $(date "+%Y.%m.%d")'" >> package/base-files/files/etc/openwrt_release

# Modify banner
sed -i "s/OpenWrt/Redmi AC2100's Openwrt/g" files/etc/banner