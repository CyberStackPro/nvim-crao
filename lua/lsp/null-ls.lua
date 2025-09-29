local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Rust
    null_ls.builtins.diagnostics.clippy,   -- Rust linting
    null_ls.builtins.formatting.rustfmt,   -- Rust formatting
    
    -- JS / TS / JSX / TSX
    null_ls.builtins.diagnostics.eslint_d,   -- JS/TS linting
    null_ls.builtins.formatting.prettier,

    -- Python 
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

