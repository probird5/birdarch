#!/bin/bash

ansi_art='                 ▄▄▄                                                   
 ▄█████▄    ▄███████████▄    ▄███████   ▄███████   ▄███████   ▄█   █▄    ▄█   █▄ 
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   █▀   ███   ███  ███   ███
███   ███  ███   ███   ███ ▄███▄▄▄███ ▄███▄▄▄██▀  ███       ▄███▄▄▄███▄ ███▄▄▄███
███   ███  ███   ███   ███ ▀███▀▀▀███ ▀███▀▀▀▀    ███      ▀▀███▀▀▀███  ▀▀▀▀▀▀███
███   ███  ███   ███   ███  ███   ███ ██████████  ███   █▄   ███   ███  ▄██   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
 ▀█████▀    ▀█   ███   █▀   ███   █▀   ███   ███  ███████▀   ███   █▀    ▀█████▀ 
                                       ███   █▀                                  '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/birdarch
BIRDARCH_REPO="${BIRDARCH_REPO:-probird5/birdarch}"

echo -e "\nCloning Omarchy from: https://github.com/${BIRDARCH_REPO}.git"
rm -rf ~/.local/share/birdarch/
git clone "https://github.com/${BIRDARCH_REPO}.git" ~/.local/share/birdarch >/dev/null

# Use custom branch if instructed
if [[ -n "$BIRDARCH_REF" ]]; then
  echo -e "\eUsing branch: $BIRDARCH_REF"
  cd ~/.local/share/birdarch
  git fetch origin "${BIRDARCH_REF}" && git checkout "${BIRDARCH_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/birdarch/install.sh
