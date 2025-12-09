-- compline.nvim - Monastic minimalism for Neovim
-- Main module with configuration and utilities

local M = {}
local config = require("compline.config")

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

-- Setup function (call this in your config)
function M.setup(user_config)
  config.setup(user_config)
end

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
  local colors = M.colors[theme] or M.colors.compline

  -- Apply custom color overrides
  local cfg = config.get()
  if cfg.colors and next(cfg.colors) then
    colors = vim.tbl_deep_extend("force", colors, cfg.colors)
  end

  return colors
end

-- Get current configuration
function M.get_config()
  return config.get()
end

-- Toggle between Compline and Lauds
function M.toggle()
  local current = vim.g.colors_name
  if current == "compline" then
    M.load("lauds")
  else
    M.load("compline")
  end
end

-- Enable transparency
function M.enable_transparency(opts)
  opts = opts or { background = true, float = true, pmenu = true }
  config.update({ transparent = {
    enabled = opts.background or false,
    float = opts.float or false,
    pmenu = opts.pmenu or false,
  }})
end

return M
