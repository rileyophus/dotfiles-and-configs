vim.g.mapleader = " "

vim.keymap.set("n", "<ESC>", "<CMD>noh<CR>", { desc = "Remove highlight" })

-- Delete, copy, cut, & paste
vim.keymap.set({ "n", "x", } , "x", '"_x', { noremap = true, desc = "Delete without copy", })
vim.keymap.set("n", "<leader>p", '"0p', { noremap = true,    desc = "Paste from last yank", })
vim.keymap.set("i", "<C-Del>", "<C-o>de", { noremap = true,  desc = "Delete word", })

    -- Need both of these for terminal cross-compatibility
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, desc = "Backspace word", })
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true,  desc = "Backspace word", })

-- Buffers
vim.keymap.set("n", "<leader>l", "<CMD>bn<CR>",       { desc = "Next buffer" })
vim.keymap.set("n", "<leader>h", "<CMD>bp<CR>",       { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bp|bd #<CR>", { desc = "Delete buffer w/out deleting window" })

-- Tabs
vim.keymap.set("n", "<leader>L", "<CMD>tabn<CR>",   { desc = "Next tab" })
vim.keymap.set("n", "<leader>H", "<CMD>tabp<CR>",   { desc = "Previous tab" })
vim.keymap.set("n", "<leader>T", "<CMD>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>W", "<CMD>tabc<CR>",   { desc = "Close tab" })

-- Splits
vim.keymap.set("n", "<leader>sp", "<CMD>sp<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sv", "<CMD>vs<CR>", { desc = "Split window vertically" })

-- Window sizing
vim.keymap.set("n", "<C-Up>", "<CMD>res +2<CR>",         { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<CMD>res -2<CR>",       { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Right>", "<CMD>vert res +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Left>", "<CMD>vert res -2<CR>",  { desc = "Decrease window width" })

-- Window switching
vim.keymap.set({ "n", "t", }, "<C-j>", "<CMD>winc j<CR>", { desc = "Switch to window below" })
vim.keymap.set({ "n", "t", }, "<C-k>", "<CMD>winc k<CR>", { desc = "Switch to window above" })
vim.keymap.set({ "n", "t", }, "<C-h>", "<CMD>winc h<CR>", { desc = "Switch to window left" })
vim.keymap.set({ "n", "t", }, "<C-l>", "<CMD>winc l<CR>", { desc = "Switch to window right" })

-- Insert mode movement
vim.keymap.set("i", "<A-j>", "<Down>", { noremap = true,  desc = "Move down", })
vim.keymap.set("i", "<A-k>", "<Up>", { noremap = true,    desc = "Move up", })
vim.keymap.set("i", "<A-h>", "<Left>", { noremap = true,  desc = "Move left", })
vim.keymap.set("i", "<A-l>", "<Right>", { noremap = true, desc = "Move right", })

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

-- Autopairs
-- local autopairs = {
--     { key = "{", pair = "{}" },
--     { key = "[", pair = "[]" },
--     { key = "(", pair = "()" },
--     { key = '"', pair = '""' },
--     { key = "'", pair = "''" },
-- }
-- for _, map in ipairs(autopairs) do
--     vim.keymap.set(
--         "i", map.key,
--         function() return map.pair .. "<Left>" end,
--         { expr = true, noremap = true }
--     )
-- end

-- Plugins --

vim.keymap.set("n", "<leader>j", require("treesj").toggle, { desc = "Toggle Treesitter join" })

-- Mini.nvim
vim.keymap.set("n", "<leader>/", "gcc", { remap = true,       desc = "Toggle line comment", })
vim.keymap.set("v", "<leader>/", "<ESC><CMD>norm gvgc<CR>", { desc = "Toggle block comment" })
vim.keymap.set("n", "<leader>fe", MiniFiles.open,           { desc = "File explorer" })

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>g", telescope_builtin.live_grep,   { desc = "Live grep" })
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers,    { desc = "Find buffers" })
vim.keymap.set("n", "<C-p>", telescope_builtin.git_files,       { desc = "Find Git files" })
vim.keymap.set(
    "n", "<leader>fs",
    function() telescope_builtin.grep_string { search = vim.fn.input("Grep > ") } end,
    { desc = "Find String" }
)
