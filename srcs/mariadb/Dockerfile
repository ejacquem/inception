FROM debian:buster

RUN apt update && \
	apt -y upgrade && \
	apt -y install mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./create_db.sh /
RUN chmod +x create_db.sh

CMD [ "/create_db.sh" ]
