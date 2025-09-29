-- =============================
-- Theme setup
-- =============================
-- vim.opt.termguicolors = true
-- vim.g.ayu_style = "dark"  -- ayu theme: 'dark', 'light', 'mirage'
-- local theme = "ayu"  -- "ayu", "nightfox", "catppuccin-mocha"

-- vim.cmd.colorscheme(theme)
--
-- lua/ui/theme.lua
local M = {}

vim.opt.termguicolors = true

-- list of theme names your setup may use (must match plugin's colorscheme name)
local THEMES = {
  "ayu",                 -- from Shatur/neovim-ayu
  "gruvbox",             -- from morhetz/gruvbox
  "nightfox",            -- from EdenEast/nightfox.nvim
  "catppuccin",          -- from catppuccin/nvim (we set flavour in plugin config)
  "cyberdream",
}

-- Try to apply a theme, return true on success
local function try_set(name)
  local ok, _ = pcall(vim.cmd.colorscheme, name)
  return ok
end

-- Try to set first available theme in THEMES (useful at startup)
local function apply_first_available()
  for _, name in ipairs(THEMES) do
    if try_set(name) then
      vim.g.colors_name = name
      return name
    end
  end
  -- nothing applied: leave default (no colorscheme)
  return nil
end

-- Toggle function: cycle through THEMES
function M.toggle()
  local current = vim.g.colors_name or ""
  local idx = 1
  for i, t in ipairs(THEMES) do
    if t == current then idx = i; break end
  end
  local next = THEMES[(idx % #THEMES) + 1] -- next index
  if try_set(next) then
    print("Switched to " .. next)
    vim.g.colors_name = next
  else
    print("Failed to switch to " .. next .. " (not installed?)")
  end
end

-- At startup attempt to apply the first available theme
local applied = apply_first_available()
if applied then
  -- optionally print or set more UI options per theme here
 print("Theme loaded: ", applied)
end

return M

