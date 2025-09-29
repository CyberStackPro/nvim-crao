-- =============================
-- LSP - TypeScript/JavaScript setup
-- =============================
local lspconfig = require("lspconfig")

-- lspconfig.tsserver.setup({})
lspconfig.ts_ls.setup({
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  single_file_support = true,  -- Optional for standalone files
})

