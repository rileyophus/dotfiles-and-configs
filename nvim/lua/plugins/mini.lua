local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]
local red = "#f38ba8"
vim.api.nvim_set_hl(0, "MiniStarterHeader", { fg = red })
local blue = "#89b4fa"
vim.api.nvim_set_hl(0, "MiniStarterFooter", { fg = blue, italic = true })

local starter = require("mini.starter")
local items = {
    starter.sections.recent_files(10, false),
    {
        name = "Open Lazy",
        action = function() vim.cmd("Lazy") end,
        section = "Plugins",
    },

    {
        name = "Update plugins",
        action = function() vim.cmd("Lazy update") end,
        section = "Plugins",
    },
    
    {
        name = "Sync plugins",
        action = function() vim.cmd("Lazy sync") end,
        section = "Plugins",
    },
    starter.sections.builtin_actions(),
}

return function()
    require("mini.comment").setup()
    require("mini.files").setup()
    require("mini.surround").setup()
    require("mini.statusline").setup()
    starter.setup({
        header = header,
        items = items,
        footer = table.concat({
            "Move current item          <A-j/k>",
            "Open file explorer         <leader>fe",
            "Find file                  <leader>ff",
            "Live grep                  <leader>lg",
            "Find string                <leader>fs",
            "Close this buffer          <C-c>"
        }, "\n\n"),
    })
end


