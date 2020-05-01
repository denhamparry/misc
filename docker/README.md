# Docker

```sh
$ sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
$ sudo apt update
$ sudo apt-get install docker-ce
$ sudo systemctl status docker
```
