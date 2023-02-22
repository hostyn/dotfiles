#!/bin/sh

cd ~

# ==== Installing pacman packages ==== #

sudo pacman -S base-devel sddm qtile neovim alacritty git zsh python3-pip pacman-contrib feh picom --needed --noconfirm

# ==== Create user directories ==== #

mkdir Downloads Documents Pictures Desktop Music Videos Git

# ==== Clone dotfiles ==== #

git clone https://github.com/hostyn/dotfiles.git ~/Git/dotfiles

mv ~/Git/dotfiles/.background ~
mv ~/Git/dotfiles/.config ~
sudo cp -f ~/Git/dotfiles/sddm.conf /etc/sddm.conf.d/default.conf

# ==== Installing paru ==== #

git clone https://aur.archlinux.org/paru.git ~/Git/paru
cd ~/Git/paru
makepkg -si --noconfirm

cd ~

# ==== Installing AUR packages ==== #

paru -S otf-cascadia-code-nerd ttf-hack-nerd ttf-mononoki-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd bibata-cursor-theme --noconfirm

# ==== SDDM Config ==== #

sudo systemctl enable sddm

sudo rm /usr/share/wayland-sessions/qtile-wayland.desktop

# ==== SDDM Theme ==== #

git clone https://github.com/yeyushengfan258/McSur-kde.git ~/Git/McSur
cd ~/Git/McSur/sddm-dark
chmod +x install.sh
./install.sh
cd ~

# ==== Installing qtile conifg dependencies ==== #

pip install psutil
