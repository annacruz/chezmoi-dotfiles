#!/usr/bin/env bash
set -euo pipefail

ZSH_DIR="${ZSH:-$HOME/.oh-my-zsh}"

if [ ! -d "$ZSH_DIR" ]; then
  echo "Installing oh-my-zsh…"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh already present, updating…"
  git -C "$ZSH_DIR" pull --ff-only
fi
