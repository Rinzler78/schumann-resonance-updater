#!/bin/sh

/update.sh

# start cron
/usr/sbin/crond -f -l 8