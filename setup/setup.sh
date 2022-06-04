#!/bin/bash

#Update
sudo pacman -Syu 

#Install paru
mkdir ~/Downloads
cd ~/Downloads
sudo pacman -S git rust
git clone https://aur.archlinux.org/paru.git
cd ~/Downloads/paru
makepkg -i
cd ~/Dots

#Install the packages in the list
paru --needed --ask 4 -Sy - < ~/Dots/setup/pkglist.txt || error "Failed to install required packages"

#Python packages

pip install python-bidi #Ranger

# Add the fish shell /usr/bin/fish to /etc/shells with
echo /usr/bin/fish | sudo tee -a /etc/shells

#Change your default shell to fish with:
chsh -s /usr/bin/fish

#Make polybar scripts executable
cd ~/Dots/polybar
make

#Copy config files
mkdir ~/.config
cd ~/Dots
make


## For tlp
systemctl enable tlp.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
systemctl enable NetworkManager-dispatcher.service


##Setup git

#Genirate kys
ssh-keygen -o

# To make git work
echo "UserKnownHostsFile ~/.ssh/known_hosts" >> ~/.ssh/config
echo "Dont Forget to add the public key to your github account"
