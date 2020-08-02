"" netrw
"" \e

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

function! ToggleVExplorer()
    if !exists("t:netrw_bufnr")
        exec '1wincmd w'
        25Vexplore
        let t:netrw_bufnr = bufnr("%")
        return
    endif
    let win = bufwinnr(t:netrw_bufnr)
    if win != -1
        let cur = winnr()
        exe win . 'wincmd w'
        close
        exe 'wincmd p'
    endif
    unlet t:netrw_bufnr
endfunction
map <silent> <leader>e :call ToggleVExplorer()<cr><c-w>p

