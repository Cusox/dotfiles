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
		opts = {
			ensure_installed = {
				"basedpyright",
				"clangd",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"lua_ls",
				"ruff",
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
	},
}
