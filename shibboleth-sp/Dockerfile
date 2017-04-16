FROM debian:latest
MAINTAINER larry1337 <larissa.riedel88@gmail.com>

# Apache2 Umgebungsvariablen setzen
ENV APACHE_RUN_USER     www-data
ENV APACHE_RUN_GROUP    www-data
ENV APACHE_LOG_DIR      /var/log/apache2
ENV APACHE_PID_FILE     /var/run/apache2.pid
ENV APACHE_RUN_DIR      /var/run/apache2
ENV APACHE_LOCK_DIR     /var/lock/apache2
ENV APACHE_LOG_DIR      /var/log/apache2

# Shibboleth Umgebungsvariablen
ENV REPOSITORY_FINGERPRINT_KEY	294E37D154156E00FB96D7AA26C3C46915B76742

#---------------------------------------------#

RUN apt-get update && apt-get install -y \ 
apache2 \
php5 \ 
libapache2-mod-php5 \
ntp \
curl \
openssl

# Zertifikat-Ordner anlegen und freigeben 
RUN mkdir -p /etc/ssl/localcerts
RUN chmod 600 /etc/ssl/localcerts

# Apache2 TLS-MODUL aktivieren
RUN a2enmod ssl

# Virtueller Host aktivieren
RUN a2ensite default-ssl

# Repository Key herunterladen
RUN curl -O http://pkg.switch.ch/switchaai/SWITCHaai-swdistrib.asc

# Fingerabdruck validieren
RUN FINGERPRINT="$(gpg --with-fingerprint SWITCHaai-swdistrib.asc | sed -n 2p | tr -d '[:space:]' | cut -c 16-)" \
&& echo "REPOSITORY FINGERPRINT: $REPOSITORY_FINGERPRINT_KEY" \
&& echo "RECEIVED FINGERPRINT:   ${FINGERPRINT}" \
&& if [ ${FINGERPRINT} != $REPOSITORY_FINGERPRINT_KEY ]; then echo "Warning! Wrong GPG fingerprint!" && exit 1; fi 

# Repository-Key hinzufügen
RUN apt-key add SWITCHaai-swdistrib.asc

# Repository hinzufügen
RUN echo 'deb http://pkg.switch.ch/switchaai/debian jessie main' | tee /etc/apt/sources.list.d/SWITCHaai-swdistrib.list > /dev/null \
&& apt-get update

# Shibboleth Service-Provider installieren
RUN apt-get install -y --install-recommends shibboleth

# Apache als Vordergrungprozess starten
ENTRYPOINT [ "/usr/sbin/apache2", "-DFOREGROUND" ]
