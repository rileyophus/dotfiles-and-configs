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
    { -- Catppuccin
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    { -- Indent Blankline
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
        },
    },

    { -- Telescope
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("telescope").setup({}) end,
    },

    { -- TreeSJ
        "Wansmer/treesj",
        cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
        opts = { use_default_keymaps = false },
    },
})

