#!/bin/bash
sudo apt update 
sudo apt upgrade -y
sudo apt autoclean -y && sudo apt autoremove -y 
sudo snap refresh