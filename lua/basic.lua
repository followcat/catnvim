-- ═══════════════════════════════════════════════════════════
-- Basic Neovim Settings
-- ═══════════════════════════════════════════════════════════

local opt = vim.opt
local g = vim.g

-- ─── Editor Behavior ────────────────────────────────────────
opt.number = true              -- Show line numbers
opt.relativenumber = true      -- Relative line numbers
opt.mouse = "a"                -- Enable mouse support
opt.clipboard = "unnamedplus"  -- Use system clipboard
opt.breakindent = true         -- Wrapped lines continue visually indented
opt.undofile = true            -- Persistent undo history
opt.ignorecase = true          -- Case-insensitive search
opt.smartcase = true           -- Case-sensitive if uppercase present
opt.updatetime = 250           -- Faster completion
opt.signcolumn = "yes"         -- Always show sign column
opt.termguicolors = true       -- True color support
opt.scrolloff = 8              -- Keep 8 lines visible when scrolling
opt.sidescrolloff = 8          -- Keep 8 columns visible when scrolling

-- ─── Indentation ────────────────────────────────────────────
opt.tabstop = 4                -- Tab width
opt.shiftwidth = 4             -- Indent width
opt.expandtab = true           -- Use spaces instead of tabs
opt.smartindent = true         -- Smart autoindenting

-- ─── UI ─────────────────────────────────────────────────────
opt.cursorline = true          -- Highlight current line
opt.splitright = true          -- Vertical splits open to the right
opt.splitbelow = true          -- Horizontal splits open below
opt.wrap = false               -- Don't wrap lines
opt.showmode = false           -- Don't show mode (statusline handles it)
opt.conceallevel = 2           -- Conceal text with replacement

-- ─── Search ─────────────────────────────────────────────────
opt.hlsearch = true            -- Highlight search results
opt.incsearch = true           -- Incremental search

-- ─── Backup ─────────────────────────────────────────────────
opt.backup = false             -- No backup files
opt.swapfile = false           -- No swap files
opt.writebackup = false        -- No backup before overwriting

-- ─── Performance ────────────────────────────────────────────
opt.lazyredraw = true          -- Don't redraw during macros
opt.timeoutlen = 300           -- Faster key sequence completion

-- ─── File Encoding ──────────────────────────────────────────
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- ─── Completion ─────────────────────────────────────────────
opt.completeopt = { "menu", "menuone", "noselect" }

-- ─── Python Provider ────────────────────────────────────────
-- Disable unused providers for faster startup
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0

-- ─── Leader Key ─────────────────────────────────────────────
-- Set in init.lua after loading custom_keys
