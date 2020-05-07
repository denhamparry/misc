# Todo

## Setup

- [Onboarding Checklist](https://docs.google.com/document/d/1qDVqq3wS-5SHcBhgPtHdhQWzsCTCM_KRG4z1y_xausw/edit?ts=5e4bfc86#)

### Yubikey

- [Setup](https://github.com/drduh/YubiKey-Guide)

### Thinkpad X1 Extreme

- [References](https://wiki.debian.org/InstallingDebianOn/Thinkpad/X1%20Extreme%20Gen%201)

### Debian Live

https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/10.3.0-live+nonfree/amd64/iso-hybrid/

### USB

```sh
$ sudo fdisk /dev/sdb
Welcome to fdisk (util-linux 2.33.1).

Command (m for help): o
Created a new DOS disklabel with disk identifier 0xeac7ee35.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

```sh
$ sudo fdisk /dev/sdb
Welcome to fdisk (util-linux 2.33.1).

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p):
Partition number (1-4, default 1):
First sector (2048-62980095, default 2048):
Last sector, +sectors or +size{K,M,G,T,P} (2048-62980095, default 62980095): +25M

Created a new partition 1 of type 'Linux' and of size 25 MiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

### WiFi Setup

#### Find the device

```sh
$ lspci | grep -i net
<<TOADD>>
```

#### References

- [Reference](https://wiki.debian.org/WiFi#Simple_guide)
- [Reference](https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi/core_release?fbclid=IwAR0A8p9rN6w7DrLE9MzNzRG7oq83XF2xOvsI5Hgp_W9sgemOYepwArHOrAY)
- [Reference](https://forum.mxlinux.org/viewtopic.php?f=104&t=52010)

### Disk Management

```sh
$ lsblk
```

#### Install Kernel Headers

```sh
$ uname -r
$ apt search linux-headers-$(uname -r)
$ ls -l /usr/src/linux-headers-$(uname -r)
$ sudo apt install linux-headers-$(uname -r)
```

## Find list of missing drivers

```
$ dmesg -l err
[    1.959119] i915 0000:00:02.0: firmware: failed to load i915/kbl_dmc_ver1_04.bin (-2)
[    1.959122] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[    1.964859] nouveau 0000:01:00.0: unknown chipset (167000a1)
[    4.101063] tpm tpm0: [Firmware Bug]: TPM interrupt not working, polling instead
[    4.191926] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
[    4.315472] bluetooth hci0: firmware: failed to load intel/ibt-20-1-3.sfi (-2)
[    4.315500] Bluetooth: hci0: Failed to load Intel firmware file (-2)
[    5.610047] irq 48: nobody cared (try booting with the "irqpoll" option)
[    5.610084] handlers:
[    5.610087] [<00000000943bbc8c>] tis_int_handler [tpm_tis_core]
```

## Logs

- Ran `make` on cp, copied bin files across
- Ran `bash install base`, installed as expected
- Tested some packages
  - Found out that `fortune | cowsay | lolcat` returned values in Spanish
  - Fixed with `fortune debian-hints | cowsay | lolcat`

## References

- [fzf](https://github.com/junegunn/fzf/)
