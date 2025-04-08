#!/bin/bash

# Path to the current directory (where the script is located)
SCRIPT_DIR=$(dirname "$0")

# Path to the configuration file and target directory
CERT_DIR="$SCRIPT_DIR"
CONFIG="$CERT_DIR/req.cfg"

# Create directory for certificates if it does not exist
mkdir -p "$CERT_DIR"

# Generate certificate and key
openssl req -x509 \
  -newkey rsa:4096 \
  -sha256 \
  -days 1825 \
  -nodes \
  -keyout "$CERT_DIR/server.key" \
  -out "$CERT_DIR/server.crt" \
  -config "$CONFIG"

echo "Certificate and key created in $CERT_DIR"