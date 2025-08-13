local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
        },
    },

    {
        "echasnovski/mini.nvim", version = false,
        config = function() require("plugins.mini")() end,
    },

    { "lambdalisue/suda.vim" },

    {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("telescope").setup({}) end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                auto_install = true,
                highlight = { enable = true },
            }
        end,
    },

    {
        "Wansmer/treesj",
        cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
        opts = { use_default_keymaps = false },
    },
})

