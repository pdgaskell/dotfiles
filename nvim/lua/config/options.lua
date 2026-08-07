vim.cmd("syntax on")
vim.cmd.filetype({ args = { "plugin", "indent", "on" } })

vim.opt.hlsearch = true
vim.opt.title = true
vim.opt.titlestring = "%t\\ -\\ %{expand('%:~:h')}"
vim.opt.titleold = ""

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.ruler = true
vim.opt.wrap = true
vim.opt.incsearch = true
vim.cmd("nohlsearch")
vim.opt.wildmode = { "list:longest", "longest" }
vim.opt.wildmenu = true
vim.opt.wildignore = { "*.class", "*target*" }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.scrolloff = 5
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.background = "light"

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.diagnostic.config({
    severity_sort = true,
    underline = true,
    update_in_insert = false,
    virtual_text = true,
    float = {
        border = "rounded",
        source = "if_many",
    },
})
