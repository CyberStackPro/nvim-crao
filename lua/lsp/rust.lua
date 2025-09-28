-- =============================
-- LSP - Rust with rust-tools.nvim
-- =============================
local rt = require("rust-tools")

rt.setup({
  server = {
    -- All default lspconfig options go here
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = { command = "clippy" },  -- lint on save
        inlayHints = { locationLinks = false },
      },
    },
  },
})

