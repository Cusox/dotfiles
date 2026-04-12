local M = {}

local gh = function(x)
	return "https://github.com/" .. x
end
local cb = function(x)
	return "https://codeberg.org/" .. x
end

function M.setup()
	-- Undotree
	vim.cmd.packadd("nvim.undotree")
	vim.keymap.set("n", "<leader>u", require("undotree").open)

	-- Keymap
	vim.pack.add({
		gh("folke/which-key.nvim"),
		gh("m4xshen/hardtime.nvim"),
	})
	require("which-key").setup()
	vim.keymap.set("n", "<leader>?", function()
		require("which-key").show({ global = false })
	end, { desc = "Buffer Local Keymaps (which-key)" })
	require("hardtime").setup()

	-- Session
	vim.pack.add({
		gh("folke/persistence.nvim"),
	})
	require("persistence").setup()
	vim.keymap.set("n", "<leader>sd", function()
		require("persistence").load()
	end, { desc = "Load Current Session" })
	vim.keymap.set("n", "<leader>sf", function()
		require("persistence").select()
	end, { desc = "Select a Session" })
	vim.keymap.set("n", "<leader>ss", function()
		require("persistence").load({ last = true })
	end, { desc = "Load Last Session" })

	-- File Explorer
	vim.pack.add({
		gh("nvim-mini/mini.files"),
	})
	require("mini.files").setup()
	vim.keymap.set("n", "<leader>t", function()
		MiniFiles.open()
	end, { desc = "open file explorer" })

	-- Motion
	vim.pack.add({
		cb("andyg/leap.nvim"),
	})
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

	-- Annotation
	vim.api.nvim_create_autocmd("BufReadPre", {
		once = true,
		callback = function()
			vim.pack.add({
				gh("RiccardoMarantonio/codeSeparator.nvim"),
			})
			require("codeSeparator").setup({
				char = "=",
			})
			vim.keymap.set("n", "<Leader>/b", function()
				vim.cmd.BoxSeparator()
			end, { desc = "Box Separator" })
			vim.keymap.set("n", "<Leader>/l", function()
				vim.cmd.LineSeparator()
			end, { desc = "Line Separator" })
		end,
	})
	vim.pack.add({
		gh("jeangiraldoo/codedocs.nvim"),
	})
	vim.keymap.set("n", "<leader>k", "<cmd>Codedocs<CR>", { desc = "Insert annotation" })

	-- CodeAction
	vim.api.nvim_create_autocmd("LspAttach", {
		once = true,
		callback = function()
			vim.pack.add({
				gh("rachartier/tiny-code-action.nvim"),
			})
			require("tiny-code-action").setup({
				backend = "delta",
				picker = "fzf-lua",
			})
		end,
	})
end

return M
