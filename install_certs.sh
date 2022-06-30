#!/bin/bash
CERT_NAME="elkcerts"
CERT_DIR="$PWD/$CERT_NAME"
# Add root cert as trusted cert
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        apt-get -y install ca-certificates
        update-ca-certificates
        cp "$CERT_DIR/rootCA.pem" /usr/local/share/ca-certificates/
        update-ca-certificates
        #meeting ES requirement
        sysctl -w vm.max_map_count=262144
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain rootCA.pem
else
        # Unknown.
        echo "Couldn't find desired Operating System. Exiting Now ......"
        exit 1
fi