-- lua/lsp/null-ls.lua
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.clippy,   -- Rust linting
    null_ls.builtins.formatting.rustfmt,   -- Rust formatting
    null_ls.builtins.diagnostics.eslint,   -- JS/TS linting
    null_ls.builtins.formatting.prettier,  -- JS/TS formatting
    null_ls.builtins.diagnostics.flake8,   -- Python linting
    null_ls.builtins.formatting.black,     -- Python formatting
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
      })
    end
  end,
})

