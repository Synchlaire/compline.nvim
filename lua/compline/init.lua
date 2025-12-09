-- compline.nvim - Monastic minimalism for Neovim
-- Optional Lua module for programmatic access

local M = {}

M.colors = {
  compline = {
    bg = "#1a1d21",
    fg = "#f0efeb",
    base0 = "#0f1114",
    base1 = "#22252a",
    base2 = "#2f3239",
    base3 = "#3c3f47",
    base4 = "#515761",
    base5 = "#676d77",
    base6 = "#787e88",
    base7 = "#8b919a",
    red = "#cdacac",
    orange = "#ccc4b4",
    yellow = "#d4ccb4",
    green = "#b8c4b8",
    cyan = "#b4c0c8",
    blue = "#b4bcc4",
    teal = "#b4c4bc",
    dark_cyan = "#98a4ac",
  },
  lauds = {
    bg = "#f0efeb",
    fg = "#1a1d21",
    base0 = "#f5f4f2",
    base1 = "#e8e7e3",
    base2 = "#d9d8d4",
    base3 = "#c4c3bf",
    base4 = "#999591",
    base5 = "#7a7672",
    base6 = "#686460",
    base7 = "#5f5c58",
    red = "#8b6666",
    orange = "#7a6d5a",
    yellow = "#8b7e52",
    green = "#5a6b5a",
    cyan = "#64757d",
    blue = "#5a6b7a",
    teal = "#4d6b6b",
    dark_cyan = "#546470",
  },
}

-- Load a theme programmatically
function M.load(theme)
  if theme == "compline" or theme == "lauds" then
    vim.cmd.colorscheme(theme)
  else
    vim.notify("Invalid theme: " .. theme, vim.log.levels.ERROR)
  end
end

-- Get current theme colors
function M.get_colors()
  local theme = vim.g.colors_name
  return M.colors[theme] or M.colors.compline
end

return M
