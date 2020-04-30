# Crontab

> Create cron jobs to run on schedule

## Basics

```bash
$ crontab -l #list
$ crontab -e #edit
```

## Examples

```bash
* * * * * /bin/bash -c "/home/pi/misc/pihole/restartdns.sh" > /dev/null 2>&1 || true
* * * * * env > /tmp/env.output > /dev/null
5 4 * * * /bin/bash -c "/home/lewis/update.sh"
```

## References

- [crontab guru](https://crontab.guru)
