syntax on
nohl


set title
set titlestring=%t\ -\ %{expand('%:~:h')}
set titleold=

set mouse=
set nocompatible
set nobackup
set ruler
set wrap
set incsearch
set hlsearch
set wildmode=list:longest,longest
set wildmenu
set wildignore=*.class,*target*
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set hidden
set scrolloff=5

set background=dark

if !has('nvim')
    set viminfo='100,\"100,:100,h,n~/.viminfo
    set printoptions=paper:A4,collate:n,syntax:n,wrap:y
endif

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
    filetype plugin indent on

    autocmd BufRead,BufNewFile *.js,*.html,*.jsp,*.xml,*.vue set ts=2 sw=2
    autocmd BufRead,BufNewFile *.vue set ft=html
endif

highlight ExtraWhitespace ctermbg=lightred guibg=lightred
match ExtraWhitespace /\(\t\+\|\s\+$\)/

" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm\|tmux\|screen'
  " normal mode
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[5 q"
endif

let g:netrw_liststyle = 3

