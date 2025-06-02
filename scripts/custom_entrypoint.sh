CERT_DIR="/certs"
CERT_FILE="$CERT_DIR/localhost.pem"
KEY_FILE="$CERT_DIR/localhost-key.pem"
CERT_ROOT_CA="/.local/share/mkcert/rootCA.pem"
CERT_ROOT_CA_KEY="/.local/share/mkcert/rootCA-key.pem"

echo "HOST_USER: $HOST_USER"
echo "HOST_GROUP: $HOST_GROUP"

if ([ ! -f "$CERT_ROOT_CA" ] || [ ! -f "$CERT_ROOT_CA_KEY" ]) && [ -f "$CERT_DIR/rootCA.pem" ] && [ -f "$CERT_DIR/rootCA-key.pem" ]; then
    echo "Copying rootCA.pem from $CERT_DIR/rootCA.pem to mkcert root..."
    mkdir -p /.local/share/mkcert
    cp "$CERT_DIR/rootCA.pem" $CERT_ROOT_CA
    cp "$CERT_DIR/rootCA-key.pem" $CERT_ROOT_CA_KEY
fi

if [ ! -f "$CERT_FILE" ] || [ ! -f "$KEY_FILE" ] || [ ! -f "$CERT_ROOT_CA" ]; then
    echo "Generating certificates with mkcert..."
    mkcert -cert-file "$CERT_FILE" -key-file "$KEY_FILE" localhost
else
    echo "Certificates already exist."
fi

if [ ! -f "$CERT_DIR/rootCA.pem" ] || [ ! -f "$CERT_DIR/rootCA-key.pem" ]; then
    echo "Copying rootCA.pem to $CERT_DIR/rootCA.pem..."
    cp $CERT_ROOT_CA "$CERT_DIR/rootCA.pem"
    cp $CERT_ROOT_CA_KEY "$CERT_DIR/rootCA-key.pem"
    chmod u+w $CERT_DIR/rootCA-key.pem
    echo "** WARNING: you must configure your browser to trust the rootCA.pem file. **"
    echo "** See README for details on how to do that. **"
fi

if (! cmp -s "$CERT_ROOT_CA" "$CERT_DIR/rootCA.pem") || (! cmp -s "$CERT_ROOT_CA_KEY" "$CERT_DIR/rootCA-key.pem"); then
    echo "** WARNING: $CERT_DIR/rootCA.pem has changed since the last run. **"
    echo "** You must configure your browser to trust the new rootCA.pem file. **"
    cp $CERT_ROOT_CA "$CERT_DIR/rootCA.pem"
fi

exec python /scripts/server.py
