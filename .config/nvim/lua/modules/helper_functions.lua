local M = {}

function M.is_valid_mark(char)
	if #char ~= 1 then return false end
	-- getpos() returns a list [bufnum, lnum, col, off]
	-- when lnum == 0 mark is not set
	local pos = vim.fn.getpos("`" .. char)
	if pos[2] == 0 then
		print("Mark " .. char .. " is not set")
		return false
	end
	local special_marks = {
		["'"] = true, ["\""] = true, ["^"] = true, ["."] = true,
		["["] = true, ["]"] = true, ["<"] = true, [">"] = true
	}
	if char >= 'a' and char <= 'z' or
	   char >= 'A' and char <= 'Z' or
	   special_marks[char] then
		return true
	end
	return false
end

return M
