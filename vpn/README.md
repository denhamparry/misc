# VPN

## Setup

```sh
$ sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp
$ sudo apt-get update
$ sudo apt-get install network-manager-l2tp  network-manager-l2tp-gnome
$ sudo apt-get install libreswan
$ sudo rm -f /etc/ipsec.d/nm-l2tp-ipsec*.secrets
```

- VPN > IPSec Settings

```txt
Phase1 Algorithms : 3des-sha1;modp1024
Phase2 Algorithms : 3des-sha1
```

## Logging

```sh
$ journalctl -u NetworkManager.service | tail -40
```

## Remove

```sh
$ sudo apt-get remove network-manager-l2tp  network-manager-l2tp-gnome libreswan
$ sudo apt autoclean
```

## Referencecs

- [How to Setup an L2TP/IPsec VPN Client on Linux](https://www.tecmint.com/setup-l2tp-ipsec-vpn-client-in-linux/)
- [L2TP VPN on Ubuntu](https://community.ui.com/questions/L2TP-VPN-on-Ubuntu-18-04-client/e8317a0c-ba97-4673-b2c2-1c0be0906228)
