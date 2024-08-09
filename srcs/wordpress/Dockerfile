FROM debian:buster

#Instal php
RUN apt update && \
	apt -y upgrade && \
	apt -y install php-fpm php-mysql curl

COPY www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /run/php

COPY ./create_wp.sh /
RUN chmod +x create_wp.sh

EXPOSE 9000

CMD ["/create_wp.sh", "&&", "php-fpm7.3", "-F"]
