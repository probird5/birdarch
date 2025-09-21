#!/bin/bash

BIRDARCH_MIGRATIONS_STATE_PATH=~/.local/state/bircharch/migrations
mkdir -p $BIRDARCH_MIGRATIONS_STATE_PATH

for file in ~/.local/share/bircharch/migrations/*.sh; do
  touch "$BIRDARCH_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
