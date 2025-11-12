return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = vim.treesitter

			local parsers = {
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"cuda",
				"diff",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"html",
				"java",
				"javascript",
				"json",
				"latex",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"ninja",
				"regex",
				"rust",
				"scss",
				"toml",
				"xml",
				"yaml",
			}
			local parsers_installed = require("nvim-treesitter").get_installed()
			local filetypes = vim.iter(parsers):map(ts.language.get_filetypes):flatten():fold({}, function(tbl, v)
				tbl[v] = vim.tbl_contains(parsers_installed, v)
				return tbl
			end)

			local ts_enable = function(buffer, lang)
				local ok, hl = pcall(ts.query.get, lang, "highlights")
				if ok and hl then
					vim.treesitter.start(buffer, lang)
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				desc = "enable treesitter",
				callback = function(event)
					local ft = event.match
					local available = filetypes[ft]
					if available == nil then
						return
					end

					local lang = ts.language.get_lang(ft)
					if available then
						ts_enable(event.buf, lang)
						return
					end

					require("nvim-treesitter").install(lang):await(function()
						filetypes[ft] = true
						ts_enable(event.buf, lang)
					end)
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
