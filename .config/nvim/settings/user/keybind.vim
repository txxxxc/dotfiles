inoremap jk <Esc>
nmap <CR> o<ESC>
noremap <S-h> ^
noremap <S-l> $
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :Fern . -reveal=% -drawer -toggle -width=40<CR>

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
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-p> :TmuxNavigatePrevious<cr>

nmap <Esc><Esc> :nohl<CR>


" vim-sandwich
nmap s <Nop>
xmap s <Nop>

" far.vim
" ショートカット設定
" ctrl + g で置換のショートカット
nnoremap <C-g> :Far  **/*<Left><Left><Left><Left><Left>
" ctrl + s で検索のショートカット
nnoremap <C-s> :F  **/*<Left><Left><Left><Left><Left>
