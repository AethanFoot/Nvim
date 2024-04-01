local opt = vim.opt
local g = vim.g

opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"
opt.wrap = false
opt.clipboard = ""
-- opt.signcolumn = "number"
opt.undodir = os.getenv "HOME" .. "/.cache/.vimdid"
-- local autocmd = vim.api.nvim_create_autocmd
