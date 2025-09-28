-- =============================
-- OPTIONS - Basic Neovim settings
-- =============================

local opt = vim.opt

-- Line numbers
opt.number = true

-- Enable true colors
opt.termguicolors = true

-- Better clipboard (system copy/paste)
opt.clipboard = "unnamedplus"

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Scrolling
opt.scrolloff = 8

