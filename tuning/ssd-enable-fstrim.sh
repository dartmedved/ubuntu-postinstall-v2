#!/bin/bash

sudo systemctl status fstrim.timer
sudo systemctl enable fstrim.timer
sudo systemctl start  fstrim.timer
sudo systemctl status fstrim.timer