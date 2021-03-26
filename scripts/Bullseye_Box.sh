#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.scripts

sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free

sudo apt-get install -y openbox obconf rxvt-unicode mousepad apt-rdepends compton compton-conf firefox-esr tint2 menu xsel mirage pulseaudio numlockx pavucontrol mlocate lxappearance vlc arandr apt-file synaptic doublecmd-common xutils mesa-utils xarchiver htop sysstat acpi hardinfo hddtemp xfburn gnome-disk-utility python3-pip ttf-mscorefonts-installer fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder ranger geany gdebi lightdm fbxkb mpv curl gmrun xscreensaver galternatives pnmixer sxiv scrot xsettingsd git wmctrl bleachbit pm-utils terminator arc-theme numix-icon-theme nomacs nitrogen policykit-1-gnome udiskie timeshift dctrl-tools micro firmware-linux firmware-linux-nonfree firmware-misc-nonfree network-manager network-manager-gnome unattended-upgrades net-tools nmap resolvconf dnsutils libglu1-mesa

sudo apt install -y qbittorrent --no-install-recommends
sudo apt install -y pcmanfm-qt --no-install-recommends
sudo apt autoremove

cp -R ~/Bullseye_Box/.config ~/

cp ~/Bullseye_Box/.Xresources ~/

cp ~/Bullseye_Box/keyboard.sh ~/

sudo cp ~/Bullseye_Box/rs.png /usr/share/fbxkb/images/rs.png

sudo chmod -R 777 ~/.config

sudo cp ~/Bullseye_Box/ncmpcpp_48x48.png /usr/share/icons

sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png


# korekcija autorizacije za gdebi
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
# sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

sudo chmod 777 ~/keyboard.sh

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Bullseye_Box/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Bullseye_Box/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Bullseye_Box/start-compton.sh ~/bin
sudo chmod --recursive 777 ~/bin

## instalacija ncmpcpp
sudo apt install -y mpd ncmpcpp
cp -R ~/Bullseye_Box/.ncmpcpp ~/
cp -R ~/Bullseye_Box/.mpd ~/
sudo chmod -R 777 ~/.mpd
sudo chmod -R 777 ~/.ncmpcpp
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp ~/Bullseye_Box/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp ~/Bullseye_Box/scripts/reinstall_youtube-dl.sh ~/.scripts

## Geany theme settings
cp ~/Bullseye_Box/scripts/settings_geany ~/.scripts
cd ~/.scripts
sudo ./settings_geany
sudo chmod 777 ~/.config/geany/geany.conf

## obmenu-generator
cp ~/Bullseye_Box/scripts/obmenu-generator.sh ~/.scripts

# mkdir ~/projects
# cd ~/projects
# git clone https://github.com/speja969/debian-openbox.git

# sudo chmod --recursive 777 ~/projects
sudo chmod --recursive 777 ~/.scripts

# cd ~/projects/debian-openbox/10_openbox_terminator
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_arc-theme-gtk
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
# sudo ./install.sh

cd && wget -O wps-office.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9719/wps-office_11.1.0.9719.XA_amd64.deb
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cp ~/Bullseye_Box/scripts/install_missing_wps_fonts.sh ~/.scripts
cd ~/.scripts
sudo ./install_missing_wps_fonts.sh


mkdir /home/$(logname)/.themes          #ako već ne postoji
sudo chown -R $(logname):$(logname) ~/.themes
sudo chmod 777 ~/.themes
cd ~/.themes
git clone https://gitlab.com/dwt1/dt-dark-theme.git 

# cd ~/projects/debian-openbox/10_openbox_conky
# sudo ./install.sh

# cd ~/projects/debian-openbox/config_shortcut-kill-x
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_nomacs-viewer
# sudo ./install.sh
sudo chmod --recursive 777 ~/.config/nomacs

# cd ~/projects/debian-openbox/config_disable-services
# sudo ./install.sh

# Copy wallpapers folderes
sudo cp -r ~/Bullseye_Box/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Bullseye_Box/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

# sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
# cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
# sudo ./install.sh

sudo cp ~/Bullseye_Box/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/lightdm_login.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf

sudo chmod --recursive 777 ~/.config

## setting default text editor
xdg-mime default pcmanfm-qt.desktop inode/directory


## settings htop.desktop & ranger.desktop files
echo "Exec=x-terminal-emulator -T 'htop task manager' -e htop" > /tmp/htop_replacement

sudo sed -i "s/^.*Exec=htop.*$/$(cat /tmp/htop_replacement)/" /usr/share/applications/htop.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/htop.desktop

echo "Exec=x-terminal-emulator -T 'ranger task manager' -e ranger" > /tmp/ranger_replacement

sudo sed -i "s/^.*Exec=ranger.*$/$(cat /tmp/ranger_replacement)/" /usr/share/applications/ranger.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ranger.desktop

sudo sed -i 's!Exec=su-to-root -X -c /usr/sbin/disk-manager!Exec=sudo /usr/sbin/disk-manager!' /usr/share/applications/disk-manager.desktop

mkdir -p ~/.urxvt/ext
cp -p ~/Bullseye_Box/ext/* ~/.urxvt/ext/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/urxvtc 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvtc

cd ~/Bullseye_Box/scripts/openbox_conky
sudo chmod --recursive 777 .
sudo ./install.sh

cd ~/Bullseye_Box/scripts/install_vim/
sudo chmod --recursive 777 .
sudo ./install.sh

sudo chown -R $(logname):$(logname) /home/$(logname)/
find /home/$(logname) -name '.*' | xargs sudo chown $(logname):$(logname)
find /home/$(logname) -type f | xargs sudo chmod 700

