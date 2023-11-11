FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y


RUN apt-get install -y mariadb-server

COPY ./tools/script.sh .

COPY ./conf/conf.cnf /etc/mysql/my.cnf

RUN chmod 640 /etc/mysql/my.cnf

RUN chown -R mysql:mysql /var/lib/mysql

RUN chmod +x ./script.sh

ENTRYPOINT ["./script.sh"]
