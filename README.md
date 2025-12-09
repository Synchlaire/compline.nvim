# compline.nvim

> Monastic minimalism for Neovim - colors as whispers, not shouts

Two complementary colorschemes for deep contemplation and focus, inspired by [jblais493/compline](https://github.com/jblais493/compline).

## Themes

**Compline** (Dark) - Evening contemplation
- Named after the Catholic liturgical prayer at nightfall
- Muted pastels on deep charcoal
- Low contrast for reduced eye strain during long sessions

**Lauds** (Light) - Dawn and focus
- Named after the morning prayer at dawn
- Subtle earth tones on warm off-white
- Gentle contrast for daytime work

## Philosophy

Designed for developers who value:
- **Deep focus** - Minimal visual noise, nothing demands attention
- **Extended sessions** - Easy on the eyes, no bright accent overload
- **Aesthetic restraint** - Colors suggest rather than shout

Perfect for writing code, prose, or anything requiring sustained concentration.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  dir = "~/projects/compline.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("compline")  -- or "lauds"
  end,
}
```

### Using [themify.nvim](https://github.com/lmantw/themify.nvim)

```lua
{
  dir = vim.fn.stdpath("config") .. "/../../projects/compline.nvim",
  name = "compline.nvim",
  whitelist = { "compline", "lauds" },
}
```

### Manual

```bash
# Clone to your Neovim config
git clone https://github.com/yourusername/compline.nvim ~/.config/nvim/colors/compline.nvim

# Or symlink
ln -s ~/projects/compline.nvim/colors ~/.config/nvim/colors
```

## Usage

```vim
" Set colorscheme
colorscheme compline  " Dark
colorscheme lauds     " Light
```

```lua
-- Or in Lua
vim.cmd.colorscheme("compline")
vim.cmd.colorscheme("lauds")
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

## Screenshots

*TODO: Add screenshots showing both themes*

## Inspiration

Based on the [Compline color palette](https://github.com/jblais493/compline) by jblais493, which includes ports for 18+ applications (VSCode, Kitty, Firefox, etc.).

## License

MIT

## Credits

- Original palette: [jblais493/compline](https://github.com/jblais493/compline)
- Neovim port: Built with contemplation
