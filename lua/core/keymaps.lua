-- =============================
-- KEYMAPS - VSCode-like shortcuts
-- =============================
local map = vim.keymap.set

-- Toggle NvimTree (Ctrl+B)
map("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Select All (Ctrl+A)
map("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<C-S-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope git_files<CR>", { silent = true })

-- Buffer navigation
map("n", "<C-Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<C-S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "<C-w>", ":bdelete<CR>", { noremap = true, silent = true })

-- Copy visual selection to clipboard (Ctrl+C)
map("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { silent = true })
map("n", "]d", vim.diagnostic.goto_next, { silent = true })

-- Toggle themes
map("n", "<leader>tt", function()
  require("ui.theme").toggle()
end, { desc = "Toggle themes" })

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Toggle bottom terminal
local term_buf, term_win
map("n", "<leader>t", function()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.cmd("botright split | resize 15")
    term_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(term_win, term_buf)
    vim.cmd("startinsert")
    return
  end
  term_buf = vim.api.nvim_create_buf(false, true)
  vim.cmd("botright split | resize 15")
  term_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(term_win, term_buf)
  vim.fn.termopen(vim.o.shell)
  vim.cmd("startinsert")
end, { desc = "Toggle bottom terminal" })

