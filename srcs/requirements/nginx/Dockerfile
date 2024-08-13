FROM debian:buster

RUN apt -y update && \
	apt -y install nginx openssl

# Generate SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/CN=localhost"

COPY ./conf/mynginx.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
