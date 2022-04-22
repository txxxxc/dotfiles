let g:python_host_prog = system('echo -n $(which python2)')
let g:python3_host_prog = system('echo -n $(which python3)')
let g:jedi#force_py_version = 3

let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden=1

execute 'set runtimepath+=~/.config/nvim'

" lambdalisue/glyph-paletter.vim
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
autocmd BufNewFile ~/projects/me/AtCoder/**/*.cpp :0r ~/.config/nvim/templates/atcoder.cpp
autocmd BufNewFile ~/projects/github.com/Tomoya113/aoj/*/** :0r ~/.config/nvim/templates/atcoder.cpp

au FileType * set fo-=c fo-=r fo-=o
set fo-=c fo-=r fo-=o
au BufEnter * set fo-=c fo-=r fo-=o

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

" swpファイル出力無効
set noswapfile

" シンタックスハイライト
syntax on
syntax enable

" hi Visual guifg=Yellow guibg=Red gui=none
" 背景
" カラーテーマの設定
let g:solarized_termcolors=16
let g:solarized_termtrans = 1
set background=dark
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

" 改行時の自動コメントアウトを無効化する 
au FileType * set fo-=c fo-=r fo-=o
set fo-=c fo-=r fo-=o

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

" far.vim
let g:far#enable_undo=2
" farの検索をrgにする
let g:far#source="rgnvim"
let g:far#window_layout="tab"
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

