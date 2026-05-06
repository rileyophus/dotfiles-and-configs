local function github_link(repo_name)
    return "https://github.com/" .. repo_name .. ".git"
end


vim.pack.add { {
    src = github_link "catppuccin/nvim",
    name = "catppuccin",
} }
require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin-mocha")


vim.pack.add { {
    src = github_link "chomosuke/typst-preview.nvim",
    name = "typst-preview",
    version = "master",
} }
require("typst-preview").setup { debug = true }


vim.pack.add { {
    src = github_link "echasnovski/mini.nvim",
    name = "mini",
} }
require("plugins.mini")()


vim.pack.add { {
    src = github_link "lukas-reineke/indent-blankline.nvim",
    name = "ibl",
} }
require("ibl").setup { indent = { char = "│" } }


vim.pack.add { github_link "nvim-lua/plenary.nvim" } -- dependency
vim.pack.add { {
    src = github_link "nvim-telescope/telescope.nvim",
    name = "telescope",
} }
require("telescope").setup()


vim.pack.add { {
    src = github_link "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
} }
require("nvim-treesitter").setup()
vim.api.nvim_create_augroup("start_treesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "start_treesitter",
    pattern = { "c", "cpp", "java", "typst", "zig", },
    callback = function() vim.treesitter.start() end,
})


vim.pack.add { {
    src = github_link "Wansmer/treesj",
    name = "treesj",
} }
require("treesj").setup { use_default_keymaps = false }
