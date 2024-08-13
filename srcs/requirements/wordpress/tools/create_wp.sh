#!/bin/sh

BOLD="\e[1m"; RESET="\e[0m"
GREEN="\e[32m"

mkdir -p /var/www/html && cd /var/www/html && rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
echo "${BOLD}${GREEN}WP-CLI downloaded${RESET}"

wp core download --allow-root
echo "${BOLD}${GREEN}WP downloaded${RESET}"

wp config create --allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=$DB_HOST \
	--dbprefix=wp_
echo "${BOLD}${GREEN}WP-config created${RESET}"

wp core install --allow-root \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USR \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL
echo "${BOLD}${GREEN}WP installed${RESET}"
	
/usr/sbin/php-fpm7.3 -F
