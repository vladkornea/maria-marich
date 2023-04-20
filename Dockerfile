FROM ubuntu:22.04

WORKDIR /our/sites/maria-marich

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qqy install apt-utils
RUN apt-get -qqy upgrade
RUN ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt-get -qqy install tzdata

# mariadb
RUN apt-get -qqy install mariadb-server
RUN mysql -V

# PHP
RUN apt-get -qqy install software-properties-common
#RUN add-apt-repository ppa:ondrej/apache2 -y
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get -qqy install php7.4
RUN apt-get -qqy install php7.4-mysql
RUN php -v

# apache2
RUN apt-get -qqy install apache2
RUN apache2 -v
RUN a2enmod rewrite
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# apache2 conf
RUN mkdir -p /our/logs/maria-marich && cd /our/logs/maria-marich && mkdir dev test live
COPY src/maria-marich-httpd.conf /etc/apache2/sites-available
RUN ln -s /etc/apache2/sites-available/maria-marich-httpd.conf /etc/apache2/sites-enabled/aa_maria-marich-httpd.conf

# entrypoint bootstrap script
COPY src/bootstrap.sh .
RUN chmod a+x ./bootstrap.sh
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["./bootstrap.sh"]

