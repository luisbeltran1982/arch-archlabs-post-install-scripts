#!/bin/bash
set -e

echo "################################################################"
echo "####             Installing reflector                        ###"
echo "################################################################"

# installing refector to test wich servers are fastest
sudo pacman -S --noconfirm --needed reflector


echo "################################################################"
echo "####   finding fastest servers be patient for the world      ###"
echo "################################################################"

# finding the fastest archlinux servers

# reflector --verbose --latest 15 --sort rate --save /etc/pacman.d/mirrorlist


echo "################################################################"
echo "####       fastest servers  saved                            ###"
echo "################################################################"


cat /etc/pacman.d/mirrorlist


sudo pacman -Syu


echo "################################################################"
echo "###############       mirrorlist updated      ###################"
echo "################################################################"

#software from 'normal' repositories
sudo pacman -S --noconfirm --needed ntfs-3g wget curl
sudo pacman -S --noconfirm --needed mpv cmus libmad youtube-dl mps-youtube
sudo pacman -S --noconfirm --needed glances neofetch numlockx kodi
sudo pacman -S --noconfirm --needed noto-fonts ttf-roboto gtk-engine-murrine adapta-gtk-theme papirus-icon-theme arc-gtk-theme
sudo pacman -S --noconfirm --needed chromium gparted qbittorrent evince grsync mcomix libreoffice-fresh pepper-flash

###############################################################################################

# installation of zippers and unzippers
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils uudeview arj cabextract file-roller p7zip lrzip

###############################################################################################

########################################
########          YAY	        ########
########################################

package="yay-bin"
command="yay-bin"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"

else

	mkdir /tmp/yay-bin

	git clone https://aur.archlinux.org/yay-bin.git

	mv yay-bin /tmp/

	cd /tmp/yay-bin

	makepkg -i /tmp/yay-bin --noconfirm

	rm -rf /tmp/yay-bin

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then
	
	echo "################################################################"
	echo "#########  "$package" has been installed"
	echo "################################################################"

	else

	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!!!!!!!!!  "$package" has NOT been installed"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

	fi

fi

#Software from AUR
yay -S --noconfirm ttf-roboto-mono cmusfm gotop-bin xfce-theme-greybird elementary-xfce-icons ttf-google tiny-media-manager-bin

echo "################################################################"
echo "###################    core software installed  ################"
echo "################################################################"

