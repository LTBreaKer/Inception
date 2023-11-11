FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl

RUN apt-get install -y php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip mariadb-client

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o adminer.php

RUN mkdir -p /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

RUN mkdir -p /run/php

COPY ./tools/adminer_script.sh .

RUN chmod +x adminer_script.sh

ENTRYPOINT [ "./adminer_script.sh" ]