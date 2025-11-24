#!/bin/bash

echo "(￢‿￢ ) Installing this Neovim Configuration..."

# Backup existing config if it exists
if [ -d "$HOME/.config/nvim" ]; then
    echo "(b ᵔ▽ᵔ)b Backing up existing config..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo " ٩(◕‿◕)۶  Backup created!"
fi

# Clone the repository
echo "<(￣︶￣)> Downloading configuration..."
echo "(=^･ｪ･^=)	 Btw if installation fails then restart it again by re-running the script, it mostly fails due to bad internet connection..."
git clone https://github.com/Hashir-10/Nvim-config.git "$HOME/.config/nvim"

# Remove git history to prevent accidental commits
echo "(o^ ^o)/ Cleaning up git history..."
rm -rf "$HOME/.config/nvim/.git"

echo "(｡•̀ᴗ-)✧  Installation complete!"
echo "(つ≧▽≦)つ	 You can now open Neovim and enjoy the configuration!, also after opening nvim wait for a while to let lazy install all the plugins"
echo "ʕಠᴥಠʔ Note: This config is now independent - no risk of pushing to the original repo."
echo "ଘ(੭ˊᵕˋ)੭* ੈ✩‧₊˚ Enjoyyyy !!!"
