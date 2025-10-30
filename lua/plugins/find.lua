-- ═══════════════════════════════════════════════════════════
-- Telescope - Fuzzy Finder
-- ═══════════════════════════════════════════════════════════

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({})

			local option = { noremap = true, silent = true }
			local keys = require("custom_keys")
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", keys.telescope.find_files, builtin.find_files, option)
			vim.keymap.set("n", keys.telescope.live_grep, builtin.live_grep, option)
			vim.keymap.set("n", keys.telescope.buffers, builtin.buffers, option)
			vim.keymap.set("n", keys.telescope.help_tags, builtin.help_tags, option)
		end,
	},
}
