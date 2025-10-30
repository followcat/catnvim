# Configuration Guide

## Overview

CatNvim's configuration is modular and easy to customize. All configuration files are in Lua.

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Entry point, keybindings
├── filetype.lua          # Filetype definitions
├── lua/
│   ├── basic.lua         # Basic Neovim settings
│   ├── core.lua          # Core functions and keymaps
│   ├── custom_keys.lua   # Keybinding definitions
│   ├── custom_opts.lua   # UI options
│   ├── custom.lua        # Your custom overrides (create this)
│   ├── plugins/          # Core plugin configs
│   ├── languages/        # Language-specific configs
│   └── my_plugins/       # Your custom plugins
```

## Customization

### 1. Basic Settings

Edit `~/.config/nvim/lua/basic.lua` to change:
- Line numbers
- Indentation
- Mouse support
- Clipboard behavior
- Search behavior

### 2. Keybindings

Edit `~/.config/nvim/lua/custom_keys.lua` to customize keybindings.

Example:
```lua
return {
    leader = " ",  -- Change leader key
    telescope = {
        find_files = "<leader>ff",  -- Change to your preference
    },
}
```

### 3. UI Options

Edit `~/.config/nvim/lua/custom_opts.lua` to customize:

```lua
return {
    file_explorer_title = "🐱 Your Name",
    tab_style = "thin",  -- thin, thick, slope, slant
    terminal_size = 0.8,
    window_transparency = 0,  -- 0-100
    auto_open_outline = false,
    home_header = {
        -- Your custom ASCII art
    },
}
```

### 4. Color Scheme

To change the color scheme, edit `~/.config/nvim/lua/plugins/colorschemes.lua`:

```lua
-- Switch from hardhacker to catppuccin
vim.cmd.colorscheme("catppuccin-frappe")
```

Available themes:
- `hardhacker` (default)
- `catppuccin-frappe`
- `catppuccin-latte`
- `catppuccin-macchiato`
- `catppuccin-mocha`

## Adding Plugins

### Method 1: In my_plugins directory

Create a new file `~/.config/nvim/lua/my_plugins/your_plugin.lua`:

```lua
return {
    {
        "username/plugin-name",
        config = function()
            require("plugin-name").setup({
                -- your configuration
            })
        end,
        -- Optional: lazy load
        event = "VeryLazy",  -- or "BufEnter", "InsertEnter", etc.
    },
}
```

### Method 2: Custom configuration file

Create `~/.config/nvim/lua/custom.lua`:

```lua
-- This file is loaded last, perfect for overrides

-- Change a setting
vim.opt.relativenumber = false

-- Add a custom command
vim.api.nvim_create_user_command('Hello', function()
    print('Hello from CatNvim!')
end, {})

-- Custom autocommand
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})
```

## Language Configuration

### Python

The default Python LSP is pyright. To install:

```vim
:LspInstall pyright
```

To use pylsp instead, edit `~/.config/nvim/lua/plugins/lsp.lua`:

```lua
lspconfig.pylsp.setup({ capabilities = capabilities })
```

### Adding New Languages

1. Install LSP server:
```vim
:LspInstall <language>
```

2. Install Treesitter parser:
```vim
:TSInstall <language>
```

3. (Optional) Create language config in `lua/languages/`:

```lua
-- lua/languages/go.lua
return {
    {
        "ray-x/go.nvim",
        config = function()
            require("go").setup()
        end,
        ft = { "go", "gomod" },
    },
}
```

## AI Configuration

### GitHub Copilot

Copilot automatically reads tokens from `~/.config/github-copilot/apps.json`.

To authenticate Copilot:
1. Install GitHub Copilot CLI or use it in VSCode first
2. The token will be saved automatically

### ChatGPT

Set environment variable:

```bash
export OPENAI_API_KEY="sk-..."
```

Add to `~/.bashrc` or `~/.zshrc` for persistence.

### Disabling AI Features

To disable AI plugins, comment them out in:
- `~/.config/nvim/lua/my_plugins/copilot.lua`
- `~/.config/nvim/lua/plugins/ChatGPT.lua`

## Performance Tuning

### Lazy Loading

Make plugins load only when needed:

```lua
{
    "plugin/name",
    lazy = true,
    event = "BufEnter",  -- or "InsertEnter", "VeryLazy", etc.
    ft = { "python", "lua" },  -- only for specific filetypes
    cmd = { "Command" },  -- only when command is run
}
```

### Disable Unused Features

In `lua/basic.lua`:

```lua
-- Disable providers you don't need
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
```

## Troubleshooting

### Check Health

```vim
:checkhealth
```

### Plugin Issues

```vim
:Lazy
:Lazy sync
:Lazy clean
```

### LSP Issues

```vim
:LspInfo
:LspLog
:Mason
```

### Clear Cache

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

Then restart Neovim and run `:Lazy sync`.

## Tips

1. **Keep it minimal**: Only add plugins you actually use
2. **Lazy load**: Use lazy loading to improve startup time
3. **Regular updates**: Run `:Lazy sync` regularly
4. **Backup**: Keep your config in Git
5. **Experiment**: Try new plugins in `my_plugins/` first
