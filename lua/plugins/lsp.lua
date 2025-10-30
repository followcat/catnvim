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
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Python
			lspconfig.pyright.setup({ capabilities = capabilities })

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- Bash
			lspconfig.bashls.setup({ capabilities = capabilities })

			-- JavaScript/TypeScript
			lspconfig.ts_ls.setup({ capabilities = capabilities })

			-- Go
			lspconfig.gopls.setup({ capabilities = capabilities })
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
