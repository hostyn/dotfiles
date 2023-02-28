#!/bin/sh

cd ~

# ==== Installing pacman packages ==== #

sudo pacman -Syyu --noconfirm
sudo pacman -S base-devel sddm qtile neovim alacritty git zsh python-pip pacman-contrib feh picom otf-cascadia-code-nerd ttf-hack-nerd ttf-mononoki-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd udiskie volumeicon plasma-workspace lsd bat --needed --noconfirm

# ==== Create user directories ==== #

mkdir Downloads Documents Pictures Desktop Music Videos Git

# ==== Clone dotfiles ==== #

git clone https://github.com/hostyn/dotfiles.git ~/Git/dotfiles

mv ~/Git/dotfiles/.background ~
mv ~/Git/dotfiles/.config ~

sudo mkdir /etc/sddm.conf.d/
sudo cp -f ~/Git/dotfiles/sddm.conf /etc/sddm.conf.d/default.conf
sudo cp ~/Git/dotfiles/monitors.sh /etc/sddm.conf.d/monitors.sh
cp ~/Git/dotfiles/.zshrc ~/.zshrc

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

# ==== Installing zsh dependencies ==== #

mkdir ~/.zsh
cd ~/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh -O zsh-sudo.zsh

sudo chsh -s /bin/zsh $USER

# ==== Start SDDM ==== #

sudo systemctl start sddm
