#!/bin/bash

# Usage: ./sublive.sh target.com

domain=$1

if [ -z "$domain" ]; then
    echo "Usage: sublive domain.com"
    exit 1
fi

echo "[>] Running subfinder for $domain ..."
subfinder -d $domain -silent | httpx -silent -status-code -no-color | tee all.txt | \
awk '{gsub(/\[|\]/,"",$2); print $1 > $2".txt"}'

echo "[>] Done!"
echo " - Full result in: all.txt"
echo " - Status code wise saved in: 200.txt, 301.txt, 302.txt, etc."
