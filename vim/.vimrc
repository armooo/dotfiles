set nocompatible

if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

" start vundle junk
filetype off
set rtp+=~/.vim/vendored/vundle
call vundle#begin()


Plugin 'gmarik/vundle'

Plugin 'vim-scripts/desert.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'sjl/gundo.vim'
Plugin 'saltstack/salt-vim'
Plugin 'dag/vim-fish'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rodjek/vim-puppet'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'lepture/vim-jinja'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on
" end vundle junk

colorscheme desert

set ai
set incsearch
syntax on
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set scrolloff=5

set modeline modeline

set backspace=indent,eol,start
set ruler
set laststatus=1
set wildmenu

" trailing whitespace is bad
highlight WhiteSpaceEOL ctermbg=red
autocmd InsertEnter * match WhiteSpaceEOL /\s\+\%#\@<!$/
autocmd InsertLeave * match WhitespaceEOL /\s\+$/

autocmd FileType make set noexpandtab
autocmd BufRead,BufNewFile *.bzl set filetype=python
autocmd BufRead,BufNewFile BUILD set filetype=python
autocmd BufRead,BufNewFile *.pyst set filetype=python


" leader stuff
nnoremap <leader>p :set paste!<cr>
nnoremap <leader>s :set spell!<cr>
nnoremap <leader>u :GundoToggle<CR>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" esc is sad
imap jj <Esc>

" flake8
autocmd BufWritePost *.py call Flake8()

au BufWrite * :Autoformat
