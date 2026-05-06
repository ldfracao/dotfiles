local M = {}

function M.jump_to_mark()
    while true do
        vim.api.nvim_echo({{"Jump to mark <Esc> to cancel: ", "Normal"}}, false, {})
	-- getchar() returns the ASCII code of the key pressed
	-- unless number = false then it retirns a string
	-- -1 to wait for a key to be pressed (default)
        local key = vim.fn.getchar(-1, { number = false })
        if key == "\27" then
            vim.api.nvim_echo({{"Cancelled.", "Normal"}}, false, {})
            return
        end
        local ok, err = pcall(vim.cmd.normal, "`" .. key)
	if ok then
            vim.api.nvim_echo({{"Jumped to mark `" .. key, "Normal"}}, false, {})
            return
        else
	    vim.api.nvim_echo({{"Error: " .. err, "ErrorMsg"}, {" Press any key to continue...", "Comment"}}, false, {})
	end
            vim.fn.getchar(-1)
    end
end

function M.yank_into_register()
    vim.api.nvim_echo({{"Yank into register <Esc> to cancel: ", "Normal"}}, false, {})
        local key = vim.fn.getchar(-1, { number = false })
        if key == "\27" then
            vim.api.nvim_echo({{"Cancelled.", "Normal"}}, false, {})
            return
        end
	local ok, err = pcall(vim.cmd.normal, "\"" .. key .. "y")
	if ok then
	    return
	else
	    vim.api.nvim_echo({{"Error: " .. err, "ErrorMsg"}, {" Press any key to continue...", "Comment"}}, true, {})
	end
	vim.fn.getchar(-1)
end

function M.paste_from_register()
    vim.api.nvim_echo({{"Paste from register <Esc> to cancel: ", "Normal"}}, false, {})
        local key = vim.fn.getchar(-1, { number = false })
        if key == "\27" then
            vim.api.nvim_echo({{"Cancelled.", "Normal"}}, false, {})
            return
        end
	local ok, err = pcall(vim.cmd.normal, "\"" .. key .. "p")
	if ok then
	    return
	else
	    vim.api.nvim_echo({{"Error: " .. err, "ErrorMsg"}, {" Press any key to continue...", "Comment"}}, true, {})
	end
	vim.fn.getchar(-1)
end

return M
