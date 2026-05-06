--- unused file


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
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
        "chomosuke/typst-preview.nvim",
        lazy = false,
        branch = "master",
        opts = { debug = true },
    },

    {
        "echasnovski/mini.nvim", version = false,
        config = function() require("plugins.mini")() end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = { indent = { char = "│" } },
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("telescope").setup {} end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup {
                auto_install = true,
                highlight = { enable = true },
            }
        end,
    },

    {
        "thgrass/csvcols.nvim",
        ft = { "csv", "tsv", },
        config = function()
            local mocha = require("catppuccin.palettes").get_palette("mocha")
            require("csvcols").setup {
                mode = "fg",
                use_winbar_controls = false,
                colors = {
                    mocha["red"], mocha["maroon"], mocha["peach"], mocha["yellow"],
                    mocha["green"], mocha["teal"], mocha["sky"], mocha["sapphire"],
                    mocha["blue"], mocha["lavender"], "#c0b0fa", mocha["mauve"],
                    "#df99c8",
                },
            }
        end,
    },

    {
        "Wansmer/treesj",
        cmd = { "TSJToggle", "TSJSplit", "TSJJoin", },
        opts = { use_default_keymaps = false },
    },
}

