-- Compline: Auto-switching colorscheme (follows vim.o.background)
-- Monastic minimalism - colors as whispers, not shouts
-- https://github.com/jblais493/compline

local M = {}

-- Palettes
M.palettes = {
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
    none = "NONE",
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
    none = "NONE",
  },
}

M.setup = function(variant)
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true

  -- Select palette
  local palette
  if variant == "auto" or variant == nil then
    palette = vim.o.background == "dark" and M.palettes.dark or M.palettes.light
  elseif variant == "dark" then
    palette = M.palettes.dark
  elseif variant == "light" then
    palette = M.palettes.light
  else
    palette = M.palettes.dark
  end

  local c = palette
  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor UI
  hi("Normal", { fg = c.fg, bg = c.bg })
  hi("NormalFloat", { fg = c.fg, bg = c.base1 })
  hi("FloatBorder", { fg = c.base4, bg = c.base1 })
  hi("LineNr", { fg = c.base4 })
  hi("CursorLine", { bg = variant == "light" and c.base0 or c.base1 })
  hi("CursorLineNr", { fg = c.base6, bold = true })
  hi("Visual", { bg = variant == "light" and c.base2 or c.base3 })
  hi("VisualNOS", { bg = variant == "light" and c.base2 or c.base3 })
  hi("Search", { fg = c.bg, bg = c.yellow })
  hi("IncSearch", { fg = c.bg, bg = c.orange })
  hi("ColorColumn", { bg = variant == "light" and c.base0 or c.base1 })
  hi("SignColumn", { fg = c.base4, bg = c.bg })
  hi("VertSplit", { fg = c.base2 })
  hi("StatusLine", { fg = c.fg, bg = c.base2 })
  hi("StatusLineNC", { fg = c.base5, bg = c.base1 })
  hi("Pmenu", { fg = c.fg, bg = c.base1 })
  hi("PmenuSel", { fg = c.bg, bg = c.blue })
  hi("PmenuSbar", { bg = c.base2 })
  hi("PmenuThumb", { bg = c.base4 })

  -- Syntax
  hi("Comment", { fg = c.base5, italic = true })
  hi("Constant", { fg = c.cyan })
  hi("String", { fg = c.green })
  hi("Character", { fg = c.green })
  hi("Number", { fg = c.teal })
  hi("Boolean", { fg = c.teal })
  hi("Float", { fg = c.teal })
  hi("Identifier", { fg = c.fg })
  hi("Function", { fg = c.blue })
  hi("Statement", { fg = c.orange })
  hi("Conditional", { fg = c.orange })
  hi("Repeat", { fg = c.orange })
  hi("Label", { fg = c.orange })
  hi("Operator", { fg = c.base6 })
  hi("Keyword", { fg = c.red })
  hi("Exception", { fg = c.red })
  hi("PreProc", { fg = c.yellow })
  hi("Include", { fg = c.blue })
  hi("Define", { fg = c.orange })
  hi("Macro", { fg = c.orange })
  hi("PreCondit", { fg = c.yellow })
  hi("Type", { fg = c.yellow })
  hi("StorageClass", { fg = c.orange })
  hi("Structure", { fg = c.orange })
  hi("Typedef", { fg = c.yellow })
  hi("Special", { fg = c.cyan })
  hi("SpecialChar", { fg = c.cyan })
  hi("Tag", { fg = c.blue })
  hi("Delimiter", { fg = c.base6 })
  hi("SpecialComment", { fg = c.base6, italic = true })
  hi("Debug", { fg = c.red })
  hi("Underlined", { fg = c.blue, underline = true })
  hi("Ignore", { fg = c.base4 })
  hi("Error", { fg = c.red, bold = true })
  hi("Todo", { fg = c.yellow, bold = true })

  -- Treesitter
  hi("@variable", { fg = c.fg })
  hi("@variable.builtin", { fg = c.red })
  hi("@variable.parameter", { fg = c.fg })
  hi("@variable.member", { fg = c.fg })
  hi("@constant", { fg = c.cyan })
  hi("@constant.builtin", { fg = c.cyan })
  hi("@module", { fg = c.orange })
  hi("@string", { fg = c.green })
  hi("@string.escape", { fg = c.cyan })
  hi("@string.special", { fg = c.cyan })
  hi("@character", { fg = c.green })
  hi("@number", { fg = c.teal })
  hi("@boolean", { fg = c.teal })
  hi("@function", { fg = c.blue })
  hi("@function.builtin", { fg = c.blue })
  hi("@function.method", { fg = c.blue })
  hi("@constructor", { fg = c.orange })
  hi("@keyword", { fg = c.red })
  hi("@keyword.function", { fg = c.red })
  hi("@keyword.operator", { fg = c.orange })
  hi("@keyword.return", { fg = c.red })
  hi("@operator", { fg = c.base6 })
  hi("@type", { fg = c.yellow })
  hi("@type.builtin", { fg = c.yellow })
  hi("@attribute", { fg = c.cyan })
  hi("@property", { fg = c.fg })
  hi("@comment", { fg = c.base5, italic = true })
  hi("@punctuation.bracket", { fg = c.base6 })
  hi("@punctuation.delimiter", { fg = c.base6 })

  -- LSP
  hi("DiagnosticError", { fg = c.red })
  hi("DiagnosticWarn", { fg = c.yellow })
  hi("DiagnosticInfo", { fg = c.blue })
  hi("DiagnosticHint", { fg = c.cyan })
  hi("DiagnosticUnderlineError", { sp = c.red, underline = true })
  hi("DiagnosticUnderlineWarn", { sp = c.yellow, underline = true })
  hi("DiagnosticUnderlineInfo", { sp = c.blue, underline = true })
  hi("DiagnosticUnderlineHint", { sp = c.cyan, underline = true })

  -- Git
  hi("DiffAdd", { fg = c.green, bg = c.base1 })
  hi("DiffChange", { fg = c.yellow, bg = c.base1 })
  hi("DiffDelete", { fg = c.red, bg = c.base1 })
  hi("DiffText", { fg = c.blue, bg = c.base2 })
  hi("GitSignsAdd", { fg = c.green })
  hi("GitSignsChange", { fg = c.yellow })
  hi("GitSignsDelete", { fg = c.red })

  -- Telescope
  hi("TelescopeBorder", { fg = c.base4, bg = c.base1 })
  hi("TelescopeNormal", { fg = c.fg, bg = c.base1 })
  hi("TelescopeSelection", { fg = c.fg, bg = c.base2, bold = true })
  hi("TelescopeMatching", { fg = c.blue, bold = true })

  -- Blink.cmp
  hi("BlinkCmpMenu", { fg = c.fg, bg = c.base1 })
  hi("BlinkCmpMenuBorder", { fg = c.base4, bg = c.base1 })
  hi("BlinkCmpMenuSelection", { fg = c.bg, bg = c.blue })
  hi("BlinkCmpLabel", { fg = c.fg })
  hi("BlinkCmpLabelMatch", { fg = c.blue, bold = true })
  hi("BlinkCmpKind", { fg = c.cyan })
  hi("BlinkCmpDoc", { fg = c.fg, bg = c.base1 })
  hi("BlinkCmpDocBorder", { fg = c.base4, bg = c.base1 })

  -- Markdown
  hi("@markup.heading", { fg = c.orange, bold = true })
  hi("@markup.strong", { fg = c.fg, bold = true })
  hi("@markup.italic", { fg = c.fg, italic = true })
  hi("@markup.link.url", { fg = c.blue, underline = true })
  hi("@markup.link.label", { fg = c.cyan })
  hi("@markup.list", { fg = c.orange })
  hi("@markup.quote", { fg = c.base6, italic = true })
  hi("@markup.raw", { fg = c.green })
end

-- Load the colorscheme
M.setup("auto")
vim.g.colors_name = "compline"

return M
