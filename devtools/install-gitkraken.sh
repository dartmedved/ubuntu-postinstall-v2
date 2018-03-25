#!/bin/bash
export KRAKEN_URL=https://release.gitkraken.com/linux/gitkraken-amd64.deb
export KRAKEN_FILE=/tmp/gitkraken-amd64.deb

echo $KRAKEN_URL "--->" $KRAKEN_FILE
rm -f $KRAKEN_FILE
http --download --pretty all --style solarized  --verbose --output $KRAKEN_FILE $KRAKEN_URL
sudo dpkg -i $KRAKEN_FILE