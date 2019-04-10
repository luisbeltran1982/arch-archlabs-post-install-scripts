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

###############################################################################################

#software from 'normal' repositories
sudo pacman -S --noconfirm --needed ntfs-3g wget curl
sudo pacman -S --noconfirm --needed mpv youtube-dl mps-youtube socat gtk-engine-murrine
sudo pacman -S --noconfirm --needed neofetch numlockx geany easytag kodi
sudo pacman -S --noconfirm --needed chromium pepper-flash libreoffice-still firefox

###############################################################################################

# installation of zippers and unzippers
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils uudeview arj p7zip lrzip file-roller

###############################################################################################

echo "Installing fonts from Arch Linux repo"

sudo pacman -S adobe-source-sans-pro-fonts --noconfirm --needed
sudo pacman -S noto-fonts --noconfirm --needed
sudo pacman -S terminus-font --noconfirm --needed
sudo pacman -S ttf-bitstream-vera --noconfirm --needed
sudo pacman -S ttf-dejavu --noconfirm --needed
sudo pacman -S ttf-droid --noconfirm --needed
sudo pacman -S ttf-roboto --noconfirm --needed
sudo pacman -S ttf-ubuntu-font-family --noconfirm --needed
sudo pacman -S ttf-hack --noconfirm --needed
sudo pacman -S ttf-inconsolata --noconfirm --needed


echo "################################################################"
echo "####        Fonts from Arch Linux repo have been installed        ####"
echo "################################################################"


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
yay -S --noconfirm --needed gotop-bin pyradio-git mpdscribble mpd-notification xfce-theme-greybird elementary-xfce-icons-git tiny-media-manager dropbox

echo "################################################################"
echo "###################    core software installed  ################"
echo "################################################################"
