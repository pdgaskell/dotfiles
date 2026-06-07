vim.cmd("syntax on")

vim.opt.hlsearch = false
vim.opt.title = true
vim.opt.titlestring = "%t\\ -\\ %{expand('%:~:h')}"
vim.opt.titleold = ""

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.compatible = false
vim.opt.backup = false
vim.opt.ruler = true
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.wildmode = { "list:longest", "longest" }
vim.opt.wildmenu = true
vim.opt.wildignore = { "*.class", "*target*" }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.hidden = true
vim.opt.scrolloff = 5

vim.opt.background = "light"

if vim.fn.has("nvim") == 0 then
    vim.opt.viminfo = [['100,\"100,:100,h,n~/.viminfo]]
    vim.opt.printoptions = "paper:A4,collate:n,syntax:n,wrap:y"
end

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local line = vim.fn.line([[']])
        if line > 1 and line <= vim.fn.line("$") then
            vim.cmd([[normal! g']])
        end
    end,
})

vim.cmd("filetype plugin indent on")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.js", "*.html", "*.jsp", "*.xml", "*.vue" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.vue",
    callback = function()
        vim.bo.filetype = "html"
    end,
})

vim.cmd([[highlight ExtraWhitespace ctermbg=lightred guibg=lightred]])
vim.fn.matchadd("ExtraWhitespace", [[\(\t\+\|\s\+$\)]])

-- Cursor in terminal
-- https://vim.fandom.com/wiki/Configuring_the_cursor
-- 1 or 0 -> blinking block
-- 2 -> solid block
-- 3 -> blinking underscore
-- 4 -> solid underscore
-- 5 -> blinking vertical bar
-- 6 -> solid vertical bar

if vim.o.term:match("^xterm") or vim.o.term:match("tmux") or vim.o.term:match("screen") then
    -- normal mode
    vim.opt.t_EI:append("\\27[0 q")

    -- insert mode
    vim.opt.t_SI:append("\\27[5 q")
end

vim.g.netrw_liststyle = 3
