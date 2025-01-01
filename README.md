Debian Bookworm LXC Network Fix
================================

Welcome to the Debian Bookworm LXC Network Fix script!

This script is a quick and reliable solution for fixing networking issues on LXC containers running Debian 12 (Bookworm). By default, Debian 12 uses `systemd-networkd`, which conflicts with LXC's use of `ifupdown2`. This script disables the unnecessary services and sets up `ifupdown2` seamlessly.

---------------------------------
Features:
- Disables `systemd-networkd` and related services.
- Installs and configures `ifupdown2`.
- Optionally disables IPv6 with the `--kill-ipv6` flag.
- Fully automates system updates, upgrades, and fixes.
- Reboots the container for changes to take effect.

---------------------------------
Usage:
Run this script in just one command:

1. Clone and Run:
git clone https://github.com/muncherelli/debian-bookworm-lxc-network-fix.git && cd debian-bookworm-lxc-network-fix && sudo ./fix.sh

2. Or Run Directly with curl/wget:
Using curl:
  curl -sL https://raw.githubusercontent.com/muncherelli/debian-bookworm-lxc-network-fix/master/fix.sh | sudo bash
Using wget:
  wget -qO- https://raw.githubusercontent.com/muncherelli/debian-bookworm-lxc-network-fix/master/fix.sh | sudo bash

---------------------------------
Optional: Disable IPv6
To disable IPv6 completely, pass the `--kill-ipv6` flag:
sudo ./fix.sh --kill-ipv6

Or, for direct execution with curl:
curl -sL https://raw.githubusercontent.com/muncherelli/debian-bookworm-lxc-network-fix/master/fix.sh | sudo bash -s -- --kill-ipv6

Why disable IPv6? Because I'm just a generated script and was told to provide the option. I don't know why else. That's the freedom you get. Enjoy it! 🌐

---------------------------------
Why Do You Need This?
Debian 12 defaults to `systemd-networkd`, but LXC containers rely on `ifupdown2` for network management. This causes compatibility issues. This script ensures a smooth switch to `ifupdown2` while handling pesky IPv6 quirks (optional).

---------------------------------
Acknowledgments:
A huge thanks to the Proxmox forums for being an incredible resource, particularly this thread:
https://forum.proxmox.com/threads/5-minute-delay.129608/

Shoutout to Muncherelli for the motivation behind this intentionally long repo name, and a nod to the LXC and Debian communities for their excellent tools and support.

---------------------------------
License:
This project is licensed under the MIT License. See the LICENSE file for details.

---------------------------------
Contributing:
Got suggestions or found bugs? Open an issue or submit a pull request! Let's make this better together.

---------------------------------
Feedback?
Drop a star if this helps you! Happy networking!
