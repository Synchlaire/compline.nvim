-- Compline: Auto-switching colorscheme wrapper
-- Redirects to compline-dark or compline-lauds based on vim.o.background

-- Detect current background preference
local bg = vim.o.background
if bg == "" or bg == nil then
  bg = "dark"  -- Default to dark
  vim.o.background = "dark"
end

-- Load the appropriate variant using dofile instead of :colorscheme
-- to avoid Neovim's colorscheme command overhead
local variant = (bg == "light") and "compline-lauds" or "compline-dark"
local script_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
local variant_file = script_path .. "/" .. variant .. ".lua"

-- Directly execute the variant file
dofile(variant_file)
