-- ═══════════════════════════════════════════════════════════
-- GitHub Copilot & AI Assistants Configuration
-- NOTE: No API keys are stored here. Copilot uses OAuth tokens
-- from ~/.config/github-copilot/apps.json automatically
-- ═══════════════════════════════════════════════════════════

return {
	-- GitHub Copilot
	{
		"github/copilot.vim",
		config = function()
			-- Accept Copilot suggestion with Ctrl+J
			vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
				silent = true,
				expr = true,
				replace_keycodes = false,
			})
		end,
	},

	-- CodeCompanion - AI Chat Interface
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "gpt-4o",
							},
						},
					})
				end,
			},
			strategies = {
				chat = { adapter = "copilot" },
				inline = { adapter = "copilot" },
				agent = { adapter = "copilot" },
			},
			opts = {
				log_level = "ERROR",
				language = "English",
			},
			display = {
				chat = {
					window = {
						layout = "vertical",
						position = "right",
					},
				},
			},
		},
	},

	-- Mini.diff for git integration
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				source = diff.gen_source.none(),
			})
		end,
	},

	-- Markview for markdown preview in CodeCompanion
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},

	-- Image clipboard for CodeCompanion
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
	},

	-- Markdown rendering
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},

	-- GP.nvim - Advanced GPT interface
	{
		"robitx/gp.nvim",
		config = function()
			local conf = {
				providers = {
					openai = {
						disable = true,
					},
					copilot = {
						disable = false,
						endpoint = "https://api.githubcopilot.com/chat/completions",
						-- Securely reads OAuth token from GitHub Copilot config
						secret = {
							"bash",
							"-c",
							"cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
						},
					},
				},
				agents = {
					{
						name = "ChatGPT4o",
						provider = "copilot",
						chat = true,
						command = true,
						model = { model = "gpt-4o" },
						system_prompt = require("gp.defaults").chat_system_prompt,
					},
					{
						name = "ClaudeSonnet",
						provider = "copilot",
						chat = true,
						command = true,
						model = { model = "claude-3.5-sonnet" },
						system_prompt = require("gp.defaults").chat_system_prompt,
					},
				},
				default_command_agent = "ChatGPT4o",
				default_chat_agent = "ChatGPT4o",
			}
			require("gp").setup(conf)
		end,
	},
}
