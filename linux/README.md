# Linux

## Debugging

```bash
$ sudo dmesg
$ sudo dmesg -l err
```

## Drives

```bash
$ lsblk
```

## Check Kernel

```
$ uname -r
$ cat /proc/version
$ hostnamectl | grep Kernel
```

## Make boot disk

- Copy image

```sh
$ sudo dd bs=4M if=/Downloads/debian-image.iso of=/dev/sdb3 status=progress && sync
```

## Make boot disk

- Copy image

```sh
$ sudo dd bs=4M if=/Downloads/debian-image.iso of=/dev/sdb3 status=progress && sync
```

## USB Drive

- [Reference](https://www.redips.net/linux/create-fat32-usb-drive/)

## Run script on boot

```bash
$ sudo touch /etc/rc.local
$ sudo chmod 755 /etc/rc.local
```

```sh
#!/bin/sh -e
# This script is executed at the end of each multiuser runlevel

/path/to/my/script  

exit 0
```
