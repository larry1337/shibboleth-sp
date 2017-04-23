#!/bin/bash
# Apache gets grumpy about PID files pre-existing

if [ -f "./run/apache2.pid" ]; then
rm -f ./run/apache2.pid
fi

 service shibd start
 exec apache2 -DFOREGROUND
#/usr/sbin/apache2ctl -D FOREGROUND
