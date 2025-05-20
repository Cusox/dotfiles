return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			lsp = {
				"clangd",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"lua_ls",
			},
			dap = {
				"codelldb",
			},
			linter = {},
			formatter = {
				"stylua",
				"black",
				"yamlfmt",
			},
		},
		config = function(_, opts)
			local lsp = {}
			local lsp_path = vim.fn.stdpath("config") .. "/lsp"

			for file in vim.fs.dir(lsp_path) do
				local name = file:match("(.+)%.lua$")
				if name then
					lsp[name] = true
				end
			end

			local ensure_installed = vim.tbl_keys(lsp or {})
			vim.list_extend(ensure_installed, opts.lsp)
			vim.list_extend(ensure_installed, opts.dap)
			vim.list_extend(ensure_installed, opts.linter)
			vim.list_extend(ensure_installed, opts.formatter)

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
				auto_update = true,
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
	},
}
