#!/bin/bash

#1) Find the $menuentry_id_option for the submenu:
grep submenu /boot/grub/grub.cfg

#2) Find the $menuentry_id_option for the menu entry for the kernel you want to use:
# grep gnulinux /boot/grub/grub.cfg

#3) Comment out your current default grub in /etc/default/grub
# GRUB_DEFAULT="gnulinux-advanced-38ea4a12-6cfe-4ed9-a8b5-036295e62ffc>gnulinux-4.18.0-0.bpo.1-amd64-advanced-38ea4a12-6cfe-4ed9-a8b5-036295e62ffc"

#4) Update grub to make the changes. For Debian this is done like so:
# sudo update-grub

#5) Check
# uname -a

#6) Reset to default
# GRUB_DEFAULT=0
