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

-- Toggle themes (cycles Ayu -> Gruvbox -> Nightfox -> Catppuccin)
map("n", "<leader>tt", function()
  require("ui.theme").toggle()
end, { desc = "Toggle themes" })

-- Move selected lines up/down in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move the current line up/down in Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Optional: in Insert mode (so you don’t need to leave insert mode)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

--
-- -- Open terminal at the bottom
-- vim.keymap.set("n", "<leader>t", function()
--   vim.cmd("botright split | resize 15 | terminal")
-- end, { desc = "Open terminal at bottom" })
--

-- Toggle bottom terminal
-- local term_buf = nil
-- local term_win = nil
--
-- vim.keymap.set("n", "<leader>t", function()
--   -- if terminal already open → close it
--   if term_win and vim.api.nvim_win_is_valid(term_win) then
--     vim.api.nvim_win_close(term_win, true)
--     term_win = nil
--     return
--   end
--
--   -- if not open → open new terminal at bottom
--   vim.cmd("botright split")
--   vim.cmd("resize 15") -- terminal height
--   term_buf = vim.api.nvim_create_buf(false, true)
--   term_win = vim.api.nvim_get_current_win()
--   vim.fn.termopen(vim.o.shell) -- start default shell
--   vim.cmd("startinsert")       -- go into insert mode
-- end, { desc = "Toggle terminal" })
--

-- Toggle a single bottom terminal
local term_buf = nil
local term_win = nil

vim.keymap.set("n", "<leader>t", function()
  -- if terminal window exists and is valid → close it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- if buffer exists → open it in bottom split
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.cmd("botright split")
    vim.cmd("resize 15")
    term_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(term_win, term_buf)
    vim.cmd("startinsert")
    return
  end

  -- otherwise, create new terminal buffer
  term_buf = vim.api.nvim_create_buf(false, true)
  vim.cmd("botright split")
  vim.cmd("resize 15")
  term_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(term_win, term_buf)
  vim.fn.termopen(vim.o.shell)
  vim.cmd("startinsert")
end, { desc = "Toggle bottom terminal" })
