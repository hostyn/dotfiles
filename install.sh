#!/bin/sh

cd ~

# ==== Installing pacman packages ==== #

sudo pacman -S base-devel sddm qtile neovim alacritty git zsh python-pip pacman-contrib feh picom otf-cascadia-code-nerd ttf-hack-nerd ttf-mononoki-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd udiskie volumeicon --needed --noconfirm

# ==== Create user directories ==== #

mkdir Downloads Documents Pictures Desktop Music Videos Git

# ==== Clone dotfiles ==== #

git clone https://github.com/hostyn/dotfiles.git ~/Git/dotfiles

mv ~/Git/dotfiles/.background ~
mv ~/Git/dotfiles/.config ~

sudo mkdir /etc/sddm.conf.d/
sudo cp -f ~/Git/dotfiles/sddm.conf /etc/sddm.conf.d/default.conf
sudo cp ~/Git/dotfiles/monitors.sh /etc/sddm.conf.d/monitors.sh

# ==== Installing paru ==== #

git clone https://aur.archlinux.org/paru.git ~/Git/paru
cd ~/Git/paru
makepkg -si --noconfirm

cd ~

# ==== Installing AUR packages ==== #

paru -S bibata-cursor-theme nm-applet --noconfirm

# ==== SDDM Config ==== #

sudo systemctl enable sddm

sudo rm /usr/share/wayland-sessions/qtile-wayland.desktop

# ==== SDDM Theme ==== #

git clone https://github.com/yeyushengfan258/McSur-kde.git ~/Git/McSur
cd ~/Git/McSur/sddm-dark
chmod +x install.sh
sudo ./install.sh
cd ~

# ==== Installing qtile conifg dependencies ==== #

pip install psutil

# ==== Start SDDM ==== #

sudo systemctl start sddm
