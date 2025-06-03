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
			local alreadyInstalled = require("nvim-treesitter.config").get_installed()
			local parsersToInstall = vim.iter(ensureInstalled)
				:filter(function(parser)
					return not vim.tbl_contains(alreadyInstalled, parser)
				end)
				:totable()
			require("nvim-treesitter").install(parsersToInstall)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local filetype = args.match
					local lang = vim.treesitter.language.get_lang(filetype)
					if vim.treesitter.language.add(lang) then
						vim.wo.foldlevel = 99
						vim.wo.foldmethod = "expr"
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						vim.treesitter.start()
					end
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
