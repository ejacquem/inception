FROM debian:buster

#Instal php
RUN apt update \
	&& apt -y upgrade \
	&& apt -y install php-fpm php-mysql curl

#Download WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

#Download WP 
RUN wp core download --allow-root

COPY ./create_wp.sh /

RUN chmod 777 create_wp.sh

EXPOSE 9000

CMD [ "/create_wp.sh" ]
