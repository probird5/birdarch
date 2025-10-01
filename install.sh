#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

export PATH="$HOME/.local/share/birdarch/bin:$PATH"
BIRDARCH_INSTALL=~/.local/share/birdarch/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mOmarchy installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/birdarch/install.sh"
  echo "Get help from the community: https://discord.gg/tXFUdasqhY"
}

trap catch_errors ERR

show_logo() {
  clear
  tte -i ~/.local/share/birdarch/logo.txt --frame-rate ${2:-120} ${1:-expand}
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
source $BIRDARCH_INSTALL/preflight/guard.sh
source $BIRDARCH_INSTALL/preflight/aur.sh
source $BIRDARCH_INSTALL/preflight/presentation.sh
source $BIRDARCH_INSTALL/preflight/migrations.sh

# Configuration
show_logo beams 240
show_subtext "Let's install Omarchy! [1/5]"
source $BIRDARCH_INSTALL/config/identification.sh
source $BIRDARCH_INSTALL/config/dotfiles-setup.sh
source $BIRDARCH_INSTALL/config/config.sh
source $BIRDARCH_INSTALL/config/detect-keyboard-layout.sh
source $BIRDARCH_INSTALL/config/fix-fkeys.sh
source $BIRDARCH_INSTALL/config/network.sh
source $BIRDARCH_INSTALL/config/power.sh
source $BIRDARCH_INSTALL/config/timezones.sh
source $BIRDARCH_INSTALL/config/login.sh
source $BIRDARCH_INSTALL/config/nvidia.sh
#TODO replace the nvidia script with my own

show_logo decrypt 920
show_subtext "Installing terminal tools [2/5]"
source $OMARCHY_INSTALL/development/terminal.sh
source $OMARCHY_INSTALL/development/development.sh
source $OMARCHY_INSTALL/development/nvim.sh
source $OMARCHY_INSTALL/development/ruby.sh
source $OMARCHY_INSTALL/development/docker.sh
source $OMARCHY_INSTALL/development/firewall.sh

# Updates
#show_logo highlight
#show_subtext "Updating system packages [5/5]"
#sudo updatedb
#sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
#reboot
