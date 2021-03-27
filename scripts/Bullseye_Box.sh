#!/bin/bash

sudo apt update && sudo apt -y upgrade

mkdir /home/$(logname)/.scripts

#sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free

sudo apt install -y ttf-mscorefonts-installer qbittorrent --no-install-recommends
sudo apt install -y pcmanfm-qt --no-install-recommends

sudo apt-get install -y openbox obconf rxvt-unicode mousepad firefox-esr lightdm fbxkb terminator tint2 apt-rdepends compton compton-conf menu xsel mirage pulseaudio numlockx pavucontrol mlocate lxappearance vlc arandr apt-file synaptic doublecmd-common xutils mesa-utils xarchiver htop sysstat acpi hardinfo hddtemp xfburn gnome-disk-utility python3-pip fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder ranger geany gdebi mpv curl gmrun xscreensaver galternatives pnmixer sxiv scrot xsettingsd git wmctrl bleachbit pm-utils arc-theme numix-icon-theme nitrogen policykit-1-gnome udiskie timeshift dctrl-tools micro firmware-linux firmware-linux-nonfree firmware-misc-nonfree network-manager network-manager-gnome net-tools nmap resolvconf dnsutils libglu1-mesa


cp -R /home/$(logname)/Bullseye_Box/.config /home/$(logname)/

cp /home/$(logname)/Bullseye_Box/.Xresources /home/$(logname)/

cp /home/$(logname)/Bullseye_Box/keyboard.sh /home/$(logname)/

sudo cp /home/$(logname)/Bullseye_Box/rs.png /usr/share/fbxkb/images/rs.png

sudo chmod -R 777 /home/$(logname)/.config

sudo cp /home/$(logname)/Bullseye_Box/ncmpcpp_48x48.png /usr/share/icons

sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png


# korekcija autorizacije za gdebi
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
# sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

sudo chmod 777 /home/$(logname)/keyboard.sh

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp /home/$(logname)/Bullseye_Box/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> /home/$(logname)/.bashrc

## instalacija comptona
cp /home/$(logname)/Bullseye_Box/scripts/install_compton.sh /home/$(logname)/.scripts
mkdir /home/$(logname)/bin
cp /home/$(logname)/Bullseye_Box/start-compton.sh /home/$(logname)/bin
sudo chmod --recursive 777 /home/$(logname)/bin

## instalacija ncmpcpp
sudo apt-get install -y mpd ncmpcpp
cp -R /home/$(logname)/Bullseye_Box/.ncmpcpp /home/$(logname)/
cp -R /home/$(logname)/Bullseye_Box/.mpd /home/$(logname)/
sudo chmod -R 777 /home/$(logname)/.mpd
sudo chmod -R 777 /home/$(logname)/.ncmpcpp
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp /home/$(logname)/Bullseye_Box/scripts/screeny /home/$(logname)/.scripts
sudo chmod +x /home/$(logname)/.scripts/screeny

## script for reinstall youtube-dl
cp /home/$(logname)/Bullseye_Box/scripts/reinstall_youtube-dl.sh /home/$(logname)/.scripts

## Geany theme settings
cp /home/$(logname)/Bullseye_Box/scripts/settings_geany /home/$(logname)/.scripts
cd /home/$(logname)/.scripts
sudo chmod +x /home/$(logname)/.scripts/settings_geany
sudo ./settings_geany
sudo chmod 777 /home/$(logname)/.config/geany/geany.conf

## obmenu-generator
cp /home/$(logname)/Bullseye_Box/scripts/obmenu-generator.sh /home/$(logname)/.scripts
sudo chmod +x /home/$(logname)/.scripts/obmenu-generator.sh

# mkdir ~/projects
# cd ~/projects
# git clone https://github.com/speja969/debian-openbox.git

# sudo chmod --recursive 777 ~/projects
sudo chmod --recursive 777 /home/$(logname)/.scripts

# cd ~/projects/debian-openbox/10_openbox_terminator
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_arc-theme-gtk
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
# sudo ./install.sh

cd && wget -O wps-office.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10161/wps-office_11.1.0.10161.XA_amd64.deb
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cp /home/$(logname)/Bullseye_Box/scripts/install_missing_wps_fonts.sh /home/$(logname)/.scripts
cd /home/$(logname)/.scripts
sudo ./install_missing_wps_fonts.sh


mkdir /home/$(logname)/.themes          #ako već ne postoji
sudo chown -R $(logname):$(logname) /home/$(logname)/.themes
sudo chmod -R 777 /home/$(logname)/.themes
cd /home/$(logname)/.themes
git clone https://gitlab.com/dwt1/dt-dark-theme.git 

# cd ~/projects/debian-openbox/10_openbox_conky
# sudo ./install.sh

# cd ~/projects/debian-openbox/config_shortcut-kill-x
# sudo ./install.sh


# cd ~/projects/debian-openbox/config_disable-services
# sudo ./install.sh

# Copy wallpapers folderes
sudo cp -r /home/$(logname)/Bullseye_Box/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r /home/$(logname)/Bullseye_Box/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds
sudo chmod -R 777 /usr/share/backgrounds

# sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
# cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
# sudo ./install.sh

sudo cp /home/$(logname)/Bullseye_Box/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
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

mkdir -p /home/$(logname)/.urxvt/ext
cp -p /home/$(logname)/Bullseye_Box/ext/* /home/$(logname)/.urxvt/ext/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/urxvtc 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvtc

cd /home/$(logname)/Bullseye_Box/scripts/openbox_conky
sudo chmod --recursive 777 .
sudo ./install.sh

#cd ~/Bullseye_Box/scripts/install_vim/
#sudo chmod --recursive 777 .
#sudo ./install.sh

sudo chown -R $(logname):$(logname) /home/$(logname)/
find /home/$(logname) -name '.*' | xargs sudo chown $(logname):$(logname)
find /home/$(logname) -type f | xargs sudo chmod 777

