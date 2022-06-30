#!/bin/bash
CERT_NAME="elkcerts"
CERT_DIR="$PWD/$CERT_NAME"
# Add root cert as trusted cert
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        yum -y install ca-certificates
        update-ca-trust force-enable
        cp "$CERT_DIR/rootCA.pem" /etc/pki/ca-trust/source/anchors/
        update-ca-trust
        #meeting ES requirement
        sysctl -w vm.max_map_count=262144
else
        # Unknown.
        echo "Couldn't find desired Operating System. Exiting Now ......"
        exit 1
fi