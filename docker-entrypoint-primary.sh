#!/bin/bash
set -eu

sed -i "s/#EMAIL_DOMAIN#/${EMAIL_DOMAIN:-example.com}/" /etc/rabbitmq/advanced.config
sed -i "s/#EMAIL_RELAY_HOST#/${EMAIL_RELAY_HOST:-example.com}/" /etc/rabbitmq/advanced.config

docker-entrypoint.sh "$@"
