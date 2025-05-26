local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
	return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
end

-- Highlight after Yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- Treesitter
autocmd("FileType", {
	group = augroup("treesitter"),
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
