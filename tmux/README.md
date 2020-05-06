# tmux

## Setup

```bash
$ git clone https://github.com/tmux/tmux.git
$ cd tmux
$ sh autogen.sh
$ ./configure && make
$ sudo mv tmux /usr/bin/
```

## Issues

### Colour scheme not working

- When using `vi` in `tmux`, `vi` colour scheme isn't as expected

#### Test

```bash
# Make sure latest tmux.conf is loaded
$ tmux kill-server
$ tmux new
$ tmux info
$ vi
```

#### Things learned

- `tmux info`

#### Fixes

- `.bashrc` / `.aliases`

```txt
alias tmux="TERM=screen-256color-bce tmux"
```

- `tmux.conf`

```txt
set -g default-terminal "xterm"
```
