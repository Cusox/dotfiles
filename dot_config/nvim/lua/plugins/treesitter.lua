return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ensureInstalled = {
				"bash",
				"c",
				"cpp",
				"cuda",
				"dockerfile",
				"git_config",
				"go",
				"gomod",
				"lua",
				"make",
				"rust",
			}
			local alreadyInstalled = require("nvim-treesitter.config").installed_parsers()
			local parsersToInstall = vim.iter(ensureInstalled)
				:filter(function(parser)
					return not vim.tbl_contains(alreadyInstalled, parser)
				end)
				:totable()
			require("nvim-treesitter").install(parsersToInstall)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(details)
					local bufnr = details.buf
					if not pcall(vim.treesitter.start, bufnr) then
						return
					end
					vim.wo.foldlevel = 99
					vim.wo.foldmethod = "expr"
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.bo[bufnr].indentexpr = "v:lua.require'treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		opts = {},
	},
}
