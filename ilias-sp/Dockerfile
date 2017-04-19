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

#---------------------------------------------#


# Apache installieren
RUN apt-get update && apt-get install -y \
apache2 \
php5 \
libapache2-mod-php5 \
php5-xsl \
php5-gd \
php5-mysql \
zip \
unzip \ 
imagemagick \
openjdk-7-jdk

# Git für Debian installieren
RUN apt-get update && apt-get install git-core -y 

# Ilias installieren
RUN cd /var/www/html/ \
&& git clone https://github.com/ILIAS-eLearning/ILIAS.git ilias \
&& cd ilias \
&& git checkout release_5-2

# Owner für Verzeichnis auf apache-user ändern
RUN chown www-data:www-data /var/www/html/ilias -R

# Data-Diretory ausserhalb vom Webverzeichnis + freigeben
RUN mkdir -p /home/www-data/iliasdata && chown www-data:www-data /home/www-data -R

# Log-Diretory anlegen + freigeben
RUN mkdir /var/log/iliaslog && chown www-data:www-data /var/log/iliaslog -R

# Apache als Vordergrungprozess starten
ENTRYPOINT [ "/usr/sbin/apache2", "-DFOREGROUND" ]
