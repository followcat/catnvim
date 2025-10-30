-- ═══════════════════════════════════════════════════════════
-- LSP Configuration
-- ═══════════════════════════════════════════════════════════

return {
	-- Mason - LSP installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
				},
			})
		end,
	},

	-- Mason LSP config
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			-- Get capabilities for completion
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- Python
			vim.lsp.config.pyright = {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
				capabilities = capabilities,
			}

			-- Lua
			vim.lsp.config.lua_ls = {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			}

			-- Bash
			vim.lsp.config.bashls = {
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh", "bash" },
				root_markers = { ".git" },
				capabilities = capabilities,
			}

			-- JavaScript/TypeScript
			vim.lsp.config.ts_ls = {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
				capabilities = capabilities,
			}

			-- Enable LSP for configured filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "python", "lua", "sh", "bash", "javascript", "javascriptreact", "typescript", "typescriptreact" },
				callback = function(args)
					vim.lsp.enable(args.buf)
				end,
			})
		end,
	},

	-- Null-ls for formatters and linters
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				border = "rounded",
				sources = {
					-- Add your formatters/linters here
				},
			})
		end,
	},

	-- Mason null-ls integration
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_setup = true,
				ensure_installed = { "shfmt", "prettier", "stylua", "black" },
			})
		end,
	},
}
