#!/bin/sh

# installs requirements and builds kitty from source
# on a fresh Ubuntu 18.04 install
#
# https://github.com/kovidgoyal/kitty

sudo apt install python3-dev git gcc build-essential pkg-config libharfbuzz-dev libpng-dev libfontconfig1-dev libgl1-mesa-dev libxkbcommon-x11-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev
#cd /opt
#sudo git clone https://github.com/kovidgoyal/kitty
#cd /opt/kitty
#sudo make
#python3 .