---tellenc for neovim
local tellenc = require "tellenc".tellenc
local M = {
    encs = {
        ascii = "utf-8",
        gbk = "cp936",
        gb2312 = "cp936",
        big5 = "cp950",
        binary = "",
        unknown = "",
    },
}

---wrap `tellenc`
---@param text string
---@return string enc
function M.tellenc(text)
    local enc = tellenc(text)
    enc = M.encs[enc] or enc or ""
    return enc
end

return M
