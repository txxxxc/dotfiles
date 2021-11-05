" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

" 行番号表示
set number

" 現在の行を強調表示
set cursorline

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

" 背景
set background=dark

" カラーテーマの設定
colorscheme onehalfdark 

let g:airline_theme='onehalfdark'

" ステータスラインの有効化
set laststatus=2

set clipboard+=unnamed

set relativenumber

"　検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

inoremap jk <Esc>
nmap <CR> o<ESC>
noremap <S-h> ^
noremap <S-l> $
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"fzf settings
set rtp+=/usr/local/opt/fzf
map ; :FZF .<CR>
