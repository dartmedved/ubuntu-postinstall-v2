#!/bin/bash
sudo apt remove -y thunderbird
sudo apt remove -y thunderbird*
sudo apt -y autoremove
sudo snap remove thunderbird

