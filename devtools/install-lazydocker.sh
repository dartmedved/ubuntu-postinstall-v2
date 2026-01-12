#!/bin/bash

go install github.com/jesseduffield/lazydocker@latest

mkdir -p ~/bin
cd ~/bin
ln -s ~/go/bin/lazydocker 