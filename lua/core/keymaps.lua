-- =============================
-- KEYMAPS - VSCode-like shortcuts
-- =============================
local map = vim.keymap.set

-- Toggle NvimTree (Ctrl+B)
map("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Select All (Ctrl+A)
map("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Telescope Find Files (Ctrl+P)
map("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })

-- Telescope Live Grep (Ctrl+Shift+F)
map("n", "<C-S-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- Buffer Navigation
map("n", "<C-Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<C-S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Close buffer (Ctrl+W)
map("n", "<C-w>", ":bdelete<CR>", { noremap = true, silent = true })

map("v", "<C-c>", '"+y', { noremap = true, silent = true })  -- copy visual selection to system clipboard

-- Telescope extra
map("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope git_files<CR>", { silent = true })

-- Diagnostics navigation
map("n", "[d", vim.diagnostic.goto_prev, { silent = true })
map("n", "]d", vim.diagnostic.goto_next, { silent = true })

