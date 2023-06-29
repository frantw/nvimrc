" Cond helper
function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" plugins
call plug#begin()
" use normal easymotion when in VIM mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use VSCode easymotion when in VSCode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
call plug#end()

set clipboard=unnamedplus
autocmd TextYankPost * if v:event.operator is 'y' | call VSCodeNotify('clipboard.copy') | endif

let g:highlightedyank_highlight_duration = 300
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" move line up/down
nnoremap <S-DOWN> :m .+1<CR>==
nnoremap <S-UP> :m .-2<CR>==
inoremap <S-DOWN> <Esc>:m .+1<CR>==gi
inoremap <S-UP> <Esc>:m .-2<CR>==gi
vnoremap <S-DOWN> :m '>+1<CR>gv=gv
vnoremap <S-UP> :m '<-2<CR>gv=gv

nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
inoremap J <Esc>:m .+1<CR>==gi
inoremap K <Esc>:m .-2<CR>==gi
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" cursor movement
nmap H ^
vmap H ^
nmap L $
vmap L $
nmap z[ [{
vmap z[ [{
nmap z] ]}
vmap z] ]}

" selection
nmap za 0V/{<Enter>%
nmap zs [{V]}
nmap z/ va`
nmap z' va'
nmap z" va"

"mode switch
imap jj <Esc>
vmap jj <Esc>

" vscode notify
vnoremap <D-.> <cmd>call VSCodeNotifyVisual('noop', 1)<cr><Esc><cmd>call VSCodeNotify('editor.action.quickFix')<cr>

" plugin settings

" ----------
" easymotion
" ----------

" change the color of easymotion
hi EasyMotionTarget guifg=black guibg=white
hi EasyMotionTarget2First guifg=black guibg=white
hi EasyMotionTarget2Second guifg=black guibg=white

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

nmap <Space> <Plug>(easymotion-s)
nmap <Leader>s <Plug>(easymotion-s)
nmap <Leader>x <Plug>(easymotion-s2)

vmap <Space> <Plug>(easymotion-s)
vmap <Leader>s <Plug>(easymotion-s)
vmap <Leader>x <Plug>(easymotion-s2)

" Move to line
nmap <Leader>l <Plug>(easymotion-overwin-line)
vmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)
vmap <Leader>w <Plug>(easymotion-overwin-w)

" ----------
" surround
" ----------

