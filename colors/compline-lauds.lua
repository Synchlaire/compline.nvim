-- Compline Lauds (Light) - Forces light background
vim.o.background = "light"

-- Load the main colorscheme module
local colors_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
dofile(colors_path .. "/compline.lua").setup("light")

vim.g.colors_name = "compline-lauds"
