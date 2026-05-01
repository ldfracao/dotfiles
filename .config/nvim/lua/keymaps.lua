-- Remap leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymaps =	{
-- Command-line commands 
	{"n", "<leader>so", ":source %<CR>"},
	{"n", "<leader>vs", ":vsplit<CR>"},
	{"n", "<leader>sp", ":split<CR>"},
	{"n", "<leader>w", ":write<CR>"},
	{"n", "<leader>q", ":quit<CR>"},
-- Commands 
	{"v", "<leader>y", "\"+y"},
-- Window navigation 
	{"n", "<C-h>", "<C-w><C-h>"},
	{"n", "<C-j>", "<C-w><C-j>"},
	{"n", "<C-k>", "<C-w><C-k>"},
	{"n", "<C-l>", "<C-w><C-l>"},
-- Diagnostics
	{"n", "<leader>f", ":lua vim.diagnostic.open_float()<CR>"},
}

for _, value in ipairs(keymaps) do
	vim.keymap.set(unpack(value))
end
