-- ─────────────────────────────────────────────────────────────────
-- NEOVIM CONFIGURATION - Modern & Professional
-- ─────────────────────────────────────────────────────────────────

-- Basic settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Node.js path (update this to your actual path)
vim.env.PATH = vim.env.HOME .. "/.config/nvm/versions/node/v22.18.0/bin:" .. vim.env.PATH

-- Display settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 6
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Better editing experience
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Aesthetics for line numbers
local function apply_number_highlights()
  pcall(vim.cmd, "highlight! link LineNr Comment")
  pcall(vim.cmd, "highlight! link CursorLineNr String")
end

-- Status column with better styling
vim.opt.statuscolumn = "%#LineNr# %{v:lnum} %#Normal#"

apply_number_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_number_highlights,
})

-- Better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Note: lazyredraw disabled for compatibility with UI plugins like Noice
-- vim.opt.lazyredraw = true

-- Auto-save when losing focus
vim.api.nvim_create_autocmd("FocusLost", {
  command = "silent! wa"
})

-- Apply number highlights after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_number_highlights,
})

-- Remove ~ from empty lines for cleaner look
vim.opt.fillchars = { eob = " " }

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  command = "%s/\\s\\+$//e"
})

-- Git timeout setting
vim.g.lazy_git_timeout = 600

-- ─────────────────────────────────────────────────────────────────
-- KEY MAPPINGS - Enhanced Productivity
-- ─────────────────────────────────────────────────────────────────

-- Better escape
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, desc = "Exit insert mode" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all text" })

-- System clipboard operations
vim.keymap.set("n", "yc", '"+yy', { noremap = true, silent = true, desc = "Copy line to system clipboard" })
vim.keymap.set("v", "yc", '"+y', { noremap = true, silent = true, desc = "Copy selection to system clipboard" })
vim.keymap.set("n", "yp", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })
vim.keymap.set("v", "yp", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- Move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Clear search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
