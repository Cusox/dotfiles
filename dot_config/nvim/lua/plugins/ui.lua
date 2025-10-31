return {
	-- Icons
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-mini/mini.icons" },
	-- Completion Menu
	{ "xzbdmw/colorful-menu.nvim" },
	-- Indent
	{
		"nvim-mini/mini.indentscope",
		event = "BufReadPre",
		opts = {
			options = {
				try_as_border = true,
			},
			symbol = "│",
		},
	},
	-- Message, Cmdline, PopUpMenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"AndreM222/copilot-lualine",
		},
		opts = {
			options = {
				theme = "nordic",
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
					{
						"buffers",
						mode = 2,
						max_length = vim.o.columns / 2,
						buffers_color = {
							active = { bg = "#434C5E", fg = "#81A1C1", gui = "bold" },
							inactive = { bg = "#2A2F3A", fg = "#3B4252", gui = "italic" },
						},
						symbols = {
							modified = " ●",
							alternate_file = "",
							directory = "",
						},
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 3,
						shorting_target = 0,
					},
				},
				lualine_x = {},
				lualine_y = {
					"searchcount",
					"selectioncount",
					"encoding",
					"filetype",
					"copilot",
				},
				lualine_z = {
					"progress",
					"location",
				},
			},
		},
	},
	-- Diagnostic Message
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({
				virtual_text = false,
			}) -- Disable Neovim's default virtual text diagnostics
		end,
	},
}
