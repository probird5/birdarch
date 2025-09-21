#!/bin/bash

ansi_art='ADD ART HERE 
    █▀                                  '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to probird5/birdarch
BIRCHARCH_REPO="${BIRCHARCH_REPO:-probird5/birdarch}"

echo -e "\nCloning Omarchy from: https://github.com/${BIRCHARCH_REPO}.git"
rm -rf ~/.local/share/birdarch/
git clone "https://github.com/${BIRCHARCH_REPO}.git" ~/.local/share/birdarch >/dev/null

# Use custom branch if instructed, otherwise default to master
BIRCHARCH_REF="${BIRCHARCH_REF:-master}"
if [[ $BIRCHARCH_REF != "master" ]]; then
  echo -e "\eUsing branch: $BIRCHARCH_REF"
  cd ~/.local/share/birdarch
  git fetch origin "${BIRCHARCH_REF}" && git checkout "${BIRCHARCH_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/birdarch/install.sh
