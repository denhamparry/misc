# ssh

## Setup

```bash
export USERNAME=lewis           # Your username
export SERVER=demo.server.com   # IP or URL for server
```

## Add user to `sudo` group:

```bash
$ usermod -aG sudo ${USERNAME}
```

## Create key

```bash
$ ssh-keygen -t rsa
$ ssh-copy-id -i $HOME/.ssh/id_rsa.pub ${USERNAME}@${SERVER}
```

### Disable root login and password based login

```bash
$ sudo vi /etc/ssh/sshd_config
```

```vim
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
PermitRootLogin no
```

```bash
$ sudo /etc/init.d/ssh reload
$ sudo systemctl reload ssh
```

#### Test

```bash
$ ssh ${USERNAME}@${SERVER} -o PubkeyAuthentication=no
```
