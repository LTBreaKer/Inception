FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y

COPY conf/default.conf /etc/nginx/conf.d/

COPY conf/default.conf /etc/nginx/sites-available/default
COPY conf/default.conf /etc/nginx/sites-enabled/default
EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]