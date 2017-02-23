call plug#begin()
" Basic UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'wincent/Command-T'

" Git integration
Plug 'tpope/vim-fugitive'

" General Programming
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Languages
Plug 'dag/vim-fish'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'bitc/vim-hdevtools'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
call plug#end()

set background=dark
colorscheme solarized

let g:airline_powerline_fonts = 1
