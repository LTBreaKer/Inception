FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl

RUN apt-get install -y php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress

RUN mkdir -p /run/php

# RUN chown -R www-data:www-data /var/www/wordpress

COPY ./tools/WP_script.sh .

RUN chmod +x WP_script.sh

ENTRYPOINT [ "./WP_script.sh" ]
