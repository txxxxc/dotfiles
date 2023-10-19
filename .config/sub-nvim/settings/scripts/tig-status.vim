let nvrcmd      = "nvr --remote-wait -cc 'call NvrBeforeCmd()' -c 'call NvrAfterCmd()'"
let $VISUAL     = nvrcmd
let $GIT_EDITOR = nvrcmd

nnoremap <silent><Leader>t :<C-u>call Tig_status()<CR>

function! Tig_status() abort
    call s:open_term('tig status')
endfunction

function! s:open_term(cmd) abort
    let split = s:split_type()

    call execute(printf('%s term://%s', split, a:cmd))

    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nobuflisted
endfunction

function! s:split_type() abort
    " NOTE: my cell ratio: width:height == 1:2.1
    let width = winwidth(win_getid())
    let height = winheight(win_getid()) * 2.1

    if height > width
        return 'split'
    else
        return 'vsplit'
    endif
endfunction
