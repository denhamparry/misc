# Wifi driver

## Setup

- Update  `/etc/apt/sources.list`
  - For more information regarding [sources list](https://wiki.debian.org/SourcesList?action=show&redirect=sources.list)

```sh
$ sudo vi /etc/apt/sources
```

```txt
# See https://wiki.debian.org/SourcesList for more information.
deb http://deb.debian.org/debian buster main contrib non-free
deb-src http://deb.debian.org/debian buster main contrib non-free

deb http://deb.debian.org/debian buster-updates main contrib non-free
deb-src http://deb.debian.org/debian buster-updates main contrib non-free

deb http://security.debian.org/debian-security/ buster/updates main contrib non-free
deb-src http://security.debian.org/debian-security/ buster/updates main contrib non-free

deb http://deb.debian.org/debian buster-backports main contrib non-free
deb-src http://deb.debian.org/debian buster-backports main contrib non-free
```

- Update packages

- Setup Nvidia driver

```sh
$ sudo apt install nvidia-driver
$ sudo reboot
```

- Update Kernel

```sh
$ sudo apt -t buster-backports install linux-image-amd64
$ sudo reboot
```

- Check Kernel

```sh
$ uname -r
$ apt search linux-headers-$(uname -r)
$ ls -l /usr/src/linux-headers-$(uname -r)
$ sudo apt update
$ sudo apt install linux-headers-$(uname -r)
$ ls -l /usr/src/linux-headers-$(uname -r)
```

- Reboot

```sh
$ sudo dmesg -l err
$ sudo apt install firmware-misc-nonfree
```

- Install network firmware

*NOTE* note still missing wifi and bluetooth

```sh
$ tempdir=$(mktemp -d)
$ cd $tempdir
$ sudo apt-get install git build-essential
$ git clone https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git
$ cd backport-iwlwifi
$ make defconfig-iwlwifi-public
$ sed -i 's/CPTCFG_IWLMVM_VENDOR_CMDS=y/# CPTCFG_IWLMVM_VENDOR_CMDS is not set/' .config
$ make -j4
$ sudo make install
$ sudo reboot
```

- Fallback option on above

```sh
$ tempdir=$(mktemp -d)
$ cd $tempdir
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
$ cd linux-firmware
$ cp iwlwifi-cc-a0-4* /lib/firmware
```

## Review references

- [Missing package](https://packages.debian.org/sid/firmware-misc-nonfree)


## Tests

```sh
sudo add-apt-repository ppa:canonical-hwe-team/backport-iwlwifi
sudo apt-get update
sudo apt install backport-iwlwifi-dkms
```