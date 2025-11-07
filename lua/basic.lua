-- ============================================
-- CatNvim - Basic Settings
-- followcat's Neovim Configuration
-- ============================================

HOME = os.getenv("HOME")

-- Display
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showmatch = true
vim.opt.synmaxcol = 300
vim.opt.laststatus = 3
vim.opt.showcmd = true
vim.opt.modelines = 0

-- Line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪"
vim.opt.eol = false

-- Basic settings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = "menuone,noselect"
vim.opt.history = 1000
vim.opt.startofline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.hidden = true
vim.opt.updatetime = 300

-- Timing
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.timeoutlen = 500

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

vim.opt.matchtime = 2
vim.opt.mps = vim.o.mps .. ",<:>"

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.formatoptions = "qnj1"
vim.opt.expandtab = true

-- Backup and undo
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"

-- Window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Commands mode
vim.opt.wildmenu = true
vim.opt.wildignore =
	"deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

-- Create undo directory
vim.fn.mkdir(vim.fn.stdpath("config") .. "/undo", "p")

-- Only show cursorline in the current window and in normal mode.
-- vim.cmd([[
--   augroup cline
--       au!
--       au WinLeave * set nocursorline
--       au WinEnter * set cursorline
--       au InsertEnter * set nocursorline
--       au InsertLeave * set cursorline
--   augroup END
-- ]])

vim.cmd([[
    set noeb
    set t_Co=256
    filetype    plugin indent on
    exec        "nohlsearch"
    syntax      enable
    syntax      on
]])
