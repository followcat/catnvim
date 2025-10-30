-- ═══════════════════════════════════════════════════════════
-- Git Integration
-- ═══════════════════════════════════════════════════════════

return {
	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				current_line_blame = false,
				preview_config = {
					border = "rounded",
				},
			})
		end,
	},

	-- Diff view
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
