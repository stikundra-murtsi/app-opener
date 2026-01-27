#!/bin/bash

p="$(dirname $(realpath $0))"
src="$p/src"

read -e -p "Install app-opener? (y/n) " cmf
if [ $cmf == "y" ]; then
  echo -e "\e[32mInstall Directory: /opt/app-opener\e[0m"
  sudo mkdir -p /opt/app-opener
  sudo cp ${src}/* /opt/app-opener/
  echo -e "\e[32mCreating link...\e[-m"
  sudo ln -sf /opt/app-opener/app-opener.sh /usr/bin/app
  echo -e "\e[32mCreating catalogs: apps, scripts, to $HOME/app-opener/\e[0m"
  mkdir -p $HOME/.app-opener/apps
  mkdir -p $HOME/.app-opener/scripts
  echo -e "\e[32mCreating config...\e[0m"
  mkdir -p $HOME/.config/app-opener/ener
  touch $HOME/.config/app-opener/app-opener.conf
  echo -e "Editor=nano" > $HOME/.config/app-opener/app-opener.conf
  echo -e "\e[32mapp-opener is installed... Good luck!\e[0m"
fi
