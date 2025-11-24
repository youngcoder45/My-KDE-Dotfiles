# A Neovim Configuration

This is a simple neovim configuration I made for my personal use. Its my first time creating one, I followed typecraft, primeagen to learn how to configure neovim, so if you also want to make your own, check their individual playlists. I shared this on github and created an installation script because if I lose my config due to some reason, I can easily back it up from here but if you wanna try this just run the installation script below in your terminal but first make sure you meet some few requirements listed below. Thank you for your visit („• ᴗ •„)

![Neovim Configuration Demo](./nvim-demo.gif)

## Features
- LSP support for languages like python, javascript, c and cpp, html and css etc.
- Linting and formatting support using none-ls
- File explorer with modern tree navigation
- Advanced syntax highlighting with Treesitter
- Auto-completion and snippets
- Telescope fuzzy finder
- Beautiful statusline and themes
- Plugin management with lazy loading


## Requirements
- Neovim >= 0.8
- Git
- curl
- Node.js (for LSP servers)
- Python 3 (for some plugins)
- Ripgrep (for better search)
- A stable internet connection

## Installation

### Automated Installation
```bash
curl -sSL https://raw.githubusercontent.com/Hashir-10/Nvim-config/main/install.sh | bash
```

##  Important Notes
- This installation will backup your existing Neovim config if you have one, so it wont harm your current nvim configuration.
- After installation, the config becomes independent (no git history)
- You can safely modify it without affecting this repository
- If you see some errors from mason after plugin installation it is due to a bad internet connection most probably, if you are sure that your connection is stable then open neovim in `~/.config/nvim` and wait for a while and let mason install everything. If it still fails then retry and it will work eventually.

## Usage
After installation, simply run:
```bash
nvim
```

If you want to learn about vim-motions i.e vim-keybindings then type `:Tutor` in normal mode and it will open an interactive guide for you to learn about vim and vim-motions and covers eveything about vim-motions that you will use in daily development.

## Key Mappings
- `CTRL + f , in normal mode` - Find files (Telescope)
- `space + lg , in normal mode` - Live grep search
- `ALT + 1 or any number , this number represents your tab , works in normal mode` - Change tabs
- `space + cd , in normal mode` - To close current tab
- `space + f , in normal mode` - To open or close file explorer
- `space + e , in normal mode` - To move your cursor from file explorer to current window and vice versa
- `a, f, d, r` - Type a while in the file explorer to create a new folder or file, type f while in file explorer to find files, type d while in file explorer and while your cursor is set on a file or folder you want to delete to delete that file or folder, type r while in file explorer and while your cursor is set on a file or folder to rename that file or folder
- `jk, in insert mode` - If you type jk fast consecutively in insert mode you can enter normal mode its a keybind I set for myself because I find pressing esc tiresome everytime, you can still use esc or CTRL + C to enter normal mode.

These are some keybindings I set according to my personal comfort to navigate through projects, you can change them by going to individual plugin files.

##  Customization
Feel free to modify the configuration files in `~/.config/nvim/` to suit your needs!
All plugins are in  `~/.config/nvim/lua/plugins` directory, you can add more in this directory or modify the existing ones.

---
⭐ If you found this niche nvim config nice, please give it a star hehe!
