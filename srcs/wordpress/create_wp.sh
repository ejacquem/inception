#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#Create wp-config with WP-CLI
	wp config create \
		--dbname=$db_name \
		--dbuser=$db_user \
		--dbpass=$db_pwd \
		--dbhost=localhost \
		--dbprefix=wp_

	#Install WP
	wp core install \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PWD \
		--admin_email=$WP_ADMIN_EMAIL
fi

exec "$@"
