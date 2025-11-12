return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<Leader>f",
				function()
					require("conform").format({ async = true })
				end,
				desc = "Format buffer",
			},
		},
		opts = {
			log_level = vim.log.levels.DEBUG,
			formatters_by_ft = {
				c = { "clang-format" },
				cmake = { "gersemi" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				yaml = { "yamlfmt" },
			},
			formatters = {
				black = {
					prepend_args = { "--line-length", "80" },
				},
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 500,
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
