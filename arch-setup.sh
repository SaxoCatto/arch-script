#!bin/bash

if [[$EUID -eq 0]]; then
  echo "It appears that you are having root privileges. Do exit with command "exit" or something like that."
  exit 1
fi

clear
# Screen if prerequisites are met
echo "Welcome to saxo_cat's Arch + Hyprland auto script. If possible, rice too."

echo "You will see some questions regarding the settings of the installation. Also this is not tested in VM yet so DON'T."

read -p "$(tput setaf 6)Would you like to proceed? (y/n): $(tput sgr0)" proceed

if [ "$proceed" != "y" ]; then
    echo "Installation aborted."
    exit 1
fi

if [ ! -d script-logs ]; then
    mkdir script-Logs
fi
