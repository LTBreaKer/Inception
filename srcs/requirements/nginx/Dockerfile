FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install nginx openssl -y

COPY conf/default.conf /etc/nginx/conf.d/

COPY ./tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]