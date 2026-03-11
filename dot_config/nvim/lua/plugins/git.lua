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
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		cmd = "Neogit",
		keys = {
			{ "<Leader>g", "<CMD>Neogit<CR>", desc = "Open Neogit" },
		},
		opts = {},
	},
	{
		"NicholasZolton/neojj",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"esmuellert/codediff.nvim",
			"ibhagwan/fzf-lua", -- optional
		},
		cmd = "Neojj",
		keys = {
			{ "<leader>gg", "<cmd>Neojj<cr>", desc = "Open Neojj" },
		},
	},
}
