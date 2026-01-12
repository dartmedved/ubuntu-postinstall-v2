#!/bin/bash

go install github.com/jesseduffield/lazygit@latest

mkdir -p ~/bin
cd ~/bin
ln -s ~/go/bin/lazygit 