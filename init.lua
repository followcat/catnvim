-- ╔═══════════════════════════════════════════════════════════╗
-- ║  CatNvim - Personal Neovim Configuration by followcat     ║
-- ║  Based on oh-my-nvim with custom enhancements            ║
-- ╚═══════════════════════════════════════════════════════════╝

-- Load basic settings first
require("basic")

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leaders
vim.g.mapleader = require("custom_keys").leader
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "languages" },
		{ import = "my_plugins" },
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
})

-- Load core configurations
require("core")

-- Load custom configuration (if exists)
pcall(require, "custom")

-- ═══════════════════════════════════════════════════════════
-- Custom Keybindings
-- ═══════════════════════════════════════════════════════════

-- File Explorer (already mapped in core.lua via custom_keys.file_explorer)

-- 快捷键打开/关闭NERDTree
vim.api.nvim_set_keymap('n', '<F2>', ':NeoTreeShowToggle<CR>', { noremap = true })
-- 切换到上一个文件
vim.api.nvim_set_keymap('n', '<C-j>', ':bprevious<CR>', {noremap = true, silent = true})
-- 切换到下一个文件
vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', {noremap = true, silent = true})
-- 打开CodeCompanion窗口
vim.api.nvim_set_keymap('n', '<F3>', ':CodeCompanionChat Toggle<CR>', {noremap = true, silent = true})
-- 打开Telescope窗口
vim.api.nvim_set_keymap('n', '<F4>', ':Telescope<CR>', {noremap = true, silent = true})
-- 打开ChatGPT窗口
vim.api.nvim_set_keymap('n', '<F5>', ':ChatGPT<CR>', {noremap = true, silent = true})

-- GPT Commands
local function keymapOptions(desc)
	return {
		noremap = true,
		silent = true,
		nowait = true,
		desc = "GPT prompt " .. desc,
	}
end

-- Chat commands
vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))
vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>GpChatRespond<cr>", keymapOptions("Chat Respond"))

-- Visual mode GPT
vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))

-- Split commands
vim.keymap.set({ "n", "i" }, "<C-g><C-x>", "<cmd>GpChatNew split<cr>", keymapOptions("New Chat split"))
vim.keymap.set({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))

vim.keymap.set("v", "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))
vim.keymap.set("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))

-- Telescope live grep with visual selection
function _G.telescope_live_grep_selection()
	local bufnr = vim.api.nvim_get_current_buf()
	local start = vim.api.nvim_buf_get_mark(bufnr, '<')
	local _end = vim.api.nvim_buf_get_mark(bufnr, '>')

	start[2] = start[2] + 1
	_end[2] = _end[2] + 1

	if start[1] == _end[1] then
		local line = vim.api.nvim_buf_get_lines(bufnr, start[1] - 1, start[1], false)[1]
		local selection = string.sub(line, start[2], _end[2])
		require('telescope.builtin').live_grep({ default_text = selection })
	end
end

vim.api.nvim_set_keymap('v', '<C-g>', ':<C-u>lua telescope_live_grep_selection()<CR>', { noremap = true, silent = true })

-- NERDTree ignore patterns
vim.g.NERDTreeIgnore = { 'build', 'dist', '.git', '__pycache__' }
