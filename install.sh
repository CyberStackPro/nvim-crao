#!/usr/bin/env bash

set -e

echo "Backing up old Neovim config (if exists)..."
if [ -d "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
  echo "Old config moved to ~/.config/nvim.bak"
fi

echo "Cloning your Neovim config..."
git clone https://github.com/CyberStackPro/nvim-crao.git ~/.config/nvim

echo "Installing lazy.nvim..."
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim

echo "Installing plugins..."
nvim --headless "+Lazy! sync" +qa

echo "✅ Done! Start Neovim with:"
echo "nvim"
