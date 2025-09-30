-- =============================
-- PLUGINS - Lazy.nvim setup
-- =============================
require("lazy").setup({

  -- Essentials
  "tpope/vim-sensible",

  -- LSP
  "neovim/nvim-lspconfig",

  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ts_ls" },
    },
  },

  -- Autocomplete
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",

  -- UI / Theme
  "Shatur/neovim-ayu",
  "morhetz/gruvbox",

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({ options = { transparent = false } })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          lualine = true,
          treesitter = true,
          native_lsp = { enabled = true },
          cmp = true,
        },
      })
    end,
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    colors = {
      bg = "#000000",
      green = "#00ff00",
      dark = {
        magenta = "#ff00ff",
        fg = "#eeeeee",
      },
      light = {
        red = "#ff5c57",
        cyan = "#5ef1ff",
      },
    },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter (syntax highlighting & indentation)
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "query",
          "javascript", "typescript", "tsx",
          "rust", "python",
          "json", "yaml", "html", "css",
          "markdown", "markdown_inline",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "ayu_dark" } })
    end,
  },

  -- Error linting (Null-ls)
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("lsp.null-ls")
    end,
  },

  -- UI Alpha (startup screen)
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("ui.alpha")
    end,
  },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },
})

