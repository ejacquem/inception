# Use the official MariaDB base image
FROM mariadb:latest

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=${WP_ADMIN_PWD}
ENV MYSQL_DATABASE=${db_name}
ENV MYSQL_USER=${db_user}
ENV MYSQL_PASSWORD=${db_pwd}

# Expose the default MariaDB port
EXPOSE 3306

# Start MariaDB server
CMD ["service mysql start", "mysqld"]

