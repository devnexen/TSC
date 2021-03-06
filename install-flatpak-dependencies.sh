#!/bin/bash

# Debian 9

git submodule init

git submodule update

sudo echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list

sudo apt-get update

sudo apt-get install -t stretch-backports flatpak flatpak-builder -y

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.gnome.Builder -y

flatpak install flathub org.freedesktop.Sdk//18.08 -y

flatpak install flathub org.freedesktop.Platform/x86_64/18.08 -y
