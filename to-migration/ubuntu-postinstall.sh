#!/bin/bash
apt update && apt upgrade
apt -y install curl wget w3m
apt -y install p7zip-full mc htop iotop
apt -y install git mercurial subversion
apt -y install ubuntu-restricted-extras
apt -y install python3 python3-all python3-all-dev
apt -y install unzip unrar 
apt -y install ruby ruby-dev
apt -y install openssh-server
apt -y install openjdk-11-jdk
apt -y install ffmpeg
apt -y install gstreamer1.0-tools
apt -y install yt-dlp
apt -y install mplayer2
apt -y install mpv
#apt -y install libzen0v5
#apt -y install libmediainfo0v5
apt -y install vlc
apt -y install golang-go
apt -y install dstat
apt -y install glances
apt -y install vim-nox
apt -y install neovim
apt -y install bmon slurm tcptrack iftop nethogs
#apt -y install taskwarrior
apt -y install galculator
apt -y install pwgen
apt -y install w3m
apt -y install vlock

#go tools
apt -y install gopls
apt -y install golang-golang-x-tools

#terminal emulators
apt -y install terminator
apt -y install tilix
apt -y install guake
apt -y install kitty

apt -y install code code-insiders
apt -y install git-svn
apt -y install tig

#dlna server specific
#apt -y install transmission-cli transmission-common transmission-daemon

#cleanup 
apt -y autoremove
