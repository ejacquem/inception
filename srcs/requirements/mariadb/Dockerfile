FROM debian:buster

RUN apt update && \
	apt -y upgrade && \
	apt -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/create_db.sh /
RUN chmod +x create_db.sh

CMD [ "/create_db.sh" ]
