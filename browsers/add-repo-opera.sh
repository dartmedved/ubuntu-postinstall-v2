#!/bin/bash
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo apt update