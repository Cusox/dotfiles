return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
	},
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		keys = {
			{ "<Leader>g", "<CMD>Neogit<CR>", desc = "Open Neogit" },
		},
		opts = {},
	},
}
