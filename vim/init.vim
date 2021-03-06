:let mapleader = ","

call plug#begin('~/.config/nvim/plugged')
" Basics
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" Basic UI theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" a few color schemes
" Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
" Plug 'jacoborus/tender.vim'

" General Programming
Plug 'tpope/vim-fugitive' " git
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Languages
Plug 'dag/vim-fish'
Plug 'FStarLang/VimFStar', {'for': 'fstar'}
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim' " HTML
Plug 'whonore/Coqtail'
Plug 'let-def/vimbufsync' " dependency for Coqtail
Plug 'wlangstroth/vim-racket'
Plug 'vim-scripts/scribble.vim'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Haskell
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'bitc/vim-hdevtools'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
call plug#end()

" basically always want these
set tabstop=2 "ts
set shiftwidth=2 "sw
set expandtab

if has("termguicolors")
  set termguicolors
endif

syntax enable
set background=dark
colorscheme one
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_go_checkers = ['go', 'gofmt']
let g:go_fmt_command = "goimports"
let g:go_info_mode = "gopls"

" Coqtail mappings
map <F3> <Plug>CoqNext
imap <F3> <Plug>CoqNext
map <F4> <Plug>CoqToLine
imap <F4> <Plug>CoqToLine
map <F2> <Plug>CoqUndo
imap <F2> <Plug>CoqUndo
