-- Compline: Auto-switching colorscheme for Neovim
-- Automatically selects dark or light based on vim.o.background
-- https://github.com/Synchlaire/compline.nvim

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "compline"

-- Determine which variant to use based on background setting
local variant = vim.o.background == "light" and "light" or "dark"

-- Color palettes
local palettes = {
	dark = {
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
	light = {
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

local colors = palettes[variant]

-- Helper function
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.base1 })
hi("FloatBorder", { fg = colors.base4, bg = colors.base1 })
hi("LineNr", { fg = colors.base4 })
hi("CursorLine", { bg = colors.base1 })
hi("CursorLineNr", { fg = colors.base6, bold = true })
hi("Visual", { bg = colors.base3 })
hi("VisualNOS", { bg = colors.base3 })
hi("Search", { fg = colors.bg, bg = colors.yellow })
hi("IncSearch", { fg = colors.bg, bg = colors.orange })
hi("ColorColumn", { bg = colors.base1 })
hi("SignColumn", { fg = colors.base4, bg = colors.bg })
hi("VertSplit", { fg = colors.base2 })
hi("StatusLine", { fg = colors.fg, bg = colors.base2 })
hi("StatusLineNC", { fg = colors.base5, bg = colors.base1 })
hi("Pmenu", { fg = colors.fg, bg = colors.base1 })
hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
hi("PmenuSbar", { bg = colors.base2 })
hi("PmenuThumb", { bg = colors.base4 })

-- Syntax
hi("Comment", { fg = colors.base5, italic = true })
hi("Constant", { fg = colors.cyan })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.teal })
hi("Boolean", { fg = colors.teal })
hi("Float", { fg = colors.teal })
hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.blue })
hi("Statement", { fg = colors.orange })
hi("Conditional", { fg = colors.orange })
hi("Repeat", { fg = colors.orange })
hi("Label", { fg = colors.orange })
hi("Operator", { fg = colors.base6 })
hi("Keyword", { fg = colors.red })
hi("Exception", { fg = colors.red })
hi("PreProc", { fg = colors.yellow })
hi("Include", { fg = colors.blue })
hi("Define", { fg = colors.orange })
hi("Macro", { fg = colors.orange })
hi("PreCondit", { fg = colors.yellow })
hi("Type", { fg = colors.yellow })
hi("StorageClass", { fg = colors.orange })
hi("Structure", { fg = colors.orange })
hi("Typedef", { fg = colors.yellow })
hi("Special", { fg = colors.cyan })
hi("SpecialChar", { fg = colors.cyan })
hi("Tag", { fg = colors.blue })
hi("Delimiter", { fg = colors.base6 })
hi("SpecialComment", { fg = colors.base6, italic = true })
hi("Debug", { fg = colors.red })
hi("Underlined", { fg = colors.blue, underline = true })
hi("Ignore", { fg = colors.base4 })
hi("Error", { fg = colors.red, bold = true })
hi("Todo", { fg = colors.yellow, bold = true })

-- Treesitter
hi("@variable", { fg = colors.fg })
hi("@variable.builtin", { fg = colors.red })
hi("@variable.parameter", { fg = colors.fg })
hi("@variable.member", { fg = colors.fg })
hi("@constant", { fg = colors.cyan })
hi("@constant.builtin", { fg = colors.cyan })
hi("@module", { fg = colors.orange })
hi("@string", { fg = colors.green })
hi("@string.escape", { fg = colors.cyan })
hi("@string.special", { fg = colors.cyan })
hi("@character", { fg = colors.green })
hi("@number", { fg = colors.teal })
hi("@boolean", { fg = colors.teal })
hi("@function", { fg = colors.blue })
hi("@function.builtin", { fg = colors.blue })
hi("@function.method", { fg = colors.blue })
hi("@constructor", { fg = colors.orange })
hi("@keyword", { fg = colors.red })
hi("@keyword.function", { fg = colors.red })
hi("@keyword.operator", { fg = colors.orange })
hi("@keyword.return", { fg = colors.red })
hi("@operator", { fg = colors.base6 })
hi("@type", { fg = colors.yellow })
hi("@type.builtin", { fg = colors.yellow })
hi("@attribute", { fg = colors.cyan })
hi("@property", { fg = colors.fg })
hi("@comment", { fg = colors.base5, italic = true })
hi("@punctuation.bracket", { fg = colors.base6 })
hi("@punctuation.delimiter", { fg = colors.base6 })

-- LSP
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.cyan })
hi("DiagnosticUnderlineError", { sp = colors.red, underline = true })
hi("DiagnosticUnderlineWarn", { sp = colors.yellow, underline = true })
hi("DiagnosticUnderlineInfo", { sp = colors.blue, underline = true })
hi("DiagnosticUnderlineHint", { sp = colors.cyan, underline = true })

-- Git
hi("DiffAdd", { fg = colors.green, bg = colors.base1 })
hi("DiffChange", { fg = colors.yellow, bg = colors.base1 })
hi("DiffDelete", { fg = colors.red, bg = colors.base1 })
hi("DiffText", { fg = colors.blue, bg = colors.base2 })
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })

-- Telescope
hi("TelescopeBorder", { fg = colors.base4, bg = colors.base1 })
hi("TelescopeNormal", { fg = colors.fg, bg = colors.base1 })
hi("TelescopeSelection", { fg = colors.fg, bg = colors.base2, bold = true })
hi("TelescopeMatching", { fg = colors.blue, bold = true })

-- Blink.cmp
hi("BlinkCmpMenu", { fg = colors.fg, bg = colors.base1 })
hi("BlinkCmpMenuBorder", { fg = colors.base4, bg = colors.base1 })
hi("BlinkCmpMenuSelection", { fg = colors.bg, bg = colors.blue })
hi("BlinkCmpLabel", { fg = colors.fg })
hi("BlinkCmpLabelMatch", { fg = colors.blue, bold = true })
hi("BlinkCmpKind", { fg = colors.cyan })
hi("BlinkCmpDoc", { fg = colors.fg, bg = colors.base1 })
hi("BlinkCmpDocBorder", { fg = colors.base4, bg = colors.base1 })

-- Markdown
hi("@markup.heading", { fg = colors.orange, bold = true })
hi("@markup.strong", { fg = colors.fg, bold = true })
hi("@markup.italic", { fg = colors.fg, italic = true })
hi("@markup.link.url", { fg = colors.blue, underline = true })
hi("@markup.link.label", { fg = colors.cyan })
hi("@markup.list", { fg = colors.orange })
hi("@markup.quote", { fg = colors.base6, italic = true })
hi("@markup.raw", { fg = colors.green })
