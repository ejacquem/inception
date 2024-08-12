#!/bin/sh

BOLD="\e[1m"; RESET="\e[0m"

# Text colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"

#check if wp-config.php exist
#if [ -f ./wp-config.php ]
#then
#	echo "wordpress already downloaded"
#else

echo "${BOLD}${GREEN}making html dir${RESET}"
mkdir -p /var/www/html && cd /var/www/html && rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
#Create wp-config with WP-CLI

wp --info

echo "${BOLD}${GREEN}WP downloaded${RESET}"
wp core download --allow-root

echo "${BOLD}Creating wp-config with dbhost : $DB_HOST ${RESET}"
wp config create --allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=$DB_HOST \
	--dbprefix=wp_


echo "${BOLD}${GREEN}WP-config created${RESET}"

#Install WP
wp core install --allow-root \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USR \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL
	
/usr/sbin/php-fpm7.3 -F
#fi

#exec "$@"
