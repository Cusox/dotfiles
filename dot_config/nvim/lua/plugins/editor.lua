return {
	-- File Explorer
	{
		"nvim-mini/mini.files",
		opts = {},
		keys = {
			{ "<leader>t", "<CMD>lua MiniFiles.open()<CR>", desc = "open file explorer" },
		},
	},
	-- Motion
	{
		"ggandor/leap.nvim",
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
			vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
			vim.keymap.set({ "x", "o" }, "<Space>", function()
				require("leap.treesitter").select({
					opts = require("leap.user").with_traversal_keys("<Space>", "<Backspace>"),
				})
			end)

			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })

			require("leap.user").set_repeat_keys("<Enter>", "<Backspace>")
			require("leap").opts.preview = false
			require("leap").opts.equivalence_classes = {
				" \t\r\n",
				"([{",
				")]}",
				"'\"`",
			}
		end,
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
	-- Undo Tree
	{
		"XXiaoA/atone.nvim",
		cmd = "Atone",
		keys = {
			{ "<Leader>ao", "<CMD>Atone<CR>", desc = "Open UndoTree" },
		},
		opts = {},
	},
	-- Code Separator
	{
		"marantz-dev/codeSeparator.nvim",
		keys = {
			{ "<Leader>/b", "<CMD>BoxSeparator<CR>", desc = "Box Separator" },
			{ "<Leader>/l", "<CMD>LineSeparator<CR>", desc = "Line Separator" },
		},
		config = function()
			require("codeSeparator").setup({
				char = "=",
			})
		end,
	},
}
