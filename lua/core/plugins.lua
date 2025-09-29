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
  -- Use opts so Lazy will call require("mason-lspconfig").setup(opts)
  opts = {
    -- try this list; if mason complains about a name (tsserver vs ts_ls),
    -- change "tsserver" to "ts_ls" (see notes below)
    ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "tsserver" },
    -- automatic_enable = true  -- optional; mason-lspconfig will call vim.lsp.enable for installed servers if you want
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
  lazy = false,      -- load immediately so colorscheme is available
  priority = 1000,   -- load early
  config = function()
    -- no forced colorscheme here; theme loader will pick one
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
      flavour = "mocha", -- latte, frappe, macchiato, mocha
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

    -- Override colors
    colors = {
        -- For a list of colors see `lua/cyberdream/colours.lua`

        -- Override colors for both light and dark variants
        bg = "#000000",
        green = "#00ff00",

        -- If you want to override colors for light or dark variants only, use the following format:
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

  -- Treesitter (better syntax)
--  {
  --  "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
  --},
{
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install these parsers automatically
      ensure_installed = {
        "lua", "vim", "vimdoc", "query", -- basics
        "javascript", "typescript", "tsx", -- JS/TS/React
        "rust", -- Rust
        "python", -- Python
        "json", "yaml", "html", "css", -- web stuff
        "markdown", "markdown_inline", -- docs
      },

      sync_install = false,  -- install asynchronously
      auto_install = true,   -- auto-install missing parsers when opening files

      highlight = {
        enable = true,              -- enable syntax highlighting
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,              -- enable Treesitter-based indenting
      },
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

  -- Error Linting
{
"jose-elias-alvarez/null-ls.nvim",
dependencies = { "nvim-lua/plenary.nvim" },
config = function()
  require("lsp.null-ls") 
end,
},

  -- Ui Alpha
{
"goolord/alpha-nvim",
dependencies = { "nvim-tree/nvim-web-devicons" },
config = function()
  require("ui.alpha") 
end,
},
  


  -- Rust
 {
  "simrat39/rust-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local rt = require("rust-tools")
    rt.setup({
      server = {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
            inlayHints = { locationLinks = false },
          },
        },
      },
    })
  end,
},
{
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
},
})

