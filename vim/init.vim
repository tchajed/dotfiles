call plug#begin()
" Basic UI
Plug 'tpope/vim-sensible'
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
call plug#end()

set background=dark
colorscheme solarized

let g:airline_powerline_fonts = 1
