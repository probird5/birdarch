#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

export PATH="$HOME/.local/share/birdarch/bin:$PATH"
BIRDARCH_INSTALL=~/.local/share/birdarch/install

# Preparation
source $BIRDARCH_INSTALL/preflight/show-env.sh
source $BIRDARCH_INSTALL/preflight/trap-errors.sh
source $BIRDARCH_INSTALL/preflight/guard.sh
source $BIRDARCH_INSTALL/preflight/chroot.sh
source $BIRDARCH_INSTALL/preflight/repositories.sh
source $BIRDARCH_INSTALL/preflight/migrations.sh
source $BIRDARCH_INSTALL/preflight/first-run-mode.sh

# Packaging
source $BIRDARCH_INSTALL/packages.sh
source $BIRDARCH_INSTALL/packaging/fonts.sh
source $BIRDARCH_INSTALL/packaging/lazyvim.sh
source $BIRDARCH_INSTALL/packaging/webapps.sh
source $BIRDARCH_INSTALL/packaging/tuis.sh

# Reboot
clear

#TODO figure out TTE issue
#tte -i ~/.local/share/birdarch/logo.txt --frame-rate 920 laseretch
echo
echo "You're done! So we're ready to reboot now..." #| tte --frame-rate 640 wipe

if sudo test -f /etc/sudoers.d/99-birdarch-installer; then
  sudo rm -f /etc/sudoers.d/99-birdarch-installer &>/dev/null
  echo -e "\nRemember to remove USB installer!\n\n"
fi

sleep 5
reboot
