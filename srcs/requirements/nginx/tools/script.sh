#!/bin/bash

openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=Île-de-France/L=Paris/O=LTB/CN=aharrass.42.fr"

chmod 664 /etc/ssl/private/nginx-selfsigned.key
chmod 600 /etc/ssl/certs/nginx-selfsigned.crt
chown root:root /etc/ssl/certs/nginx-selfsigned.crt \
    			/etc/ssl/private/nginx-selfsigned.key

nginx -g "daemon off;"