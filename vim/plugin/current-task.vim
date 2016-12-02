" vim: ts=4:sw=4:et
command! -nargs=0 CurrentTask call CurrentTask()
function! CurrentTask()
    AirlineTheme simple
    set noruler
    set linebreak
    set scrolloff=0
    highlight EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

    " mark current task done
    nmap <Leader>d I✓ <Esc>
    " re-align to current date
    nmap <Leader>c G?\v\d{4}-\d{2}-\d{2}<CR>zt:nohlsearch<CR>i<Esc>
    " insert today's date
    nmap <Leader>t :read !date "+\%Y-\%m-\%d"<CR>i<Esc>

    normal! G
endfunction
