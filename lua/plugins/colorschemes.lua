-- ═══════════════════════════════════════════════════════════
-- Color Schemes
-- ═══════════════════════════════════════════════════════════

return {
	-- Catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- HardHacker theme (default)
	{
		"hardhackerlabs/theme-vim",
		name = "hardhacker",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.hardhacker_darker = 0
			vim.g.hardhacker_hide_tilde = 1
			vim.g.hardhacker_keyword_italic = 1
			vim.cmd.colorscheme("hardhacker")
		end,
	},
}
