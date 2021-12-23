set number


" 検索パターンにおいて大文字と小文字を区別しない。
set ignorecase

" 検索パターンが大文字を含んでいたらオプション 'ignorecase' を上書きする。
set smartcase

set tabstop=2

" 自動インデントでずれる幅
set shiftwidth=2

" 現在の行を強調表示
set cursorline

" 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする。
set showmatch

" smartindentの設定
set smartindent

" エンコードをUTF-8に設定
set encoding=utf-8

" 言語設定をUSに
language en_US.UTF-8

" shellをzshに設定
set shell=/bin/zsh

" シンタックスハイライト
syntax on
syntax enable

" hi Visual guifg=Yellow guibg=Red gui=none
" 背景
" カラーテーマの設定
let g:solarized_termcolors=16
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized 
let g:airline_theme='solarized'
" exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
"let s:base03      = "234"
"hi Visual term=none ctermfg=235 guifg=61 gui=bold
hi Visual ctermbg=0 guibg=Grey40 cterm=none ctermfg=none
" Visual         xxx cterm=reverse ctermfg=10 ctermbg=0 guibg=Grey40
"CursorLine     xxx ctermbg=0 guibg=Grey40
" ステータスラインの有効化
set laststatus=2

set clipboard+=unnamed

set relativenumber

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 前回の検索パターンが存在するとき、それにマッチするテキストを全て強調表示する。
set hlsearch

" coc-server
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

