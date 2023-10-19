"   " open fern when no args given
"   if argc() == 1 && !exists('s:std_in')
"     Fern .
"   endif
" endfunction

" 起動時にFernを開く
" augroup FernSetup
"   autocmd! *
"   autocmd VimEnter * ++nested call s:vimenter_fern()
" augroup END
" autocmd BufRead COMMIT_EDITMSG autocmd! FernSetup
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
set shell=/bin/zsh
let $SHELL = "/bin/zsh"

" entirely disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

let g:python_host_prog = system('echo -n $(which python2)')
let g:python3_host_prog = system('echo -n $(which python3)')
let g:jedi#force_py_version = 3
let g:fzf_prefer_tmux = 1
let g:fzf_layout = { 'down': '~40%' }
let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden=1
let g:preview_markdown_parser='glow'

execute 'set runtimepath+=~/.config/nvim'
function! s:init_fern() abort
  nnoremap <buffer> <C-h> <C-w>h
  nnoremap <buffer> <C-l> <C-w>l
endfunction
" lambdalisue/glyph-paletter.vim
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
autocmd BufNewFile ~/projects/github.com/txxxxc/competitive-programming/**/*.cpp :0r ~/.config/nvim/templates/atcoder.cpp
autocmd BufNewFile ~/projects/github.com/Tomoya113/aoj/*/** :0r ~/.config/nvim/templates/atcoder.cpp
autocmd BufNewFile,BufRead *.golden set filetype=json
" for fish shell
" autocmd FileType fish colorscheme fish-default

au FileType * set fo-=c fo-=r fo-=o
set fo-=c fo-=r fo-=o
au BufEnter * set fo-=c fo-=r fo-=o

set number "行番号
set ignorecase " 検索パターンにおいて大文字と小文字を区別しない。
set smartcase " 検索パターンが大文字を含んでいたらオプション 'ignorecase' を上書きする。
set tabstop=2
set shiftwidth=2 " 自動インデントでずれる幅
set cursorline " 現在の行を強調表示
set showmatch " 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする。
set smartindent " smartindentの設定
set encoding=utf-8 " エンコードをUTF-8に設定
language en_US.UTF-8 " 言語設定をUSに
set shell=/bin/zsh " shellをzshに設定
set noswapfile " swpファイル出力無効
set clipboard+=unnamed
set relativenumber
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set hlsearch " 前回の検索パターンが存在するとき、それにマッチするテキストを全て強調表示する。
au FileType * set fo-=c fo-=r fo-=o " 改行時の自動コメントアウトを無効化する 
set fo-=c fo-=r fo-=o

" coc-server
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


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
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
set ttyfast
" set redrawtime=10000
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


"" treesitter

" lua <<EOF
" require('toggleterm').setup {
" 	shell = 'fish',
" 	direction = 'tab',
" 	shade_terminals = true
" }
"
" require('nvim-treesitter.configs').setup {
"   ensure_installed = {
" 		"cpp",
" 		"css",
" 		"dockerfile",
" 		"fish",
" 		"gitignore",
" 		"go",
" 		"html",
" 		"http",
" 		"json",
" 		"markdown",
" 		"markdown_inline",
"     "python",
"     "ruby",
"     "swift",
"     "toml",
"     "tsx",
"     "typescript",
"     "vue",
"     "vim",
"     "yaml",
"   },
"   highlight = {
"     enable = true,
"   },
" 	auto_install = true,
" }
" EOF
"