#!/bin/sh
# Apache gets grumpy about PID files pre-existing

if [ ! -f "/etc/ssl/localcerts/sp-cert.pem" ]; then
echo "Service-Provider cetificate does not exist. I will create a self-signed ceritficate for you."
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=US/ST=Denial/L=Heilbronn/O=Dis/CN=www.sp.com" \
    -keyout /etc/ssl/localcerts/sp-cert.key -out /etc/ssl/localcerts/sp-cert.pem
fi

if [ ! -f "/etc/ssl/localcerts/apache.pem" ]; then
echo "Apache cetificate does not exist. I will create a self-signed ceritficate for you."
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=US/ST=Denial/L=Heilbronn/O=Dis/CN=www.apache.com" \
    -keyout /etc/ssl/localcerts/apache.key -out /etc/ssl/localcerts/apache.pem
fi


if [  ! -f "/etc/apache2/sites-enabled/default-ssl.conf" ]; then
echo "Default apache configuration does not exist. I will copy it for you."
cp "/etc/apache2/sites-enabled/default-ssl.conf.example" "/etc/apache2/sites-enabled/default-ssl.conf"
fi


if [ -f "./run/apache2.pid" ]; then
rm -f ./run/apache2.pid
fi

chown -R www-data:www-data /home/www-data/iliasdata
chown -R www-data:www-data /var/log/iliaslog
chown -R www-data:www-data /var/www/html/ilias/data/

 service shibd start
 exec apache2 -DFOREGROUND
#/usr/sbin/apache2ctl -D FOREGROUND


