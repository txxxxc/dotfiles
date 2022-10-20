" <Leader>をSpaceに設定
let mapleader = "\<Space>"

" CR = エンターキー
" fzf config
nnoremap <leader>f :<C-u>CocCommand fzf-preview.ProjectFiles <CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <leader>h :History<CR>
nnoremap <silent><leader>q :QuickRun<CR> 
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

nnoremap <Leader>g :<C-u>FzfPreviewProjectGrep --add-fzf-arg=--nth=3<Space>

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" nnoremap <silent><nowait> <leader>a  :CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>dl  :CocList diagnostics<cr>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Manage extensions.
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


nnoremap <silent> <leader>s :<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>
nnoremap <silent><nowait> <leader>cr  :<C-u>CocRestart<CR>
autocmd FileType go nmap <leader>gt :GoTests<CR>

