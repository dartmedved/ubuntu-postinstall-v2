#!/bin/bash

add-apt-repository ppa:webupd8team/atom
#add-apt-repository ppa:webupd8team/terminix

wget -O - https://tagplus5.github.io/vscode-ppa/ubuntu/gpg.key | sudo apt-key add -
wget -O /etc/apt/sources.list.d/vscode.list https://tagplus5.github.io/vscode-ppa/ubuntu/vscode.list

apt update
 