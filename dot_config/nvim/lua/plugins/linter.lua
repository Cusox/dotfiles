return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre" },
		keys = {
			{
				"<Leader>l",
				function()
					require("lint").try_lint()
				end,
				desc = "Lint buffer",
			},
		},
		config = function()
			require("lint").linters_by_ft = {
				python = { "ruff" },
			}
		end,
	},
}
