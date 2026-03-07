return {
	{
		"https://codeberg.org/Jorenar/nvim-dap-disasm.git",
		dependency = "igorlfs/nvim-dap-view",
		config = true,
	},
	{
		"igorlfs/nvim-dap-view",
		lazy = false,
		---@module 'dap-view'
		---@type dapview.Config
		opts = {
			winbar = {
				sections = {
					"disassembly",
					"watches",
					"scopes",
					"exceptions",
					"breakpoints",
					"threads",
					"repl",
				},
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		keys = {
			{
				"<leader>ddb",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>ddl",
				function()
					require("dap").list_breakpoints()
				end,
				desc = "List Breakpoints",
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
					require("dap").run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>dds",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run To Cursor",
			},
			{
				"<leader>ddq",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
		config = function()
			local dap = require("dap")

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}
			dap.adapters["rust-gdb"] = {
				type = "executable",
				command = "rust-gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}
			dap.adapters["codelldb"] = {
				type = "executable",
				command = "codelldb",
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					args = {},
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
				{
					name = "Select and attach to process",
					type = "gdb",
					request = "attach",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					pid = function()
						local name = vim.fn.input("Executable name (filter): ")
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to gdbserver :1234",
					type = "gdb",
					request = "attach",
					target = "localhost:1234",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.rust = {
				{
					name = "Launch",
					type = "rust-gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					args = {}, -- provide arguments if needed
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
				{
					name = "Select and attach to process",
					type = "rust-gdb",
					request = "attach",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					pid = function()
						local name = vim.fn.input("Executable name (filter): ")
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to gdbserver :1234",
					type = "rust-gdb",
					request = "attach",
					target = "localhost:1234",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}

			for _, group in pairs({
				"DapBreakpoint",
				"DapBreakpointCondition",
				"DapBreakpointRejected",
				"DapLogPoint",
			}) do
				vim.fn.sign_define(group, { text = "●", texthl = group })
			end
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "debugPC", numhl = "debugPC" }
			)

			dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"
		end,
	},
}
