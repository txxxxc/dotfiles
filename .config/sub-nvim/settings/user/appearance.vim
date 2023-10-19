syntax enable
syntax on
set termguicolors
set background=dark
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
" colorscheme nord
colorscheme nordfox
hi Visual ctermbg=0 guibg=Grey30 cterm=none ctermfg=none
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" 一旦statusbar消します
" let g:airline_theme='nord'
" let g:airline#extensions#coc#enabled = 0
" let g:airline#extensions#tabline#enabled = 0
autocmd BufRead,BufNewFile * set laststatus=0 " This will work instead
set cmdheight=0 " コマンドライン領域の高さを無くす
set laststatus=0 " ステータスラインを無効化
set noshowcmd
set noshowmode
set noruler
set noshowmode

" カラーテーマの設定
" exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
" let s:base03      = "234"
" hi Visual term=none ctermfg=235 guifg=61 gui=bold
" CursorLine     xxx ctermbg=0 guibg=Grey40
" highlight Pmenu cterm=none ctermfg=12 ctermbg=0
" highlight PmenuSel cterm=underline ctermfg=245 ctermbg=7
" highlight CocFloating cterm=none ctermfg=12 ctermbg=0
" highlight CocMenuSel cterm=underline ctermfg=11 ctermbg=0

