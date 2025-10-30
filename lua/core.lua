-- ═══════════════════════════════════════════════════════════
-- Core Configuration and Keymappings
-- ═══════════════════════════════════════════════════════════

local keys = require("custom_keys")
local opts = require("custom_opts")

-- ─── Setup Keymapping ───────────────────────────────────────
local function set_keymap()
	local map = vim.keymap.set
	local option = { noremap = true, silent = true }

	-- Window navigation
	map("n", "<C-h>", "<C-W>h", option)
	map("n", "<C-l>", "<C-W>l", option)

	-- Clear search highlight
	vim.cmd([[
		nnoremap <silent> <Esc> :nohlsearch<CR>:echo<CR>
	]])

	-- Markdown optimizations
	vim.cmd([[
		autocmd FileType markdown noremap <buffer> j gj
		autocmd FileType markdown noremap <buffer> k gk
		autocmd FileType markdown setlocal wrap
	]])

	-- Buffer delete aliases
	vim.cmd([[
		cnoreabbrev bdelete Bdelete
		cnoreabbrev bdelete! Bdelete!
		cnoreabbrev bwipeout Bwipeout
		cnoreabbrev bwipeout! Bwipeout!
	]])

	-- BufferLine
	map("n", keys.buffer.pick, ":BufferLinePick<CR>", option)

	-- Neo-tree
	map("n", keys.file_explorer, ":Neotree position=left source=filesystem action=show toggle=true<CR>", option)

	-- Git status
	map("n", keys.git_status, ":Neotree position=float source=git_status action=show toggle=true<CR>", option)

	-- Aerial outline
	map("n", keys.outline, ":AerialToggle! right<CR>", option)

	-- Diffview
	map("n", keys.diff_open, ":DiffviewOpen<CR>", option)
	map("n", keys.diff_close, ":DiffviewClose<CR>", option)

	-- Terminal setup
	local float_terminal_default = require("toggleterm.terminal").Terminal:new({
		direction = "float",
		on_open = function(term)
			local cwd = vim.fn.getcwd()
			if cwd ~= term.dir then
				term:change_dir(cwd)
			end
			vim.cmd("startinsert!")
		end,
	})

	local bottom_terminal_default = require("toggleterm.terminal").Terminal:new({
		direction = "horizontal",
		on_open = function(term)
			local cwd = vim.fn.getcwd()
			if cwd ~= term.dir then
				term:change_dir(cwd)
			end

			local opts_buf = { buffer = 0 }
			vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
			vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })
			vim.cmd("startinsert!")
		end,
		on_exit = function(t, job, exit_code, name)
			vim.cmd("quit!")
		end,
	})

	function _G._float_term_toggle()
		float_terminal_default:toggle()
	end

	function _G._bottom_term_toggle()
		bottom_terminal_default:toggle()
	end

	map("n", keys.terminal.toggle_float, ":lua _float_term_toggle()<CR>", option)
	map("t", keys.terminal.toggle_float, "<C-\\><C-n>:lua _float_term_toggle()<CR>", option)
	map("n", keys.terminal.toggle, ":lua _bottom_term_toggle()<CR>", option)
	map("t", keys.terminal.toggle, "<C-\\><C-n>:lua _bottom_term_toggle()<CR>", option)

	vim.cmd([[command! Termfloat :lua _float_term_toggle()]])
	vim.cmd([[cnoreabbrev terminal Termfloat]])

	-- Session management
	map("n", "<leader>ss", ":SessionManager load_session<CR>", option)
end

-- ─── Set Transparency ───────────────────────────────────────
local function set_transparency()
	local transparency = opts.window_transparency
	vim.api.nvim_command(string.format("autocmd FileType * set winblend=%d", transparency))
	vim.o.pumblend = transparency
end

-- ─── Auto Commands ──────────────────────────────────────────
local function set_autocmd()
	local current_colorscheme = vim.g.colors_name
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			if current_colorscheme then
				vim.cmd("colorscheme " .. current_colorscheme)
			end
		end,
	})
end

-- Initialize
set_keymap()
set_transparency()
set_autocmd()
