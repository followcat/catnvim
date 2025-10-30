# 🐱 CatNvim

A **personal**, **theme-driven** Neovim configuration by followcat.

> Based on the excellent [oh-my-nvim](https://github.com/hardhackerlabs/oh-my-nvim) framework with my own customizations and workflow preferences.

## ✨ Features

- 🎨 Beautiful theme integration (HardHacker)
- 🔍 Powerful file search and navigation (Telescope + Neo-tree)
- 🤖 AI-powered coding assistance (GitHub Copilot, CodeCompanion)
- 📝 LSP support for multiple languages
- 🐍 Python development focused
- ⌨️ Intuitive custom keybindings
- 🚀 Fast startup with lazy loading
- 🎯 Minimalist and clean interface

## 📋 Requirements

- Neovim 0.8+
- Git
- A [Nerd Font](https://www.nerdfonts.com/font-downloads) (recommended: Victor Mono, JetBrainsMono)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for search)
- [fd](https://github.com/sharkdp/fd) (for file finding)
- GitHub Copilot account (optional, for AI features)

## 🚀 Installation

### Backup your current config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### Install CatNvim

```bash
git clone https://github.com/followcat/catnvim.git ~/.config/nvim
```

### Start Neovim

```bash
nvim
```

Plugins will automatically install on first launch.

## ⌨️ Key Bindings

### File Navigation
- `<F2>` - Toggle file explorer (Neo-tree)
- `<F4>` - Open Telescope picker
- `<C-j>` - Previous buffer
- `<C-k>` - Next buffer

### AI Assistants
- `<F3>` - Toggle CodeCompanion chat
- `<F5>` - Open ChatGPT interface
- `<C-g>c` - New GPT chat
- `<C-g>t` - Toggle GPT chat
- `<C-g>r` - GPT respond
- Visual mode: `<C-g>` - Search selection with Telescope

### Copilot
- `<C-j>` (Insert mode) - Accept Copilot suggestion

## 🎨 Customization

### Add Your Own Plugins

Create files in `~/.config/nvim/lua/my_plugins/` following this template:

```lua
return {
    {
        'username/plugin-name',
        config = function()
            -- configuration here
        end
    },
}
```

### Custom Configuration

Create `~/.config/nvim/lua/custom.lua` for your personal overrides.

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── core/               # Core configurations
│   ├── plugins/            # Plugin configurations
│   ├── languages/          # Language-specific setups
│   ├── my_plugins/         # Your custom plugins
│   ├── basic.lua           # Basic Neovim settings
│   ├── custom_keys.lua     # Keybinding definitions
│   └── custom_opts.lua     # Display options
├── docs/                   # Documentation
└── misc/                   # Miscellaneous files
```

## 🐍 Python Development

CatNvim is optimized for Python development with:
- LSP support (pyright/pylsp)
- Auto-completion
- Linting and formatting
- Debugger integration ready

## 🙏 Credits

- [oh-my-nvim](https://github.com/hardhackerlabs/oh-my-nvim) - Base framework
- [HardHacker Theme](https://github.com/hardhackerlabs/themes) - Color scheme
- All the amazing plugin authors

## 📝 License

Apache 2.0

---

Made with 🐱 by [followcat](https://github.com/followcat)
