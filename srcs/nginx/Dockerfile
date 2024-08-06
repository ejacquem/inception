FROM debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y
# Install OpenSSL if not already included
# RUN apt-get update && apt-get install -y openssl

# Generate SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/CN=localhost"

COPY nginx/mynginx.conf /etc/nginx/conf.d/

COPY nginx/index.html /usr/share/nginx/html/index.html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
