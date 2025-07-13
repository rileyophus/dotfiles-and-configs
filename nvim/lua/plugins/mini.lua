local header = table.concat({
    "                                                    ",
    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                    ",
}, "\n")

local starter = require("mini.starter")
local items = {
    starter.sections.recent_files(5, false),

    {
        name = "Open Lazy",
        action = function() vim.cmd("Lazy") end,
        section = "Lazy.nvim",
    },

    {
        name = "Install plugins",
        action = function() vim.cmd("Lazy install") end,
        section = "Lazy.nvim",
    },

    {
        name = "Update plugins",
        action = function() vim.cmd("Lazy update") end,
        section = "Lazy.nvim",
    },
    
    {
        name = "Sync plugins",
        action = function() vim.cmd("Lazy sync") end,
        section = "Lazy.nvim",
    },
    starter.sections.builtin_actions(),
}

return function()
    require("mini.comment").setup()
    require("mini.files").setup()
    starter.setup({
        header = header,
        items = items,
    })
end


