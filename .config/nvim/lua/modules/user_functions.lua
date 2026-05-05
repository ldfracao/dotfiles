local helper_functions = require("modules.helper_functions")

M = {}

function M.jump_to_mark()
    while true do
	    print("Mark: ")
	    local key = vim.fn.nr2char(vim.fn.getchar())
	    print("KEy = " .. key)
	    if key == "" then
		    print("Cancelled")
		    return
	    end
	    if helper_functions.is_valid_mark(key) then
		    vim.cmd.normal("`" .. key)
		    print("Jumped to mark " .. key)
		    return
	    end
    end
end

function M.yank_into_register()
	print("Select register to yank into: ")
end

function M.paste_from_register()
	print("Select register to paste from: ")
end

return M
