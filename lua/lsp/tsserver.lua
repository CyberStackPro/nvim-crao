-- =============================
-- LSP - TypeScript/JavaScript setup
-- =============================
local lsp = vim.lsp

lsp.config.ts_ls.setup({
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json", ".git" }, { upward = true })[1]),
  single_file_support = true,
})

