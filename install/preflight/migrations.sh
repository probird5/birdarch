#!/bin/bash

birdarch_migrations_state_path=~/.local/state/birdarch/migrations
mkdir -p $birdarch_migrations_state_path

for file in ~/.local/share/birdarch/migrations/*.sh; do
  touch "$birdarch_migrations_state_path/$(basename "$file")"
done
