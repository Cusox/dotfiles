return {
	-- Debugger
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{
				"<leader>ddt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>ddc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>ddi",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>ddo",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>ddu",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>ddr",
				function()
					require("dap").repl.open()
				end,
				desc = "Open REPL",
			},
			{
				"<leader>ddl",
				function()
					require("dap").run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>ddq",
				function()
					require("dap").terminate()
					require("dapui").close()
					require("nvim-dap-virtual-text").toggle()
				end,
				desc = "Terminate",
			},
			{
				"<leader>ddb",
				function()
					require("dap").list_breakpoints()
				end,
				desc = "List Breakpoints",
			},
			{
				"<leader>dde",
				function()
					require("dap").set_exception_breakpoints({ "all" })
				end,
				desc = "Set Exception Breakpoints",
			},
		},
		config = function()
			local mason_dap = require("mason-nvim-dap")
			local dap = require("dap")
			local dap_ui = require("dapui")
			local dap_virtual_text = require("nvim-dap-virtual-text")

			dap_virtual_text.setup()

			mason_dap.setup({
				ensure_installed = { "codelldb" },
				automatic_installation = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})

			dap.configurations.c = {
				{
					name = "Launch File",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.cpp = dap.configurations.c
			dap.configurations.rust = dap.configurations.c

			dap_ui.setup()

			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

			dap.listeners.before.attach.dapui_config = function()
				dap_ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dap_ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dap_ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dap_ui.close()
			end
		end,
	},
	-- Formatter
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
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_organize_imports", "black" },
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
	-- Linter
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre" },
		keys = {
			{
				"<Leader>l",
				function()
					require("lint").try_lint()
				end,
			},
		},
		config = function()
			require("lint").linters_by_ft = {
				python = { "ruff" },
			}
		end,
	},
}
