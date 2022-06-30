#!/bin/bash
# Generate Root Key rootCA.key with 2048
CERT_DIR="elkcerts"
mkdir -p $CERT_DIR

openssl genrsa -passout pass:"$1" -des3 -out rootCA.key 2048

# Generate Root PEM (rootCA.pem) with 1024 days validity.
openssl req -passin pass:"$1" -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=Local Certificate"  -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem

# Generate ES01 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out es01.csr -newkey rsa:2048 -keyout es01.key
openssl x509 -req -passin pass:"$1" -in es01.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out es01.crt -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:es01")

# Generate ES02 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out es02.csr -newkey rsa:2048 -keyout es02.key
openssl x509 -req -passin pass:"$1" -in es02.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out es02.crt -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:es02")

# Generate ES03 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out es03.csr -newkey rsa:2048 -keyout es03.key
openssl x509 -req -passin pass:"$1" -in es03.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out es03.crt -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:es03")

# Generate Kib01 Cert
openssl req -subj "/C=US/ST=Random/L=Random/O=Global Security/OU=IT Department/CN=localhost"  -new -sha256 -nodes -out kib01.csr -newkey rsa:2048 -keyout kib01.key
openssl x509 -req -passin pass:"$1" -in kib01.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out kib01.crt -days 500 -sha256 -extfile  <(printf "subjectAltName=DNS:localhost,DNS:kib01")


