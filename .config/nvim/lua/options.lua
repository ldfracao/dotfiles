local options = {
-- Display options
	number = true,
	relativenumber = true,
	cursorline = true,
	shiftwidth = 4
}
for key, value in pairs(options) do
	vim.opt[key] = value
end
