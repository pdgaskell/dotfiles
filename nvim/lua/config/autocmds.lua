local group = vim.api.nvim_create_augroup("user-autocmds", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,
    pattern = "*",
    callback = function()
        local line = vim.fn.line([[']])
        if line > 1 and line <= vim.fn.line("$") then
            vim.cmd([[normal! g']])
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = group,
    pattern = { "*.js", "*.html", "*.jsp", "*.xml", "*.vue" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
