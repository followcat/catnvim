-- ═══════════════════════════════════════════════════════════
-- Basic Neovim Settings
-- ═══════════════════════════════════════════════════════════

HOME = os.getenv("HOME")

local opt = vim.opt
local g = vim.g

-- ─── Core Settings ──────────────────────────────────────────
opt.termguicolors = true       -- True color support
opt.cursorline = true          -- Highlight current line
opt.updatetime = 200           -- Faster completion

-- ─── Editor Behavior ────────────────────────────────────────
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start"
opt.completeopt = "menuone,noselect"
opt.history = 1000
opt.startofline = true

-- ─── Display ────────────────────────────────────────────────
opt.number = true              -- Show line numbers
opt.numberwidth = 3            -- Reserve 3 spaces for line number
opt.scrolloff = 3              -- Keep 3 lines visible when scrolling
opt.sidescrolloff = 8          -- Keep 8 columns visible when scrolling
opt.showmatch = true           -- Show matching brackets
opt.synmaxcol = 300            -- Limit syntax highlighting
opt.laststatus = 3             -- Global statusline
opt.wrap = false               -- Don't wrap lines
opt.eol = false                -- Show if there's no eol char
opt.showbreak = "↪"            -- Character to show when line is broken
opt.signcolumn = "yes"         -- Always show sign column
opt.modelines = 0
opt.showcmd = true             -- Display command in bottom bar

-- ─── Search ─────────────────────────────────────────────────
opt.incsearch = true           -- Incremental search
opt.ignorecase = true          -- Case-insensitive search
opt.smartcase = true           -- Case-sensitive if uppercase present
opt.hlsearch = true            -- Highlight search results
opt.matchtime = 2              -- Delay before showing matching paren
opt.mps = vim.o.mps .. ",<:>"

-- ─── Indentation ────────────────────────────────────────────
opt.autoindent = true          -- Auto indent
opt.smartindent = true         -- Smart autoindenting
opt.tabstop = 4                -- Tab width
opt.softtabstop = 4            -- Soft tab width
opt.shiftwidth = 4             -- Indent width
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "qnj1"     -- Format options

-- ─── Backup ─────────────────────────────────────────────────
opt.backup = false             -- No backup files
opt.writebackup = false        -- No backup before overwriting
opt.swapfile = false           -- No swap files
opt.undofile = true            -- Persistent undo

-- ─── Window Behavior ────────────────────────────────────────
opt.splitright = true          -- Vertical splits open to the right
opt.splitbelow = true          -- Horizontal splits open below
opt.mouse = "a"                -- Enable mouse support
opt.clipboard = "unnamedplus"  -- Use system clipboard

-- ─── Completion ─────────────────────────────────────────────
opt.wildmenu = true            -- Command-line completion
opt.wildignore = "deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

-- ─── Mapping Timeout ────────────────────────────────────────
opt.timeout = false
opt.ttimeout = true
opt.ttimeoutlen = 100

-- ─── Python Provider ────────────────────────────────────────
-- Disable unused providers for faster startup
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0

-- ─── Additional Vim Settings ────────────────────────────────
vim.cmd([[
    set noeb
    set t_Co=256
    filetype plugin indent on
    exec "nohlsearch"
    syntax enable
    syntax on
]])
