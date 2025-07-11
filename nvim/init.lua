vim.opt.undofile = true

-- UI
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Display invisible characters
local space = '·'
vim.opt.list = true
vim.opt.listchars = {
    tab = '→ ',
    trail = space,
    multispace = space,
    nbsp = '␣',
}

vim.cmd('syntax enable')
require("plugins")
require("remap")
