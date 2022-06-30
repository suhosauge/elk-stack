#!/bin/bash
# Generate Root Key "$CERT_DIR/rootCA.key" with 2048
CERT_NAME="elkcerts"

mkdir -p $CERT_NAME
CERT_DIR="$PWD/$CERT_NAME"
openssl genrsa -passout pass:"$1" -des3 -out "$CERT_DIR/rootCA.key" 2048

# Generate Root PEM ("$CERT_DIR/rootCA.pem") with 1024 days validity.
openssl req -passin pass:"$1" -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=Local Certificate"  -x509 -new -nodes -key "$CERT_DIR/rootCA.key" -sha256 -days 1024 -out "$CERT_DIR/rootCA.pem"

# Generate ES01 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out "$CERT_DIR/es01.csr" -newkey rsa:2048 -keyout "$CERT_DIR/es01.key"
openssl x509 -req -passin pass:"$1" -in "$CERT_DIR/es01.csr" -CA "$CERT_DIR/rootCA.pem" -CAkey "$CERT_DIR/rootCA.key" -CAcreateserial -out "$CERT_DIR/es01.crt" -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:es01")

# Generate ES02 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out "$CERT_DIR/es02.csr" -newkey rsa:2048 -keyout "$CERT_DIR/es02.key"
openssl x509 -req -passin pass:"$1" -in "$CERT_DIR/es02.csr" -CA "$CERT_DIR/rootCA.pem" -CAkey "$CERT_DIR/rootCA.key" -CAcreateserial -out "$CERT_DIR/es02.crt" -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:es02")

# Generate ES03 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out "$CERT_DIR/es03.csr" -newkey rsa:2048 -keyout "$CERT_DIR/es03.key"
openssl x509 -req -passin pass:"$1" -in "$CERT_DIR/es03.csr" -CA "$CERT_DIR/rootCA.pem" -CAkey "$CERT_DIR/rootCA.key" -CAcreateserial -out "$CERT_DIR/es03.crt" -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:es03")

# Generate Kib01 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out "$CERT_DIR/kib01.csr" -newkey rsa:2048 -keyout "$CERT_DIR/kib01.key"
openssl x509 -req -passin pass:"$1" -in "$CERT_DIR/kib01.csr" -CA "$CERT_DIR/rootCA.pem" -CAkey "$CERT_DIR/rootCA.key" -CAcreateserial -out "$CERT_DIR/kib01.crt" -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:kib01")


