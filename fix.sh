#!/bin/bash

# Function to disable IPv6
disable_ipv6() {
    echo 'Disabling IPv6...'
    echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/99-ipv6-disable.conf
    echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.d/99-ipv6-disable.conf
    echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.d/99-ipv6-disable.conf
    sysctl --system

    # Verify IPv6 is disabled
    ipv6_all=$(cat /proc/sys/net/ipv6/conf/all/disable_ipv6)
    ipv6_default=$(cat /proc/sys/net/ipv6/conf/default/disable_ipv6)
    ipv6_lo=$(cat /proc/sys/net/ipv6/conf/lo/disable_ipv6)

    if [[ "$ipv6_all" == "1" && "$ipv6_default" == "1" && "$ipv6_lo" == "1" ]]; then
        echo 'IPv6 disabled successfully.'
    else
        echo 'Error: IPv6 was not fully disabled. Check your configuration.'
        exit 1
    fi
}

# Disable and stop services
echo 'Disabling unnecessary services...'
systemctl disable --now systemd-networkd-wait-online.service
systemctl disable --now systemd-networkd.service
systemctl disable --now ifupdown-wait-online

# Update and upgrade system
echo 'Updating and upgrading system...'
apt-get update && apt-get upgrade -y

# Install ifupdown2
echo 'Installing ifupdown2...'
apt-get install -y ifupdown2

# Check for --disable-ipv6 flag
if [[ "$1" == "--disable-ipv6" ]]; then
    disable_ipv6
fi

# Reboot the system
echo 'Rebooting system...'
reboot
