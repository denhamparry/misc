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
