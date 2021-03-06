#!/bin/bash

sudo apt update && sudo apt upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

sudo apt install mpd ncmpcpp

mkdir ~/.mpd

mkdir ~/.ncmpcpp

cp ~/Bullseye_Box/dotfiles/config ~/.ncmpcpp

cp ~/Bullseye_Box/dotfiles/mpd.conf ~/.mpd

touch ~/.mpd/mpd.db ~/.mpd/mpd.log ~/.mpd/mpd.pid

sudo chmod --recursive 777 ~/.mpd
sudo chmod --recursive 777 ~/.ncmpcpp
