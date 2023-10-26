FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y

COPY conf/default.conf /etc/nginx/conf.d/

CMD [ "nginx", "-g", "daemon off;" ]