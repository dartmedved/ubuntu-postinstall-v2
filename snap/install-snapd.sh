#!/bin/bash

sudo rm /etc/apt/preferences.d/nosnap.pref
apt update 
sudo apt install -y snapd
sudo snap refresh
