#!/bin/bash

# Omarchy logo in a font for Waybar use
mkdir -p ~/.local/share/fonts
cp ~/.local/share/birdarch/config/omarchy.ttf ~/.local/share/fonts/
fc-cache
