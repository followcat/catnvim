# Plugins List

## Core Plugins

### Plugin Manager
- **lazy.nvim** - Modern plugin manager with lazy loading

### LSP & Completion
- **nvim-lspconfig** - LSP client configurations
- **mason.nvim** - LSP server installer
- **mason-lspconfig.nvim** - Mason and lspconfig integration
- **nvim-cmp** - Auto-completion engine
- **cmp-nvim-lsp** - LSP source for nvim-cmp
- **cmp-buffer** - Buffer source for nvim-cmp
- **cmp-path** - Path source for nvim-cmp
- **LuaSnip** - Snippet engine
- **lspkind.nvim** - VSCode-like pictograms

### Syntax & Highlighting
- **nvim-treesitter** - Advanced syntax highlighting
- **nvim-colorizer.lua** - Color code highlighter

### File Management
- **telescope.nvim** - Fuzzy finder
- **neo-tree.nvim** - File explorer
- **nvim-web-devicons** - File icons

### UI Enhancements
- **lualine.nvim** - Status line
- **bufferline.nvim** - Buffer/tab line
- **alpha-nvim** - Start screen
- **aerial.nvim** - Code outline
- **dressing.nvim** - Improved UI elements

### Git Integration
- **gitsigns.nvim** - Git signs in gutter
- **diffview.nvim** - Git diff viewer
- **vim-fugitive** - Git commands

### Terminal
- **toggleterm.nvim** - Terminal integration

### Coding Enhancements
- **nvim-autopairs** - Auto close brackets
- **nvim-ts-autotag** - Auto close HTML tags
- **todo-comments.nvim** - Highlight TODO comments
- **guess-indent.nvim** - Auto-detect indentation

### AI Assistants (Optional)
- **copilot.vim** - GitHub Copilot
- **codecompanion.nvim** - AI chat interface
- **ChatGPT.nvim** - ChatGPT integration
- **gp.nvim** - Advanced GPT interface

### Utilities
- **nvim-notify** - Notification system
- **smart-splits.nvim** - Window resizing
- **bufdelete.nvim** - Better buffer deletion
- **neovim-session-manager** - Session management
- **zen-mode.nvim** - Distraction-free writing
- **twilight.nvim** - Dim inactive code
- **indent-blankline.nvim** - Indent guides

### Markdown
- **markdown-preview.nvim** - Preview markdown in browser
- **render-markdown.nvim** - Render markdown in editor
- **markview.nvim** - Enhanced markdown viewing

## Color Schemes
- **hardhacker** - Default theme
- **catppuccin** - Alternative theme

## Plugin Categories

### Essential (Always Loaded)
- LSP and completion
- Treesitter
- File management
- Git integration

### Optional (Can be disabled)
- AI assistants
- Markdown preview
- Session management
- Zen mode

### Lazy Loaded
- ChatGPT (VeryLazy)
- Markdown preview (FileType markdown)
- Language-specific plugins

## Adding More Plugins

To add a new plugin:

1. Create a file in `~/.config/nvim/lua/my_plugins/`
2. Follow the lazy.nvim syntax:

```lua
return {
    {
        "username/plugin-name",
        dependencies = { "other/plugin" },
        config = function()
            require("plugin-name").setup()
        end,
        lazy = true,
        event = "BufEnter",
    },
}
```

## Plugin Resources

- [awesome-neovim](https://github.com/rockerBOO/awesome-neovim)
- [neovimcraft](https://neovimcraft.com/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
