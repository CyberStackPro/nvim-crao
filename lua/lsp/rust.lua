-- =============================
-- LSP - Rust with rustaceanvim
-- =============================

vim.g.rustaceanvim = {
  tools = {},
  server = {
    on_attach = function(client, bufnr)
      -- Helper: make keymap for buffer only
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- LSP-related keymaps
      map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
      map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
      map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
      map("n", "gr", vim.lsp.buf.references, "Show References")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
      map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format Code")
    end,

    default_settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = { command = "clippy" },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true,
          },
        },
      },
    },
  },

  dap = {}, -- leave as-is unless setting up debugger
}
-- rt.setup({
--   server = {
--     -- All default lspconfig options go here
--     settings = {
--       ["rust-analyzer"] = {
--         cargo = { allFeatures = true },
--         checkOnSave = { command = "clippy" },  -- lint on save
--         inlayHints = { locationLinks = false },
--       },
--     },
--   },
-- })
--
