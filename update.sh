#!/bin/bash

rm -rf .config
mkdir .config

# ZSHRC
cp ~/.zshrc .zshrc

# QTILE CONFIG
cp -r ~/.config/qtile .config

# ALACRITTY CONFIG
cp -r ~/.config/alacritty .config

# XDG-OPEN CONFIG
cp ~/.config/mimeapps.list .config

# BACKGROUNDS
cp -r ~/.background .

# SDDM Config
cp /etc/sddm.conf.d/default.conf sddm.conf
