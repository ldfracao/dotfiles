local M = {}

local special_marks = {
    ["'"] = true, ['"'] = true, ["^"] = true, ["."] = true,
    ["["] = true, ["]"] = true, ["<"] = true, [">"] = true
}

function M.is_valid_mark(char)
    -- Check legal characters
    local is_legal = (char >= 'a' and char <= 'z') or
                     (char >= 'A' and char <= 'Z') or
                     (char >= '0' and char <= '9') or
                     special_marks[char]
    if not is_legal then
        return false, "not a legal mark character."
    end
    -- Check if set
    -- getpos() returns a list [bufnum, lnum, col, off]
    -- when lnum == 0 the mark is not set
    local pos = vim.fn.getpos("`" .. char)
    if pos[2] == 0 then
        return false, "not set."
    end
    return true
end

return M
