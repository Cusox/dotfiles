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
					"watches",
					"scopes",
					"exceptions",
					"breakpoints",
					"threads",
					"repl",
					"disassembly",
				},
			},
			windows = {
				size = 0.5,
				position = "right",
				terminal = {
					size = 0.25,
					position = "below",
				},
			},
			auto_toggle = true,
			follow_tab = true,
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
				"<leader>dds",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>ddo",
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
				"<leader>ddq",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
		config = function()
			local dap = require("dap")

			dap.adapters["codelldb"] = {
				type = "executable",
				command = "codelldb",
			}

			dap.configurations.c = {
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
			dap.configurations.cpp = dap.configurations.c
			dap.configurations.rust = dap.configurations.c

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
				{ text = "▶", texthl = "DapStopped", linehl = "debugPC", numhl = "debugPC" }
			)

			dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"
		end,
	},
}
