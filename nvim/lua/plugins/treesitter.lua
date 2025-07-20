local autocmd_callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype

    local ok, parser = pcall(require("nvim-treesitter.parsers").get_parser, bufnr, ft)
    if ok and parser then
        vim.api.nvim_buf_set_option(bufnr, "foldmethod", "expr")
        vim.api.nvim_buf_set_option(bufnr, "foldexpr", "nvim_treesitter#foldexpr()")
    end
end

return function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldenable = false

    vim.api.nvim_create_autocmd("BufEnter", { callback = autocmd_callback })
end
