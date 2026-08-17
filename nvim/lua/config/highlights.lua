 -- Highlights trailing whitespace.
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = "*",
    callback = function()
        vim.fn.matchadd('Special', [[\s\+$]])
    end,
})

-- Replaces trailing spaces with dots
vim.opt.list = true
vim.opt.listchars:append({ trail = '·' })
