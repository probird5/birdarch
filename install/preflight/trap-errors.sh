#!/bin/bash

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mBirdarch installation failed!\e[0m"
  echo
  echo "This command halted with exit code $?:"
  echo "$BASH_COMMAND"
  echo

  echo "You can retry by running: bash ~/.local/share/birdarch/install.sh"
}

trap catch_errors ERR
