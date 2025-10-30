# CatNvim - Changes from Original

## Overview

CatNvim is a personalized fork of [oh-my-nvim](https://github.com/hardhackerlabs/oh-my-nvim) with followcat's customizations and style.

## Key Changes

### 🔒 Security Improvements

1. **Removed all hardcoded API keys**
   - Copilot now reads OAuth token from `~/.config/github-copilot/apps.json`
   - ChatGPT uses environment variable `OPENAI_API_KEY`
   - No sensitive data committed to Git

2. **Added `.gitignore` for local config**
   - Ignores `lua/custom_local.lua` for personal secrets

### 🎨 Branding & Style

1. **Custom ASCII art header** - CatNvim logo on start screen
2. **Custom file explorer title** - "🐱 CatNvim Explorer"
3. **Updated README** - followcat branding and style
4. **Cat emoji theme** - 🐱 throughout documentation

### 📚 Documentation

Added comprehensive documentation:
- `README.md` - Project overview and quick start
- `docs/INSTALL.md` - Detailed installation guide
- `docs/KEYBINDINGS.md` - Complete keybinding reference
- `docs/CONFIGURATION.md` - Customization guide
- `docs/PLUGINS.md` - Plugin catalog
- `CHANGES.md` - This file

### 🛠️ Configuration Refinements

1. **Cleaner init.lua** - Better organized with comments
2. **Simplified core.lua** - Removed unnecessary complexity
3. **Enhanced basic.lua** - More sensible defaults
4. **Updated custom_opts.lua** - CatNvim branding

### 🤖 AI Assistant Updates

1. **Simplified Copilot config** - Cleaner setup
2. **Safer ChatGPT config** - Uses environment variables
3. **Updated CodeCompanion** - Latest syntax and features
4. **Streamlined GP.nvim** - Focused on essential features

### 🐍 Python Focus

1. **Python LSP** - Pyright configured by default
2. **Black formatter** - Added to Mason ensure_installed
3. **Python-friendly defaults** - 4-space indentation

### 🗑️ Removed Features

1. **Removed fortune command** - Simplified start screen
2. **Removed some unused plugins** - Kept only essentials
3. **Removed complex configs** - Simplified where possible

### ✨ New Features

1. **Better window navigation** - Simplified keybindings
2. **Enhanced Telescope integration** - Visual selection search
3. **Improved session management** - Auto-open Neo-tree on load
4. **NERDTree-style ignores** - Python cache, build dirs

## File Structure Comparison

### Original (oh-my-nvim)
```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── plugins/ (many subdirectories)
│   ├── languages/
│   └── ...
```

### CatNvim
```
~/.config/nvim/
├── init.lua                  # Enhanced with comments
├── filetype.lua
├── LICENSE
├── README.md                 # Completely rewritten
├── CHANGES.md                # This file
├── docs/                     # NEW: Comprehensive docs
│   ├── INSTALL.md
│   ├── KEYBINDINGS.md
│   ├── CONFIGURATION.md
│   └── PLUGINS.md
├── lua/
│   ├── basic.lua             # Enhanced
│   ├── core.lua              # Simplified
│   ├── custom_keys.lua       # Updated
│   ├── custom_opts.lua       # Customized
│   ├── plugins/              # Reorganized
│   │   ├── ChatGPT.lua       # Secured
│   │   ├── coding.lua
│   │   ├── colorschemes.lua
│   │   ├── find.lua
│   │   ├── git.lua
│   │   ├── highlight.lua
│   │   ├── lsp.lua           # Enhanced
│   │   ├── terminal.lua
│   │   ├── ui.lua            # Consolidated
│   │   └── utils.lua
│   ├── languages/            # Ready for expansion
│   └── my_plugins/           # Your plugins
│       ├── copilot.lua       # Secured & updated
│       ├── example.lua
│       ├── indent_blankline.lua
│       ├── markdown.lua
│       └── vim-fugitive.lua
```

## Philosophy

CatNvim follows these principles:

1. **Security First** - No secrets in Git
2. **Documentation** - Every feature documented
3. **Simplicity** - Remove unused complexity
4. **Modularity** - Easy to customize
5. **Performance** - Lazy load when possible
6. **Python-Focused** - Optimized for Python development
7. **Personal Style** - followcat branding

## Credits

- Based on [oh-my-nvim](https://github.com/hardhackerlabs/oh-my-nvim)
- Uses [HardHacker theme](https://github.com/hardhackerlabs/themes)
- Customized by [followcat](https://github.com/followcat)

## License

Apache 2.0 (same as original)

---

Made with 🐱 by followcat
