<div align="center">

# 🐱 CatNvim

### *A purr-fect Neovim configuration by followcat*

[![Neovim](https://img.shields.io/badge/Neovim-0.8+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=flat-square&logo=lua&logoColor=white)](http://www.lua.org)
[![License](https://img.shields.io/github/license/followcat/catnvim?style=flat-square)](./LICENSE)

**A modern, theme-driven Neovim configuration** tailored for productivity and elegance 💎

Built on top of [lazy.nvim](https://github.com/folke/lazy.nvim) with sensible defaults and powerful plugins.

</div>

---

## ✨ Features

<table>
<tr>
<td>

**🎨 Interface**
- Beautiful starting screen
- Modern tabline & statusline
- File explorer with Neo-tree
- Outline view with Aerial
- Zen mode for focus

</td>
<td>

**💻 Development**
- LSP support for multiple languages
- Syntax highlighting (TreeSitter)
- Auto-completion
- Code formatting
- Git integration & diff view

</td>
</tr>
<tr>
<td>

**🔍 Navigation**
- Fuzzy finding (Telescope)
- File search with ripgrep
- Buffer & session management
- Quick window navigation

</td>
<td>

**⚡ Productivity**
- Floating terminal
- AI assistance (ChatGPT, Copilot)
- Markdown preview
- Quick window resizing
- Custom keybindings

</td>
</tr>
</table>

## 📸 Screenshots

<div align="center">

### Starting Screen
![Starting Screen](./docs/images/catnvim-start.png)

### Code Editing with Auto-completion
![Auto-completion](./docs/images/catnvim-coding.png)

### Fuzzy Finding with Telescope
![Telescope](./docs/images/catnvim-telescope.png)

### Integrated Terminal
![Terminal](./docs/images/catnvim-terminal.png)

</div>

## 📋 Requirements

### Required
- **Neovim** 0.8+ (0.9+ recommended)
- **Git** for plugin management

### Recommended
- **[Nerd Font](https://www.nerdfonts.com/font-downloads)** for icons
  - JetBrainsMono Nerd Font
  - Victor Mono Nerd Font
  - FiraCode Nerd Font
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** for faster searching
- **[fd](https://github.com/sharkdp/fd)** for faster file finding
- **Node.js** for some LSP servers

## 🚀 Installation

### MacOS / Linux

**1. Backup your current configuration**
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

**2. Clone CatNvim**
```bash
git clone https://github.com/followcat/catnvim.git ~/.config/nvim
```

**3. Start Neovim**
```bash
nvim
```

Plugins will be automatically installed on first launch. Wait for the installation to complete.

**4. Restart Neovim and enjoy!** 🐱

### Windows

```powershell
# Backup
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

# Clone
git clone https://github.com/followcat/catnvim.git $env:LOCALAPPDATA\nvim
```

## 🔄 Updating

Keep your configuration up to date:

```bash
cd ~/.config/nvim
git pull
```

If you've made custom changes, you may need to merge manually. Consider using the `custom.lua` file for personal modifications.

## 🛠️ Language Support

### Install LSP Servers

Use the `:LspInstall` command to install language servers:

```vim
:LspInstall rust_analyzer    " Rust
:LspInstall pyright          " Python
:LspInstall tsserver         " TypeScript/JavaScript
:LspInstall lua_ls           " Lua
:LspInstall gopls            " Go
```

### Install TreeSitter Parsers

Use the `:TSInstall` command to install syntax parsers:

```vim
:TSInstall rust
:TSInstall python
:TSInstall typescript
:TSInstall lua
:TSInstall go
```

## ⚙️ Configuration

### 📁 Project Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── filetype.lua          # Filetype detection
├── lazy-lock.json        # Plugin versions lock
└── lua/
    ├── basic.lua         # Basic Vim settings
    ├── core.lua          # Core keymaps & autocmds
    ├── custom_keys.lua   # Keymap configuration
    ├── custom_opts.lua   # UI options
    ├── custom.lua        # Your custom config (optional)
    ├── plugins/          # Core plugins
    ├── languages/        # Language-specific configs
    └── my_plugins/       # Your custom plugins
```

### 📝 Customization

**Add custom configuration:**
- Create `~/.config/nvim/lua/custom.lua` for your personal settings
- This file is loaded last and won't be overwritten by updates

**Add custom plugins:**
- Create plugin files in `~/.config/nvim/lua/my_plugins/`
- Each file should return a table of plugin specs (lazy.nvim format)

### ⌨️ Keybindings

[👉 View all default keybindings](./lua/custom_keys.lua)

**Essential Shortcuts:**

| Key | Action | Mode |
|-----|--------|------|
| `<Space>` | Leader key | - |
| `<leader>w` | Save file | Normal |
| `<leader>q` | Quit | Normal |
| `<leader>h` | Clear search highlight | Normal |
| `<C-h/j/k/l>` | Navigate windows | Normal |
| `<C-Up/Down/Left/Right>` | Resize windows | Normal |
| `<Tab>` / `<S-Tab>` | Next/Previous tab | Normal |
| `<leader>bn/bp/bd` | Buffer next/prev/delete | Normal |
| `<A-j/k>` | Move lines up/down | Normal/Visual |
| `<F9>` | Toggle file explorer | Normal |
| `<leader>ff` | Find files | Normal |
| `<leader>gg` | Live grep | Normal |
| `<A-u>` | Toggle floating terminal | Normal/Terminal |

**From init.vim migration:**
- Window navigation and resizing
- Tab and buffer management
- Line movement in normal and visual mode
- Smart indentation in visual mode

### 💯 Add Custom Plugins

Create a new file in `~/.config/nvim/lua/my_plugins/` (e.g., `my_custom.lua`):

```lua
return {
    -- Example: Add a colorscheme
    {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd[[colorscheme tokyonight]]
        end
    },
    
    -- Example: Add a plugin with configuration
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup{}
        end
    },
}
```

Recommended plugins are available in `~/.config/nvim/misc/recommended/`. Copy them to `my_plugins/` to enable:

```bash
cp ~/.config/nvim/misc/recommended/markdown.lua ~/.config/nvim/lua/my_plugins/
```

## 🧩 Plugins

[👉 View all integrated plugins](./docs/plugins.md)

CatNvim uses **[lazy.nvim](https://github.com/folke/lazy.nvim)** for plugin management, providing:
- Fast startup time with lazy loading
- Automatic plugin updates
- Easy plugin management with `:Lazy` command
- Lock file for reproducible configurations

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs or issues
- Suggest new features
- Submit pull requests
- Share your custom configurations

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## 🙏 Acknowledgments

Built upon the excellent work of the Neovim community and inspired by various configurations. Special thanks to:
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- All the amazing plugin authors in the Neovim ecosystem

---

<div align="center">

**Made with 🐾 by followcat**

⭐ Star this repo if you find it helpful!

</div>
