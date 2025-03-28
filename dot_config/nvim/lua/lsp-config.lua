local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = {
		"basedpyright",
		"clangd",
		"docker_compose_language_service",
		"dockerls",
		"lua_ls",
		"ruff",
	},
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- C/C++
lspconfig.clangd.setup({
	capabilities = capabilities,
})

-- Docker Compose
lspconfig.docker_compose_language_service.setup({
	capabilities = capabilities,
})

-- DockerFile
lspconfig.dockerls.setup({
	capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = "Disable",
				library = {
					-- vim.api.nvim_get_runtime_file("", true),
					vim.env.VIMRUNTIME,
				},
			},
			diagnostics = {
				globals = { "vim", "require" },
			},
		},
	},
})

-- Python
lspconfig.basedpyright.setup({
	capabilities = capabilities,
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			disableTaggedHints = true,
			analysis = {
				diagnosticSeverityOverrides = {
					reportUndefinedVariable = "none",
				},
				typeCheckingMode = "standard",
			},
		},
	},
})
lspconfig.ruff.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
})
