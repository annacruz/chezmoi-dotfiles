#!/usr/bin/env bash
# trigger: {{ include "Brewfile" | sha256 }}
set -euo pipefail

# Ensure Homebrew exists
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -d /opt/homebrew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
  if [ -d /usr/local/Homebrew ]; then eval "$(/usr/local/bin/brew shellenv)"; fi
fi

# Install from your Brewfile in the repo
brew bundle --file="$CHEZMOI_SOURCE_DIR/Brewfile"

