-- Remap leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local user_functions = require("modules.user_functions")

local keymaps =	{
-- Command-line
	{"n", "<Leader>so", ":source %<CR>", { desc = "Sources the current buffer" }},
	{"n", "<Leader>vs", ":vsplit<CR>", { desc = "Splits window vertically" }},
	{"n", "<Leader>sp", ":split<CR>", { desc = "Splits window horizontally" }},
	{"n", "<Leader>w", ":write<CR>", { desc = "Saves the current buffer" }},
	{"n", "<Leader>q", ":quit<CR>", { desc = "Exits neovim" }},
	{"n", "<Leader>r", ":restart<CR>", { desc = "Restarts neovim" }},
	{"n", "<Leader>me", ":messages<CR>", { desc = "Show messages" }},
-- Navigation 
	{"n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" }},
	{"n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the bottom window" }},
	{"n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the top window" }},
	{"n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" }},
	{"n", "<C-d>", "<C-d>zz", { desc = "Centers the line under the cursor after half scroll up" }},
	{"n", "<C-u>", "<C-u>zz", { desc = "Centers the line under the cursor after half scroll down" }},
	{"n", "<C-b>", "<C-b>zz", { desc = "Centers the line under the cursor after scroll down" }},
	{"n", "<C-f>", "<C-f>zz", { desc = "Centers the line under the cursor after scroll down" }},
-- Diagnostics
	{"n", "<Leader>f", ":lua vim.diagnostic.open_float()<CR>", { desc = "Opens float diagnostics for the current line" }},
-- Toggle comments
	{"n", "<Leader>c", function() vim.cmd.normal("gcc") end, { desc = "Toggle comment line" }},
	{"v", "<Leader>c", function() vim.cmd.normal("gc") end, { desc = "Toggle comment line" }},
-- Functions (user_functions.lua)
	{"n", "<Leader>ma", user_functions.jump_to_mark, { desc = "Jump to exact mark using `" }},
	{"v", "<Leader>yr", user_functions.yank_into_register, { desc = "Yank into register" }},
	{{"n", "v"}, "<Leader>pr", user_functions.paste_from_register, { desc = "Paste from register" }},
}

for _, value in ipairs(keymaps) do
	vim.keymap.set(unpack(value))
end
