# Installation Guide

## Prerequisites

Before installing CatNvim, ensure you have:

1. **Neovim 0.8+**
   ```bash
   nvim --version
   ```

2. **Git**
   ```bash
   git --version
   ```

3. **A Nerd Font** (optional but recommended)
   - Download from [Nerd Fonts](https://www.nerdfonts.com/)
   - Recommended: Victor Mono, JetBrainsMono

4. **CLI Tools**
   ```bash
   # On Ubuntu/Debian
   sudo apt install ripgrep fd-find

   # On macOS
   brew install ripgrep fd
   ```

## Installation Steps

### 1. Backup Existing Config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### 2. Clone CatNvim

```bash
git clone https://github.com/followcat/catnvim.git ~/.config/nvim
```

### 3. First Launch

```bash
nvim
```

On first launch:
- Lazy.nvim will bootstrap automatically
- All plugins will be installed
- This may take a few minutes

### 4. Install LSP Servers

Once Neovim opens, install language servers:

```vim
:LspInstall pyright        " Python
:LspInstall lua_ls         " Lua
:LspInstall bashls         " Bash
:LspInstall ts_ls          " TypeScript/JavaScript
```

### 5. Install Treesitter Parsers

```vim
:TSInstall python lua bash javascript
```

## Post-Installation

### Configure GitHub Copilot (Optional)

If you want to use AI features:

1. Install GitHub Copilot CLI or authenticate GitHub Copilot in your editor
2. The OAuth token will be automatically read from `~/.config/github-copilot/apps.json`

### Configure ChatGPT (Optional)

Set your OpenAI API key:

```bash
export OPENAI_API_KEY="your-key-here"
```

Add to your shell profile (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'export OPENAI_API_KEY="your-key-here"' >> ~/.bashrc
```

## Troubleshooting

### Plugins not installing

```vim
:Lazy sync
```

### LSP not working

```vim
:Mason
:LspInfo
:checkhealth
```

### Fonts not displaying correctly

Make sure you have a Nerd Font installed and set in your terminal.

## Updating

```bash
cd ~/.config/nvim
git pull
```

Then in Neovim:
```vim
:Lazy sync
```
