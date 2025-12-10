-- Compline Dark - Forces dark background
vim.o.background = "dark"

-- Load the main colorscheme module
local colors_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
dofile(colors_path .. "/compline.lua").setup("dark")

vim.g.colors_name = "compline-dark"
