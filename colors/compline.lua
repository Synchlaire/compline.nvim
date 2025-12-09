-- Compline: Auto-switching colorscheme
-- Automatically selects dark or light based on vim.o.background

-- Detect which variant to load
local variant = vim.o.background == "light" and "compline-light" or "compline-dark"

-- Find and execute the variant file
local colors_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
local variant_file = colors_path .. "/" .. variant .. ".lua"

-- Load the variant file directly
dofile(variant_file)
