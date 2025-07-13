vim.g.mapleader = " "

vim.keymap.set("n", "<ESC>", "<CMD>noh<CR>",  { desc = "Remove highlight" })

-- Buffers
vim.keymap.set("n", "<leader>bn", "<CMD>bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<CMD>bp<CR>", { desc = "Previous buffer" })

-- Splits
vim.keymap.set("n", "<leader>sp", "<CMD>sp<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sv", "<CMD>vs<CR>", { desc = "Split window vertically" })

-- Window sizing
vim.keymap.set("n", "<C-Up>", "<CMD>res +2<CR>",         { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<CMD>res -2<CR>",       { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Right>", "<CMD>vert res +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Left>", "<CMD>vert res -2<CR>",  { desc = "Decrease window width" })

-- Window switching
vim.keymap.set("n", "<C-j>", "<CMD>winc j<CR>", { desc = "Switch to window below" })
vim.keymap.set("n", "<C-k>", "<CMD>winc k<CR>", { desc = "Switch to window above" })
vim.keymap.set("n", "<C-h>", "<CMD>winc h<CR>", { desc = "Switch to window left" })
vim.keymap.set("n", "<C-l>", "<CMD>winc l<CR>", { desc = "Switch to window right" })

-- Move lines
vim.keymap.set(
    "n", "<A-j>",
    function() return string.format("<CMD>m .+%d<CR>==", vim.v.count1) end,
    { expr = true, desc = "Move line down" }
)
vim.keymap.set(
    "n", "<A-k>",
    function() return string.format("<CMD>m .-%d<CR>==", vim.v.count1 + 1) end,
    { expr = true, desc = "Move line up" }
)

-------------
-- Plugins --
-------------

vim.keymap.set("c", "SW", "<CMD>SudaWrite<CR>",        { desc = "Write to readonly file" })

vim.keymap.set("n", "<leader>j", "<CMD>TSJToggle<CR>", { desc = "Toggle Treesitter join" })

-- Mini.nvim
vim.keymap.set("n", "<leader>/", "gcc", { remap = true,              desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>/", "<ESC><CMD>norm gvgc<CR>",        { desc = "Toggle block comment" })
vim.keymap.set("n", "<leader>fe", "<CMD>lua MiniFiles.open()<CR>", { desc = "File explorer" })

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set(
    "n", "<leader>lg", function() telescope_builtin.live_grep() end,
    { desc = "Live grep" }
)
vim.keymap.set(
    "n", "<leader>ff", function() telescope_builtin.find_files() end,
    { desc = "Find files" }
)
vim.keymap.set(
    "n", "<C-p>", function() telescope_builtin.git_files() end,
    { desc = "Find Git files" }
)
vim.keymap.set(
    "n", "<leader>fs",
    function() telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
    { desc = "Find String" }
)
