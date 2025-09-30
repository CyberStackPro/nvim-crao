-- =============================
-- OPTIONS - Basic Neovim settings
-- =============================

local opt = vim.opt

-- Line numbers
opt.number = true

-- Enable true colors
opt.termguicolors = true

-- Clipboard
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

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

