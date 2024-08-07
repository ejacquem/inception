FROM debian:buster

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install wordpress php-fpm
		
# Use the official WordPress image as the base
#FROM wordpress:latest

# Install PHP-FPM (WordPress Docker image is already configured with Apache)
#RUN apt -y update && apt install -y php-fpm

# Expose PHP-FPM port
#EXPOSE 9000

# Start PHP-FPM (though Apache is used in this case)
#CMD ["php-fpm"]
