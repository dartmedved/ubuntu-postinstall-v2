#!/bin/bash 

# Chrome key update
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo tee /etc/apt/trusted.gpg.d/google.asc >/dev/null

# Yarn key update
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

# Opera Key
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -

# Yandex Key
wget -O - https://repo.yandex.ru/yandex-browser/YANDEX-BROWSER-KEY.GPG | sudo apt-key add -
