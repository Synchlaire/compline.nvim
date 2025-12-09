-- compline.nvim configuration module

local M = {}

-- Default configuration
M.defaults = {
  -- Transparency options
  transparent = {
    enabled = false, -- Enable transparent background
    float = false, -- Transparent floating windows
    pmenu = false, -- Transparent completion menu
  },

  -- Auto dark/light switching based on system/time
  auto_switch = {
    enabled = false, -- Enable auto-switching
    mode = "system", -- "system" or "time"
    -- Time-based switching (if mode = "time")
    light_start_hour = 7, -- Switch to Lauds at 7 AM
    dark_start_hour = 19, -- Switch to Compline at 7 PM
  },

  -- Style customization
  styles = {
    comments = { italic = true },
    keywords = { bold = false, italic = false },
    functions = { bold = false, italic = false },
    variables = { bold = false, italic = false },
    strings = { bold = false, italic = false },
  },

  -- Contrast adjustments
  contrast = {
    enabled = false, -- Enhanced contrast mode
    popup = "default", -- "default", "high", "low"
    sidebar = "default",
  },

  -- Plugin integrations
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
  colors = {},

  -- Custom highlight overrides
  highlights = {},
}

-- Current configuration
M.config = vim.deepcopy(M.defaults)

-- Setup function
function M.setup(user_config)
  M.config = vim.tbl_deep_extend("force", M.defaults, user_config or {})

  -- Apply auto-switching if enabled
  if M.config.auto_switch.enabled then
    M.setup_auto_switch()
  end

  return M.config
end

-- Auto-switching logic
function M.setup_auto_switch()
  local mode = M.config.auto_switch.mode

  if mode == "system" then
    -- Check system preference (Linux only)
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
    if handle then
      local result = handle:read("*a")
      handle:close()
      if result:match("dark") then
        vim.cmd.colorscheme("compline")
      else
        vim.cmd.colorscheme("lauds")
      end
    end
  elseif mode == "time" then
    -- Time-based switching
    local hour = tonumber(os.date("%H"))
    local light_start = M.config.auto_switch.light_start_hour
    local dark_start = M.config.auto_switch.dark_start_hour

    if hour >= light_start and hour < dark_start then
      vim.cmd.colorscheme("lauds")
    else
      vim.cmd.colorscheme("compline")
    end
  end
end

-- Get current config
function M.get()
  return M.config
end

-- Update config at runtime
function M.update(updates)
  M.config = vim.tbl_deep_extend("force", M.config, updates)
  -- Reload colorscheme to apply changes
  local current = vim.g.colors_name
  if current == "compline" or current == "lauds" then
    vim.cmd.colorscheme(current)
  end
end

return M
