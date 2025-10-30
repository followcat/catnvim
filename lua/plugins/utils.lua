-- ═══════════════════════════════════════════════════════════
-- Utility Plugins
-- ═══════════════════════════════════════════════════════════

return {
	-- Notifications
	{ "rcarriga/nvim-notify" },

	-- Window resizing
	{
		"mrjones2014/smart-splits.nvim",
		version = "*",
		config = function()
			require("smart-splits").setup({})
		end,
	},

	-- Buffer delete
	{ "famiu/bufdelete.nvim" },

	-- Session management
	{
		"Shatur/neovim-session-manager",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local Path = require("plenary.path")
			local config = require("session_manager.config")
			require("session_manager").setup({
				sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
				autoload_mode = config.AutoloadMode.Disabled,
				autosave_last_session = true,
				autosave_ignore_not_normal = true,
				autosave_ignore_dirs = { "/", "~", "/tmp/" },
				autosave_ignore_filetypes = { "gitcommit", "gitrebase" },
				autosave_only_in_session = false,
				max_path_length = 80,
			})

			-- Auto-open Neo-tree when session loads
			local config_group = vim.api.nvim_create_augroup("CatNvimConfigGroup", {})
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "SessionLoadPost",
				group = config_group,
				callback = function()
					vim.api.nvim_command("Neotree position=left source=filesystem action=show")
				end,
			})
		end,
	},

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1,
				width = 120,
				height = 0.9,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
		},
	},

	-- Twilight (dim inactive code)
	{
		"folke/twilight.nvim",
		opts = {
			dimming = { alpha = 0.25 },
			context = 10,
			treesitter = true,
		},
	},
}
