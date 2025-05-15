-- Capabilities
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

-- LSP
-- Python
vim.lsp.config("basedpyright", {
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
vim.lsp.config("ruff", {
	on_attach = function(client, bufnr)
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
})
