#!/bin/sh
set -e

CERT_DIR="/certs"
CERT_FILE="$CERT_DIR/localhost.pem"
KEY_FILE="$CERT_DIR/localhost-key.pem"

echo "-------------------------------"
echo "HOST_USER: $HOST_USER"
echo "HOST_GROUP: $HOST_GROUP"
echo "------------------^^^^^^^^^^^^^"

if [ ! -f "$CERT_FILE" ] || [ ! -f "$KEY_FILE" ]; then
    echo "Generating certificates with mkcert..."
    mkcert -cert-file "$CERT_FILE" -key-file "$KEY_FILE" localhost
else
    echo "Certificates already exist."
fi

exec python /app/scripts/server.py
