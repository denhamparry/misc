# Bluetooth driver

- Check drivers that are not installed

```sh
$ sudo dmesg -l err
```

- Search driver name on Google, download and download `.deb` (in directory)
- Mount onto Debian laptop

```sh
$ sudo mount /dev/sda1 /mnt/public
```

- Install the package

```
$ sudo dpkg -i firmware-iwlwifi_20190717-2_bpo10+1_all.deb
```
