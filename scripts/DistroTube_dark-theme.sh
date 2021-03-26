#!/bin/bash

sudo apt update && sudo apt upgrade

mkdir /home/$(logname)/.themes          #ako već ne postoji
sudo chown $(logname):$(logname) /home/$(logname)/.themes
sudo chmod 777 ~/.themes
cd /home/$(logname)/.themes
git clone https://gitlab.com/dwt1/dt-dark-theme.git 
