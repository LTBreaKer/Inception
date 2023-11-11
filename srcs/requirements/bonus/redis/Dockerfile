FROM debian:bullseye

EXPOSE 6379

RUN apt-get update && apt-get upgrade -y && apt-get install redis-server php-redis -y

RUN mkdir -p /var/www/wordpress

COPY ./tools/redis_scr.sh .

RUN chmod +x redis_scr.sh

ENTRYPOINT [ "./redis_scr.sh" ]