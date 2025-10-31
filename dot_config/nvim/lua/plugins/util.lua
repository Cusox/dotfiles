return {
	{
		"xvzc/chezmoi.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("chezmoi").setup({})
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = { (vim.fn.expand("~")):gsub("\\", "/") .. "/.local/share/chezmoi/*" },
				callback = function(ev)
					local bufnr = ev.buf
					local edit_watch = function()
						require("chezmoi.commands.__edit").watch(bufnr)
					end
					vim.schedule(edit_watch)
				end,
			})

			local fzf_chezmoi = function()
				local chezmoi_commands = require("chezmoi.commands")

				require("fzf-lua").fzf_exec(chezmoi_commands.list(), {
					actions = {
						["default"] = function(selected, opts)
							require("chezmoi.commands").edit({
								targets = { "~/" .. selected[1] },
								args = { "--watch" },
							})
						end,
					},
				})
			end

			vim.api.nvim_create_user_command("ChezmoiFzf", fzf_chezmoi, {})
		end,
	},
}
