local opts_expand = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	if opts.remap and not vim.g.vscode then
		opts.remap = nil
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

local map = opts_expand

-- Better Up/Down
map("n", "j", [[v:count ? 'j' : 'gj']], { desc = "Down", expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { desc = "Up", expr = true })

-- Visual Block Remap
map("n", "<Leader>b", "<C-v>", { desc = "Visual Block" })

-- Move Window
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Split Window
map("n", "<Leader>v", "<C-w>v", { desc = "Vertical Split" })
map("n", "<Leader>s", "<C-w>s", { desc = "Horizontal Split" })
map("n", "<Leader>,", "<CMD>vertical resize -10<CR>", { desc = "Move Window to Left" })
map("n", "<Leader>.", "<CMD>vertical resize +10<CR>", { desc = "Move Window to Right" })
map("n", "<Leader>-", "<CMD>resize -10<CR>", { desc = "Move Window to Upper" })
map("n", "<Leader>+", "<CMD>resize +10<CR>", { desc = "Move Window to Lower" })
map("n", "<Leader>=", "<C-w>=", { desc = "Balance Window" })

-- Close Window
map("n", "<Leader>q", "<CMD>q<CR>", { desc = "Close Window" })
map("n", "<Leader>w", "<CMD>w<CR>", { desc = "Save Window" })
map("n", "<Leader>wq", "<CMD>wq<CR>", { desc = "Save and Close Window" })

-- Jump
map("n", "<Leader>[", "<C-o>", { desc = "Jump Prev" })
map("n", "<Leader>]", "<C-i>", { desc = "Jump Next" })
map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "Jump to Definition" })
map("n", "gt", "<C-]>", { desc = "Jump to Tag" })

-- Clear Search Hightlight
map("n", "<Leader>c", "<CMD>noh<CR>", { desc = "Clear Search Highlight" })

-- Buffer
map("n", "<Leader>bh", "<CMD>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<Leader>bl", "<CMD>bnext<CR>", { desc = "Next Buffer" })
map("n", "<Leader>bq", "<CMD>bd<CR>", { desc = "Delete Buffer" })
