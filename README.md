# compline.nvim

> Monastic minimalism

Two complementary colorschemes, using [jblais493/compline](https://github.com/jblais493/compline) scheme.

## Themes

**Compline** (Auto-switching)
- Automatically switches between dark/light based on `vim.o.background`
- Perfect for use with background toggle keybinds
- Respects system theme changes

**Compline Dark** (Forced Dark)
- Named after the Catholic liturgical prayer at nightfall
- Muted pastels on deep charcoal
- Low contrast

**Compline Light** (Forced Light)
- Subtle earth tones on warm off-white
- Gentle contrast

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "Synchlaire/compline.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Choose one:
    vim.cmd.colorscheme("compline")        -- Auto-switching (respects background setting)
    -- vim.cmd.colorscheme("compline-dark")  -- Always dark
    -- vim.cmd.colorscheme("compline-light") -- Always light
  end,
}
```

### With Themify

```lua
{
  "Synchlaire/compline.nvim",
  whitelist = { "compline", "compline-dark", "compline-light" },
}
```

### With Configuration

```lua
require("compline").setup({
  -- Transparency
  transparent = {
    enabled = false,  -- Transparent background
    float = false,    -- Transparent floating windows
    pmenu = false,    -- Transparent completion menu
  },

  -- Auto dark/light switching
  auto_switch = {
    enabled = false,      -- Enable auto-switching
    mode = "time",        -- "system" or "time"
    light_start_hour = 7, -- Switch to Lauds at 7 AM
    dark_start_hour = 19, -- Switch to Compline at 7 PM
  },

  -- Style customization
  styles = {
    comments = { italic = true },
    keywords = { bold = false },
    functions = { bold = false },
    variables = { bold = false },
    strings = { italic = false },
  },

  -- Contrast adjustments
  contrast = {
    enabled = false,
    popup = "default",   -- "default", "high", "low"
    sidebar = "default",
  },

  -- Plugin integrations (all enabled by default)
  integrations = {
    telescope = true,
    blink_cmp = true,
    nvim_cmp = true,
    gitsigns = true,
    treesitter = true,
    lsp = true,
    markdown = true,
    snacks = true,
  },

  -- Custom color overrides
  colors = {
    -- Override any color from the palette
    -- red = "#ff0000",
  },

  -- Custom highlight overrides
  highlights = {
    -- Override specific highlight groups
    -- Comment = { fg = "#808080", italic = true },
  },
})

-- Then load the colorscheme
vim.cmd.colorscheme("compline")
```

### Programmatic API

```lua
local compline = require("compline")

-- Toggle between Compline and Lauds
compline.toggle()

-- Load specific theme
compline.load("compline")
compline.load("lauds")

-- Enable transparency at runtime
compline.enable_transparency({ background = true, float = true, pmenu = true })

-- Get current colors
local colors = compline.get_colors()
print(colors.blue)  -- "#b4bcc4"

-- Get current configuration
local config = compline.get_config()
```

## Features

- ✨ Full Treesitter support
- 🔍 LSP diagnostics styled
- 🔭 Telescope integration
- 💬 Blink.cmp / nvim-cmp support
- 📝 Markdown highlighting
- 🌳 Git diff colors
- 🎨 Semantic highlighting

## Color Palette

### Compline (Dark)

```
Background:  #1a1d21
Foreground:  #f0efeb

Accents:
Red:     #cdacac  │  Orange:  #ccc4b4  │  Yellow:  #d4ccb4
Green:   #b8c4b8  │  Cyan:    #b4c0c8  │  Blue:    #b4bcc4
Teal:    #b4c4bc  │  DkCyan:  #98a4ac
```

### Lauds (Light)

```
Background:  #f0efeb
Foreground:  #1a1d21

Accents:
Red:     #8b6666  │  Orange:  #7a6d5a  │  Yellow:  #8b7e52
Green:   #5a6b5a  │  Cyan:    #64757d  │  Blue:    #5a6b7a
Teal:    #4d6b6b  │  DkCyan:  #546470
```

## License

MIT

## Credits

- Original palette: [jblais493/compline](https://github.com/jblais493/compline)
