require("vim-pack")
require("keymaps")
vim.cmd("syntax enable")
vim.env.CC = "gcc"

-- UI
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.colorcolumn = { 81, 101 }

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = false

vim.api.nvim_create_augroup("set_indent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "set_indent",
    pattern = { "html", "css", "typst", },
    command = "setlocal tabstop=2 shiftwidth=2",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "jsonc",
    callback = function() vim.bo.commentstring = "// %s" end
})

-- Behavior settings
vim.opt.iskeyword:append("-") -- treat hyphen as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.shellcmdflag = "-c"
vim.opt.encoding = "UTF-8"
vim.opt.updatetime = 300
vim.opt.undofile = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.api.nvim_create_augroup("remember_folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
    group = "remember_folds",
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" and vim.fn.bufname("%") ~= "" then
            vim.cmd("mkview")
        end
    end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = "remember_folds",
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" and vim.fn.bufname("%") ~= "" then
            vim.cmd("silent! loadview")
        end
    end,
})

-- Display invisible characters
vim.opt.list = true
vim.opt.listchars = {
    tab = "⇥ ",
    trail = "·",
    multispace = "·",
    nbsp = "␣",
}

