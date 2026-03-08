return {
	{
		"sudo-tee/opencode.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
					file_types = { "markdown", "opencode_output" },
				},
				ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
			},
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
		},
		config = function()
			require("opencode").setup({})
		end,
	},
}
