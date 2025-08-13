require("plugins")
require("keymaps")
vim.cmd("syntax enable")

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
vim.opt.smartindent = true

-- Behavior settings
vim.opt.iskeyword:append("-") -- treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
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

