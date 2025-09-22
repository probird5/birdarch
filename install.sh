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

# Updates
#show_logo highlight
#show_subtext "Updating system packages [5/5]"
#sudo updatedb
#sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
reboot
