return {
	-- File Explorer
	{
		"nvim-mini/mini.files",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<Leader>t", "<CMD>lua MiniFiles.open()<CR>", desc = "Open File Explorer" },
		},
	},
	-- Motion
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				search = {
					enabled = true,
				},
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},
	-- Scroll
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		opts = {
			mappings = {
				"<C-u>",
				"<C-d>",
				"<C-y>",
				"<C-e>",
			},
			earing = "sine",
			hide_cursor = false,
		},
	},
	-- Search
	{
		"ibhagwan/fzf-lua",
		keys = {
			{
				"<C-p>",
				function()
					require("fzf-lua").files()
				end,
				desc = "fzf browse files",
			},
			{
				"<C-b>",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "fzf browse buffers",
			},
			{
				"<C-f>",
				function()
					require("fzf-lua").grep()
				end,
				desc = "fzf grep",
			},
		},
	},
	-- Keymap
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		opts = {},
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
}
