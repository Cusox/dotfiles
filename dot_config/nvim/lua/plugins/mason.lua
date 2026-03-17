return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			{ "mason-org/mason-lspconfig.nvim", opts = {} },
			{ "jay-babu/mason-nvim-dap.nvim", opts = {} },
		},
		config = function()
			local lsps = {
				"bashls",
				"clangd",
				"copilot",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"jsonls",
				"lua_ls",
				"neocmake",
				"ty",
			}

			local daps = {
				"codelldb",
			}

			local linters = {
				"shellcheck",
			}

			local formatters = {
				"beautysh",
				"clang-format",
				"gersemi",
				"ruff",
				"stylua",
				"yamlfmt",
			}

			local tools = {}
			vim.list_extend(tools, lsps)
			vim.list_extend(tools, daps)
			vim.list_extend(tools, linters)
			vim.list_extend(tools, formatters)
			require("mason-tool-installer").setup({
				ensure_installed = tools,
				auto_update = true,
			})
		end,
	},
}
