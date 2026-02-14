---lazy load
-- luacheck: ignore 112 113
---@diagnostic disable: undefined-global
local M = {}

---don't use
---table.concat(vim.api.nvim_buf_get_text(0, 0, 0, -1, -1, {}))
---because vim has encoding
function M.callback()
    if vim.o.buftype ~= "" then
        return
    end
    local text = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
    if vim.o.fileencoding ~= "utf-8" then
        text = vim.iconv(text, "utf-8", vim.o.fileencoding)
    end
    local tellenc = require 'tellenc.tellenc'.tellenc
    local enc = tellenc(text)
    if enc == "" or enc == vim.o.fileencoding then
        return
    end
    -- cannot work
    -- vim.bo.fileencoding = enc
    -- vim.o.fileencodings = enc
    -- https://github.com/neovim/neovim/issues/21687
    vim.cmd("edit ++encoding=" .. enc)
end

---create autocmds
---@param augroup_id integer?
function M.create_autocmds(augroup_id)
    augroup_id = augroup_id or vim.api.nvim_create_augroup("tellenc", {})
    -- BufAdd/BufNew cannot work
    vim.api.nvim_create_autocmd("BufEnter", {
        group = augroup_id,
        callback = M.callback
    })
end

return M
