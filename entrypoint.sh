#!/bin/sh

echo "preflight checks"

if ! [ -f '/app/config/.env' ]; then
	# .env file does not exist, copy the example
	cp /app/.env.example /app/.env

	echo "The .env file not found, a new one has been created"
	echo "Please edit the config/.env file and restart the container"
	exit 1
else
	echo "The .env file found, continuing"
	. /app/config/.env
fi

if ! [ -f "$OCI_PRIVATE_KEY_FILENAME" ]; then
	echo "The OCI private key '$OCI_PRIVATE_KEY_FILENAME' file not found, please put it in config directory"
	exit 2
fi

while true; do
	php index.php
	sleep 60
done
