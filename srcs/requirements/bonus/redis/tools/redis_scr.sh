#!/bin/bash

sed -i "s/^bind .*/bind 0.0.0.0/g" /etc/redis/redis.conf

redis-server --daemonize no --protected-mode no