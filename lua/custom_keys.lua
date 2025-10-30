-- ═══════════════════════════════════════════════════════════
-- Key Bindings Configuration
-- ═══════════════════════════════════════════════════════════

return {
	-- Leader key
	leader = " ",

	-- ─── File Explorer ──────────────────────────────────────
	file_explorer = {
		toggle = "<leader>e",
		focus = "<leader>o",
	},

	-- ─── Buffer Management ──────────────────────────────────
	buffer = {
		prev = "<S-h>",
		next = "<S-l>",
		close = "<leader>x",
		pick = "<leader>b",
	},

	-- ─── Window Management ──────────────────────────────────
	window = {
		split_horizontal = "<leader>-",
		split_vertical = "<leader>|",
		close = "<leader>q",
	},

	-- ─── Search and Find ────────────────────────────────────
	telescope = {
		find_files = "<leader>ff",
		live_grep = "<leader>fg",
		buffers = "<leader>fb",
		help_tags = "<leader>fh",
		recent_files = "<leader>fr",
	},

	-- ─── LSP ────────────────────────────────────────────────
	lsp = {
		goto_definition = "gd",
		goto_declaration = "gD",
		goto_implementation = "gi",
		goto_type_definition = "gt",
		references = "gr",
		hover = "K",
		signature_help = "<C-k>",
		rename = "<leader>rn",
		code_action = "<leader>ca",
		format = "<leader>f",
	},

	-- ─── Terminal ───────────────────────────────────────────
	terminal = {
		toggle = "<C-/>",
		toggle_float = "<leader>tf",
	},

	-- ─── Git ────────────────────────────────────────────────
	git = {
		status = "<leader>gs",
		commit = "<leader>gc",
		diff = "<leader>gd",
		blame = "<leader>gb",
	},

	-- ─── Misc ───────────────────────────────────────────────
	misc = {
		save = "<C-s>",
		quit = "<C-q>",
		select_all = "<C-a>",
		undo = "u",
		redo = "<C-r>",
	},
}
