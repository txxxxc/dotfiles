inoremap jk <Esc>
nmap <CR> o<ESC>
inoremap <C-l> <C-O>
inoremap <C-h> <C-O>
" CTRL-G u: undoできない編集らしい
inoremap <C-j> <C-g>U<Down>
inoremap <C-k> <C-g>U<Up>
noremap <S-h> ^
noremap <S-l> $

nnoremap <silent> cp :!echo %:p \| pbcopy<CR>
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
" quickfix
" 前へ
nnoremap [q :cprevious<CR>
" 次へ
nnoremap ]q :cnext<CR>
" 最初へ
nnoremap [Q :<C-u>cfirst<CR>
" 最後へ
nnoremap ]Q :<C-u>clast<CR>

" Use ctrl-hjkl to select the active split
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-p> :TmuxNavigatePrevious<cr>

nmap <Esc><Esc> :nohl<CR>

" coc
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" vim-sandwich
nmap s <Nop>
xmap s <Nop>

" far.vim
" ショートカット設定
" ctrl + g で置換のショートカット
nnoremap <C-g> :Far  **/*<Left><Left><Left><Left><Left>
" ctrl + s で検索のショートカット
nnoremap <C-s> :F  **/*<Left><Left><Left><Left><Left>

" terminalモード
tnoremap <Esc> <C-\><C-n>

