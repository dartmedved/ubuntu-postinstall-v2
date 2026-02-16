#!/bin/bash
echo ----[project update]------------------------------------------------------
git pull
echo ----[linux update]--------------------------------------------------------
sudo ./update.sh
echo ----[sdk update]----------------------------------------------------------
source ~/.sdkman/bin/sdkman-init.sh 
#sdk offline disable
#sdk update
#sdk ug
#sdk flush tmp
echo ----[rust update]---------------------------------------------------------
rustup update
echo ----[npm update]----------------------------------------------------------
sudo npm install -g npm
sudo npm -g update 
# echo ----[flutter update]------------------------------------------------------
# flutter upgrade 
echo ----[end]-----------------------------------------------------------------