return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<Leader>sd",
				function()
					require("persistence").load()
				end,
				desc = "Load current session",
			},
			{
				"<Leader>sf",
				function()
					require("persistence").select()
				end,
				desc = "Select a session",
			},
			{
				"<Leader>ss",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Load last session",
			},
		},
		opts = {},
	},
}
