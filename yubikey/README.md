# Yubikey

## Setup

```sh
$ sudo apt update
$ sudo apt install -y wget gnupg2 gnupg-agent dirmngr cryptsetup scdaemon pcscd secure-delete hopenpgp-tools yubikey-personalization
$ cat /proc/sys/kernel/random/entropy_avail
$ sudo apt install -y at rng-tools python-gnupg openssl
$ wget https://github.com/OneRNG/onerng.github.io/raw/master/sw/onerng_3.6-1_all.deb
$ sha256sum onerng_3.6-1_all.deb
$ sudo dpkg -i onerng_3.6-1_all.deb
$ echo "HRNGDEVICE=/dev/ttyACM0" | sudo tee /etc/default/rng-tools
$ sudo atd
$ sudo service rng-tools restart
$ cat /dev/random >/dev/null
$ cat /proc/sys/kernel/random/entropy_avail
$ export GNUPGHOME=$(mktemp -d)
$ cd $GNUPGHOME
$ wget https://raw.githubusercontent.com/drduh/config/master/gpg.conf
$ grep -ve "^#" $GNUPGHOME/gpg.conf
```

- Generate unique password

```sh
$ gpg --gen-random --armor 0 24
```

- Create key

```sh
$ gpg --expert --full-generate-key
gpg 8
E
S
Q
4096
y
Name
Email
# -- no comment--
O
# -- password from previous step
```

- Export Key

```sh
$ export KEYID=
```

- Create SubKey

```sh
$ gpg> --expert --edit-key $KEYID
gpg addkey
4
4096
1yr
# --password --
gpg> addkey
6
4096
1yr
# --password --
gpg> addkey
8
s
e
a
q
4096
1yr
# --password --
gpg> save
```

- Add email

```sh
$ gpg --expert --edit-key $KEYID
gpg> adduid
Name
Email
# -- no comment --
O
# -- password --
gpg> trust
5
y
gpg> uid 1
gpg> primary
gpg> save
```

- Verify

```sh
$ gpg -K
```

- Export

```sh
$ gpg --armor --export-secret-keys $KEYID > $GNUPGHOME/mastersub.key
$ gpg --armor --export-secret-subkeys $KEYID > $GNUPGHOME/sub.key
```

- Backup

```sh
$ sudo dmesg | tail
$ sudo dd if=/dev/urandom of=/dev/sda bs=4M status=progress
$ sudo fdisk /dev/sda
o
w
$ sudo fisk /dev/sda
n
p
1
2048
+25mb
w
$ sudo cryptsetup luksFormat /dev/sda1
YES
# -- password --
# -- password --
$ sudo cryptsetup luksOpen /dev/sda1 usb
# -- password --
$ sudo mkfs.ext2 /dev/mapper/usb -L usb
$ sudo mkdir /mnt/encrypted-usb
$ sudo mount /dev/mapper/usb /mnt/encrypted-usb
$ sudo cp -avi $GNUPGHOME /mnt/encrypted-usb
$ sudo umount /mnt/encrypted-usb
$ sudo cryptsetup luksClose usb
$ sudo fdisk /dev/sdb
n
p
# -- default --
+25mb
w
$ sudo mkfs.ext2 /dev/sda2
$ sudo mkdir /mnt/public
$ sudo mount /dev/sda2 /mnt/public/
$ gpg --armor --export $KEYID | sudo tee /mnt/public/$KEYID-$(date +%F).txt
```

- Send key

```sh
$ gpg --send-key $KEYID
$ gpg --keyserver pgp.mit.edu --send-key $KEYID
$ gpg --keyserver keys.gnupg.net --send-key $KEYID
$ gpg --keyserver hkps://keyserver.ubuntu.com:443 --send-key $KEYID
```

-- Setup smartcard

```sh
$ gpg --card-edit
admin
passwd
3
1
q
name
# -- surname --
# -- first name --
lang
en
login
# -- email --
list
quit
```

- Transfer

```sh
$ gpg --edit-key $KEYID
gpg> key 1
gpg> keytocard
1
# -- password --
# -- admin pin --
gpg> key 1
gpg> key 2
gpg> keytocard
2
# -- password --
# -- admin pin --
gpg> key 2
gpg> key 3
gpg> keytocard
3
# -- password --
# -- admin pin --
save
$ gpg -k
```

- Cleanup

```sh
$ sudo umount /mnt/public
$ sudo srm -r $GNUPGHOME || sudo rm -rf $GNUPGHOME
$ gpg --delete-secret-key $KEYID
$ sudo reboot
```

- Use keys

```sh
cd ~/.gnupg ; wget https://raw.githubusercontent.com/drduh/config/master/gpg.conf
$ chmod 600 gpg.conf
$ sudo apt update && sudo apt install -y gnupg2 gnupg-agent gnupg-curl scdaemon pcscd
$ sudo mount /dev/sda2 /mnt
$ gpg --import /mnt/0x*txt
$ export KEYID=...
$ gpg --edit-key $KEYID
gpg> trust
5
y
q
# -- remove and connect YubiKey --
$ gpg --card-status
$ echo "test message string" | gpg --encrypt --armor --recipient $KEYID -o encrypted.txt
$ gpg --decrypt --armor encrypted.txt
$ echo "test message string" | gpg --armor --clearsign > signed.txt
$ gpg --verify signed.txt
```

- SSH

```sh
$ cd ~/.gnupg
$ wget https://raw.githubusercontent.com/drduh/config/master/gpg-agent.conf
$ grep -ve "^#" gpg-agent.conf

- Add these to `.bashrc`

```sh
$ export GPG_TTY="$(tty)"
$ export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
$ gpg-connect-agent updatestartuptty /bye > /dev/null
```

- Get ssh key

```
$ ssh-add -L
ssh-rsa AAA... cardno:****************
$ ssh-add -L | grep "cardno:****************" > ~/.ssh/id_rsa_yubikey.pub
$ cat << EOF >> ~/.ssh/config
Host github.com
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa_yubikey.pub
EOF
$ ssh git@github.com -vvv
```

- GitHub

```ssh
$ git config --global user.signingkey $KEYID
$ git config --global commit.gpgsign true
```

- Make sure that these are in the `.bashrc`:

```txt
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
```

- Add the following to /etc/ssh/sshd_config:

```sh
$ sudo vi /etc/ssh/sshd_config
```

```txt
AllowAgentForwarding yes
StreamLocalBindUnlink yes
```

```sh
$ sudo service sshd reload
```
