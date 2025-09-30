-- =============================
-- INIT.LUA - Entry point
-- =============================

-- Load Lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core configs
require("core.options")
require("core.keymaps")
require("core.plugins")

-- Load LSP configs
require("lsp.tsserver")
--require("lsp.rust")
require("lsp.python")
require("lsp.null-ls")
require("core.cmp")

-- Load UI configs
require("ui.theme")
require("ui.statusline")
require("ui.alpha")

print("Welcome to Neovim, Crao!")

