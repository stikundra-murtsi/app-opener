#!/bin/bash

read -e -p "Uninstall app-opener? (y/n) " cmf
if [ $cmf == "y" ]; then
  sudo rm -rf /opt/app-opener
  sudo rm /usr/bin/app
  sudo rm -rf $HOME/.app-opener
  echo -e "\e[32mapp-opener is uninstalled...\e[0m"
fi
