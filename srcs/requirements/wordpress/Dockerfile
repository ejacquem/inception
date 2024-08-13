FROM debian:buster

#Instal php
RUN apt update && \
	apt -y upgrade && \
	apt -y install php-fpm php-mysql curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/create_wp.sh /

RUN mkdir -p /run/php
RUN chmod +x create_wp.sh

CMD ["/create_wp.sh", "&&", "php-fpm7.3", "-F"]
