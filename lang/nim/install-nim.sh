#!/bin/bash

curl https://nim-lang.org/choosenim/init.sh -sSf | sh

cp ~/.bashrc ~/.bashrc-nim-bak

echo "export PATH=/home/dartmedved/.nimble/bin:\$PATH" >> ~/.bashrc