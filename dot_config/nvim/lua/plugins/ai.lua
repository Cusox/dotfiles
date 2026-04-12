local M = {}

local gh = function(x)
	return "https://github.com/" .. x
end

function M.setup()
	-- Pi
	vim.pack.add({
		gh("alex35mil/pi.nvim"),
	})
	require("pi").setup({
		zen = {
			width = 100,
			keys = {
				toggle = { "<leader>pz", modes = { "n", "i" } },
				exit = {
					{ "<esc>", modes = "n" },
				},
			},
		},
		statusline = {
			layout = {
				left = { "context", " ", "tokens", " ", "cache", " ", "cost" },
				right = { "attention", " ", "compaction", " ", "model", " ", "thinking" },
			},
		},
	})

	local pi = require("pi")

	vim.keymap.set({ "n", "v" }, "<leader>pp", function()
		pi.show({ layout = "side" })
	end, { desc = "Pi side" })
	vim.keymap.set({ "n", "v" }, "<leader>pl", function()
		pi.toggle_layout()
	end, { desc = "Pi toggle layout" })
	vim.keymap.set({ "n", "v" }, "<leader>pc", function()
		pi.continue_session()
	end, { desc = "Pi continue last session" })
	vim.keymap.set({ "n", "v" }, "<leader>pr", function()
		pi.resume_session()
	end, { desc = "Pi resume past session" })
	vim.keymap.set({ "n", "v" }, "<leader>pm", function()
		pi.send_mention()
	end, { desc = "Pi mention file/selection" })
	vim.keymap.set({ "n", "v" }, "<leader>pa", function()
		pi.attention()
	end, { desc = "Pi open next attention request" })

	local group = vim.api.nvim_create_augroup("pi-keymaps", { clear = true })

	local function map(buf, key, action, modes)
		vim.keymap.set(modes or { "n", "i", "v" }, key, action, { buffer = buf })
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = { "pi-chat-history", "pi-chat-prompt", "pi-chat-attachments" },
		callback = function(event)
			map(event.buf, "<leader>pq", pi.toggle_chat)
			map(event.buf, "<C-c>", pi.abort)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "pi-chat-history",
		callback = function(event)
			map(event.buf, "<C-j>", pi.focus_chat_prompt)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "pi-chat-prompt",
		callback = function(event)
			map(event.buf, "<C-k>", pi.focus_chat_history)
			map(event.buf, "<C-j>", pi.focus_chat_attachments)
			map(event.buf, "<C-u>", function()
				pi.scroll_chat_history("up", 2)
			end)
			map(event.buf, "<C-d>", function()
				pi.scroll_chat_history("down", 2)
			end)
			map(event.buf, "<C-m>", pi.select_model)
			map(event.buf, "<C-t>", pi.select_thinking_level)
			map(event.buf, "<C-s>", pi.new_session)
			map(event.buf, "<A-c>", pi.compact)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "pi-chat-attachments",
		callback = function(event)
			map(event.buf, "<C-k>", pi.focus_chat_prompt)
		end,
	})
end

return M
