-- ═══════════════════════════════════════════════════════════
-- Key Bindings Configuration
-- ═══════════════════════════════════════════════════════════

return {
	-- Leader key
	leader = " ",

	-- ─── Window Navigation ──────────────────────────────────
	jump_left_window = "<C-h>",
	jump_right_window = "<C-l>",
	jump_up_window = "<C-k>",
	jump_down_window = "<C-j>",

	-- ─── File Explorer ──────────────────────────────────────
	file_explorer = "<F9>",
	git_status = "<F8>",

	-- ─── Code Outline ───────────────────────────────────────
	outline = "<F7>",

	-- ─── Buffer Management ──────────────────────────────────
	buffer = {
		prev = "<S-h>",
		next = "<S-l>",
		close = "<leader>x",
		pick = "<leader>tt",
	},
	pick_tab = "<leader>tt",

	-- ─── Window Management ──────────────────────────────────
	window = {
		split_horizontal = "<leader>-",
		split_vertical = "<leader>|",
		close = "<leader>q",
	},

	-- ─── Search and Find (Telescope) ────────────────────────
	find_files = "<leader>ff",
	live_grep = "<leader>gg",
	search_cursor = "<leader>cc",
	find_buffer = "<leader>bb",
	telescope = {
		find_files = "<leader>ff",
		live_grep = "<leader>gg",
		buffers = "<leader>bb",
		help_tags = "<leader>fh",
		recent_files = "<leader>fr",
	},

	-- ─── LSP ────────────────────────────────────────────────
	goto_definition = "gd",
	goto_references = "gr",
	goto_declaration = "gD",
	goto_impl = "gi",
	lsp_rename = "<leader>re",
	format = "<leader>vv",
	lsp = {
		goto_definition = "gd",
		goto_declaration = "gD",
		goto_implementation = "gi",
		goto_type_definition = "gt",
		references = "gr",
		hover = "K",
		signature_help = "<C-k>",
		rename = "<leader>re",
		code_action = "<leader>ca",
		format = "<leader>vv",
	},

	-- ─── Terminal ───────────────────────────────────────────
	terminal_float = "<A-u>",
	terminal_bottom = "<A-b>",
	terminal = {
		toggle = "<A-b>",
		toggle_float = "<A-u>",
	},

	-- ─── Git / Diff View ────────────────────────────────────
	diff_open = "<leader>df",
	diff_close = "<leader>dc",
	git = {
		status = "<F8>",
		commit = "<leader>gc",
		diff = "<leader>gd",
		blame = "<leader>gb",
	},

	-- ─── Window Resize ──────────────────────────────────────
	resize_left = "<C-A-h>",
	resize_down = "<C-A-j>",
	resize_up = "<C-A-k>",
	resize_right = "<C-A-l>",

	-- ─── Session Management ─────────────────────────────────
	switch_session = "<leader>ss",

	-- ─── Misc ───────────────────────────────────────────────
	misc = {
		save = "<C-s>",
		quit = "<C-q>",
		select_all = "<C-a>",
		undo = "u",
		redo = "<C-r>",
	},
}
