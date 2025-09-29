local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- =============================
-- ASCII header
-- =============================
dashboard.section.header.val = [[
   ██████╗██████╗  █████╗  ██████╗ 
  ██╔════╝██╔══██╗██╔══██╗██╔═══██╗
  ██║     ██████╔╝███████║██║   ██║
  ██║     ██╔══██╗██╔══██║██║   ██║
  ╚██████╗██║  ██║██║  ██║╚██████╔╝
   ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ 
]]

-- =============================
-- Buttons / shortcuts
-- =============================
dashboard.section.buttons.val = {
    dashboard.button("e", " > New File"    , ":ene <BAR> startinsert<CR>"),
    dashboard.button("E", " > New Folder"  , ":call mkdir(input('Folder name: '), 'p')<CR>"),
    dashboard.button("f", " > Find File"   , ":Telescope find_files<CR>"),
    dashboard.button("r", " > Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("s", " > Settings"    , ":e $MYVIMRC<CR>"),
    dashboard.button("q", " > Quit NVIM"   , ":qa<CR>"),
}

-- =============================
-- Recent files layout
-- =============================
-- Alpha dashboard automatically uses `oldfiles`, 
local function recent_files()
    local files = vim.v.oldfiles
    local result = {}


    -- shorten paths for display (~ for home, relative paths)
    local function display_path(path)
      return vim.fn.fnamemodify(path, ":~")
    end

    local has_nvimtree = vim.fn.exists(":NvimTreeFindFile") == 2

  for i, file in ipairs(files) do
    if file and file ~= "" then
      local display = display_path(file)
      local shortcut = tostring(i % 10) -- 1..9 then 0, cycles if more

      local cmd
      if has_nvimtree then
        cmd = ":e " .. vim.fn.fnameescape(file) .. " | NvimTreeFindFile<CR>"
      else
        cmd = ":e " .. vim.fn.fnameescape(file) .. "<CR>"
      end

      table.insert(result, dashboard.button(shortcut, " " .. display, cmd))
    end
  end

  return result
end
  
-- Append recent files to buttons
vim.list_extend(dashboard.section.buttons.val, recent_files())

-- =============================
-- Open most recent folder button
-- =============================
local function add_open_folder_button()
  local files = vim.v.oldfiles or {}
  if #files == 0 then return end
  local most_recent = files[1]
  local dir = vim.fn.fnamemodify(most_recent, ":h")
  if vim.fn.exists(":NvimTreeToggle") == 2 then
    table.insert(
      dashboard.section.buttons.val,
      1,
      dashboard.button("o", " > Open most-recent folder", ":cd " .. vim.fn.fnameescape(dir) .. " | NvimTreeToggle<CR>")
    )
  end
end

add_open_folder_button()


-- =============================
-- Footer
-- =============================
dashboard.section.footer.val = "Welcome, Crao! 🚀"


-- =============================
-- Apply theme highlights
-- =============================
-- Set highlight groups for Alpha
vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#E6B450", bold = true }) -- Ayu yellow
vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#39BAE6", bold = true }) -- Ayu blue
vim.api.nvim_set_hl(0, "AlphaButtonShortcut", { fg = "#FF8F40", bold = true }) -- Ayu orange
vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#A37ACC", italic = true }) -- Ayu purple

-- Assign highlight groups
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButton"
dashboard.section.footer.opts.hl = "AlphaFooter"

-- Highlight just the shortcut keys ("e", "f", etc.)
for _, btn in ipairs(dashboard.section.buttons.val) do
  btn.opts.hl_shortcut = "AlphaButtonShortcut"
end

-- =============================
-- Setup
-- =============================
alpha.setup(dashboard.opts)

-- Disable folding
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

