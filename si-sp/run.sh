#!/bin/sh
# Apache gets grumpy about PID files pre-existing

if [ ! -f "/etc/ssl/localcerts/sp-cert.pem" ]; then
echo "Service-Provider cetificate does not exist. I will create a self-signed ceritficate for you."
openssl req -nodes -newkey rsa:2048 -keyout sp-certkey.key -out sp-cert.pem -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=sp.com"
fi

if [  ! -f "/etc/apache2/sites-enabled/default-ssl.conf" ]; then
echo "Default apache configuration does not exist. I will copy it for you."
cp "/etc/apache2/sites-enabled/default-ssl.conf.example" "/etc/apache2/sites-enabled/default-ssl.conf"
fi


if [ -f "./run/apache2.pid" ]; then
rm -f ./run/apache2.pid
fi

 service shibd start
 exec apache2 -DFOREGROUND
#/usr/sbin/apache2ctl -D FOREGROUND


