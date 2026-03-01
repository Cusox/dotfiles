return {
	"MeanderingProgrammer/render-markdown.nvim",
	---@module 'render-markdown'
	---@type render.md.UserConfig
	ft = { "markdown", "codecompanion" },
	opts = {
		quote = {
			repeat_linebreak = true,
		},
		win_options = {
			showbreak = {
				default = "",
				rendered = "  ",
			},
			breakindent = {
				default = false,
				rendered = true,
			},
			breakindentopt = {
				default = "",
				rendered = "",
			},
		},
		checkbox = {
			checked = {
				scope_highlight = "@markup.strikethrough",
			},
			custom = {
				todo = {
					rendered = "◯ ",
				},
			},
		},
		heading = {
			border = true,
			border_virtual = true,
		},
		indent = {
			enabled = true,
			skip_heading = true,
		},
	},
}
