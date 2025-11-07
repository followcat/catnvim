<p align="center">
  🐱
</p>

<h1 align="center">
    CatNvim
</h1>

<p align="center">
  <em>A purr-fect Neovim configuration by followcat 🐾</em>
</p>

A **modern**, **theme-driven** Neovim configuration tailored for productivity and elegance 💎

This is followcat's personal Neovim setup - a carefully crafted development environment
built on top of lazy.nvim with sensible defaults and powerful plugins.

## 📦 Features

- Session load and switch
- File explorer
- File find and search
- Terminal
- LSP
- Pretty Code highlighting, Colors highlighting
- Auto completion
- Languages
- Git integration
- Git diff view
- Pretty Tabline, Statusline, Winbar, Outline
- Starting screen
- Quick resize the window
- Zen mode
- Markdown Preview via your browser
- ...

## 🎆 Preview

![](./docs/images/start-screen.png)
![](./docs/images/autocmp.png)
![](./docs/images/float-term.png)
![](./docs/images/find.png)
![](./docs/images/color-highlight.png)

## 📌 Requirements

- Neovim 0.8+
- Not required, but recommended
  - [nerd font](https://www.nerdfonts.com/font-downloads)
    - Victor Mono Nerd Font
    - JetBrainsMono Nerd Font
    - ...
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fd](https://github.com/sharkdp/fd)

## 🚧 Install

#### MacOS/Linux

0️⃣ **Backup your current nvim**

```bash
mv ~/.config/nvim       ~/.config/nvim.bak
mv ~/.local/share/nvim  ~/.local/share/nvim.bak
```

1️⃣ **Clone catnvim repo**

```bash
git clone https://github.com/followcat/catnvim.git ~/.config/nvim
```

2️⃣ **Start `nvim` in your terminal, plugins will be automatically installed**

3️⃣ **Restart `nvim` and enjoy it** 🐱

4️⃣ **Keep updated with `git pull`**

## ⌛️ Update

You should keep updated, it's great.

You can use `git pull` to update it. If you've edited something, you may need to merge the content manually, just like a normal git operation.

## 🧱 Languages

#### Install LSP Server

Use command `:LspInstall` to download and install a server, e.g. `:LspInstall rust_analyzer`.

#### Install TreeSitter Parser

Use command `:TSInstall` to download and install a parser, e.g. `:TSInstall rust`.

## 🏠 Custom

#### 🔍 Configuration structure

```
~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── lua/
    ├── plugins/
    │   └── ...
    ├── languages/
    │   └── ...
    ├── my_plugins/
    │   └── ...
    ├── basic.lua
    ├── custom.lua
    ├── custom_keys.lua
    ├── custom_opts.lua
    └── settings.lua
```

- ~/.config/nvim/lua/**my_plugins/**

  You can put the plugins you want into the directory.

- ~/.config/nvim/lua/**custom.lua**

  This file does not exist by default, you can create this file, then place some custom configuration logic, the custom.lua module will be loaded last.

#### ⌨️ Shortcut Keys

[👉 View the default shortcut settings](./lua/custom_keys.lua)

Edit shortcuts in `~/.config/nvim/lua/custom_keys.lua`

**Additional keymaps (from init.vim, now in core.lua):**
- `<Space>` - Leader key
- `<leader>w/q/wq` - Save/Quit/Save&Quit
- `<leader>h` - Clear search highlight
- `<C-h/j/k/l>` - Window navigation
- `<C-Up/Down/Left/Right>` - Resize windows
- `<Tab>/<S-Tab>` - Next/Previous tab
- `<leader>bn/bp/bd` - Buffer next/previous/delete
- `<A-j/k>` - Move lines up/down
- `Y` - Copy to end of line

#### 😍 Add the plugins you want

Create a `plugin_name.lua` file in `~/.config/nvim/lua/my_plugins/` and configure plugins using lazy.nvim syntax:

```lua
return {
    -- Your Plugin1
    {
        'username/plugin1',
        config = function() ... end
    },

    -- Your Plugin2
    {'username/plugin2'},
}
```

#### 💯 Recommended plugins

Some useful plugins are configured by default in the directory `~/.config/nvim/misc/recommended`,
but they are not loaded into neovim by default ,
so if you need them, you can copy them into the directory `~/.config/nvim/lua/my_plugins/`.

Example:

```
cp ~/.config/nvim/misc/recommended/markdown.lua ~/.config/nvim/lua/my_plugins/
```

## 🧩 Plugins

[👉 View all plugins integrated](./docs/plugins.md)

Use **lazy.nvim** to manage plugins.
