return {
	{
		"pablopunk/pi.nvim",
		keys = {
			{
				"<leader>ai",
				"<cmd>PiAsk<cr>",
				desc = "Ask Pi",
			},
			{
				"<leader>av",
				"<cmd>PiAskSelection<cr>",
				desc = "Ask Pi (Selection)",
				mode = "v",
			},
		},
		opts = {},
	},
}
