call plug#begin('~/.config/nvim/plugged')
" Basic UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'
Plug 'wincent/Command-T'

" Git integration
Plug 'tpope/vim-fugitive'

" General Programming
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Languages
Plug 'dag/vim-fish'
Plug 'FStarLang/VimFStar', {'for': 'fstar'}
Plug 'rust-lang/rust.vim'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'bitc/vim-hdevtools'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
call plug#end()

" basically always want these
set tabstop=2 "ts
set shiftwidth=2 "sw
set expandtab

if has("termguicolors")
  set termguicolors
endif

syntax enable
colorscheme tender
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tender'

let g:syntastic_rust_checkers = ['cargo']
