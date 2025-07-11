vim.g.mapleader = " "

vim.keymap.set(
    "n",
    "<leader>pv",
    vim.cmd.Ex,
    { desc = "File Explorer" }
)
vim.keymap.set(
    "n",
    "<leader>m",
    "<CMD>TSJToggle<CR>",
    { desc = "Toggle Treesitter Join" }
)

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set(
    "n",
    "<leader>ff",
    function() telescope_builtin.find_files() end,
    { desc = "Find Files" }
)
vim.keymap.set(
    "n",
    "<C-p>",
    function() telescope_builtin.git_files() end,
    { desc = "Find Git Files" }
)
vim.keymap.set(
    "n",
    "<leader>fs",
    function() telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
    { desc = "Find String" }
)
