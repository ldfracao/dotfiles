local options = {
-- Display options
	number = true,
	relativenumber = true,
	cursorline = true,
	shiftwidth = 4,
	autocomplete = true,
	complete = ".,w,b,u,t,o",
	completeopt = "menu,popup,preview",
	pumborder = "rounded"
}
for key, value in pairs(options) do
	vim.opt[key] = value
end
