return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				sync_install = false,
				ensure_installed = {
					"bash",
					"c",
					"css",
					"cpp",
					"dockerfile",
					"go",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"python",
					"rust",
					"toml",
					"vim",
					"yaml",
				},
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		opts = {},
	},
}
