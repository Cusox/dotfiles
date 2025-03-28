return {
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
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
		keys = {
			{ "<Leader>dv", "<CMD>DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "<Leader>dh", "<CMD>DiffviewFileHistory<CR>", desc = "Open Diffview File History" },
			{ "<Leader>dc", "<CMD>DiffviewClose<CR>", desc = "Close Diffview" },
		},
		opts = {},
	},
}
