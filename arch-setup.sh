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
#Defining some colors for some state. Make the installation less monochromatic
OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
WARN="$(tput setaf 166)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
ORANGE=$(tput setaf 166)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

colorize_prompt() {
    local color="$1"
    local message="$2"
    echo -n "${color}${message}$(tput sgr0)"
}

# Set the name of the log file to current time => Making the logs unique if you were to reinstall things.
LOG="install-$(date +%d-%H%M%S).log"

script_directory=install-scripts

ask_yes_no() {
  if [[ ! -z "${!2}" ]]; then
    echo "$(colorize_prompt "$CAT"  "$1 (Preset): ${!2}")" 
    if [[ "${!2}" = [Yy] ]]; then
      return 0
    else
      return 1
    fi
    # Mark yes with 0 and no with 1. and colorize the questions for installation's settings.
}
