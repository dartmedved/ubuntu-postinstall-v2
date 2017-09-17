#!/bin/bash
apt update && apt upgrade
apt -y install curl wget w3m
apt -y install p7zip-full mc htop iotop
apt -y install git mercurial subversion
apt -y install ubuntu-restricted-extras
apt -y install python3
apt -y install unzip unrar 
apt -y install ruby ruby-dev
apt -y install openssh-server
apt -y install openjdk-8-jdk
apt -y install ffmpeg gstreamer-tools
apt -y install mplayer2
apt -y install libzen0v5
apt -y install libmediainfo0v5
apt -y install vlc
apt -y install golang-go
apt -y install dstat
apt -y install glances
apt -y install vim-nox
apt -y install bmon slurm tcptrack iftop nethogs
apt -y install taskwarrior
apt -y install galculator
apt -y install pwgen
apt -y install w3m
apt -y install vlock

#go tools
apt -y install gocode
apt -y install golang-golang-x-tools

#terminal emulators
apt -y install terminator
apt -y install terminix
#apt install tilda
apt -y install guake

apt -y install atom
apt -y install code code-insiders
apt -y install git-svn
apt -y install tig

#swift language (very buggy under ubuntu 15.10)
#apt install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config
#wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
#download swift from https://swift.org/download/#snapshots

#dlna server specific
#apt -y install transmission-cli transmission-common transmission-daemon

#cleanup 
apt -y autoremove
