local helper_functions = require("modules.helper_functions")

local M = {}

function M.jump_to_mark()
    while true do
        vim.api.nvim_echo({{"Mark <Esc> to cancel:", "Normal"}}, false, {})
        local key = vim.fn.getchar(-1, { number = false })
        if key == "\27" then
            vim.api.nvim_echo({{"Cancelled.", "Normal"}}, false, {})
            return
        end
        local valid, reason = helper_functions.is_valid_mark(key)
        if valid then
            vim.cmd.normal("`" .. key)
            vim.api.nvim_echo({{"Jumped to mark " .. key, "Normal"}}, false, {})
            return
        else
            if reason then
                vim.api.nvim_echo({{"Mark '" .. key .. "' is " .. reason, "ErrorMsg"}, {" Press any key to continue...", "Comment"}}, false, {})
            end
            vim.fn.getchar(-1)
        end
    end
end

function M.yank_into_register()
    vim.api.nvim_echo({{"Select register to yank into: ", "Normal"}}, false, {})
end

function M.paste_from_register()
    vim.api.nvim_echo({{"Select register to paste from: ", "Normal"}}, false, {})
end

return M
