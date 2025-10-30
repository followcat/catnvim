-- ═══════════════════════════════════════════════════════════
-- ChatGPT Plugin Configuration
-- NOTE: Requires OPENAI_API_KEY environment variable
-- ═══════════════════════════════════════════════════════════

return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			-- Configuration uses environment variable OPENAI_API_KEY
			-- Set it with: export OPENAI_API_KEY="your-key-here"
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
