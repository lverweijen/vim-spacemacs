" Vim plugin for bringing spacemacs keybindings back to vim

if exists("g:loaded_spacemacs")
    finish
endif
let g:loaded_spacemacs=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Read settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:spacemacs_fuzzy')
    let g:spacemacs_fuzzy = ''
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! spacemacs#toggleExplorerAtRoot()
  if exists(':ProjectRootExe')
    exe "ProjectRootExe NERDTreeToggle"
  else
    exe "NERDTreeToggle"
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alphabetical and avoid <SILENT> for now.

" Comments
nnoremap <LEADER>;; :Commentary<CR>
vnoremap <LEADER>; :Commentary<CR>

" Buffers
nnoremap <LEADER>bd :bdelete<CR>
nnoremap <LEADER>bn :bnext<CR>
nnoremap <LEADER>bp :bprevious<CR>
nnoremap <LEADER>bR :e<CR>
if g:spacemacs_fuzzy == 'unite'
    nnoremap <LEADER>bb :Unite -no-split -start-insert buffer<CR>
elseif g:spacemacs_fuzzy == 'ctrlp'
    nnoremap <LEADER>bb :CtrlPBuffer<CR>
else
    nnoremap <LEADER>bb :buffers<CR>
endif

" Files
nnoremap <LEADER><TAB> <C-^>
nnoremap <LEADER>fed :e $MYVIMRC<CR>
nnoremap <LEADER>feR :source $MYVIMRC<CR>
nnoremap <LEADER>fs :w<CR>
nnoremap <LEADER>fS :wa<CR>
nnoremap <LEADER>ft :NERDTreeToggle<CR>
if g:spacemacs_fuzzy == 'unite'
    nnoremap <LEADER>ff :Unite -no-split -start-insert file<CR>
    nnoremap <LEADER>fF :Unite -no-split -start-insert file_rec/neovim<CR>
    nnoremap <LEADER>fr :Unite -no-split -start-insert file_mru<CR>
elseif g:spacemacs_fuzzy == 'ctrlp'
    nnoremap <LEADER>ff :CtrlPCurFile<CR>
    nnoremap <LEADER>fr :CtrlPMRU<CR>
else
    nnoremap <LEADER>ff :browse e.<CR>
    nnoremap <LEADER>fr :oldfiles<CR>
endif

" Fugitive
nnoremap <LEADER>gs :Gstatus<CR>
nnoremap <LEADER>gb :Gblame<CR>
nnoremap <LEADER>gd :Gdiff<CR>
nnoremap <LEADER>gI :Gedit .gitignore<CR>
nnoremap <LEADER>gc :GCommit<CR>
nnoremap <LEADER>gC :Git checkout<CR>
nnoremap <LEADER>gd :Gdiff<CR>
nnoremap <LEADER>gD :Gdiff HEAD<CR>
nnoremap <LEADER>gf :Gfetch<CR>
nnoremap <LEADER>gF :Gpull<CR>
nnoremap <LEADER>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <LEADER>gP :GPush<CR>
nnoremap <LEADER>gS :Gwrite<CR>

" Easymotion
map <LEADER>jj <Plug>(easymotion-bd-f)
map <LEADER>jw <Plug>(easymotion-bd-w)
map <LEADER>jl <Plug>(easymotion-bd-line)
map <LEADER>y <Plug>(easymotion-bd-line)
nmap <LEADER>jj <Plug>(easymotion-overwin-f)
nmap <LEADER>jw <Plug>(easymotion-overwin-w)
nmap <LEADER>jl <Plug>(easymotion-overwin-line)
noremap <LEADER>ju <C-o>

" Project
nnoremap <LEADER>pf :CtrlPRoot<CR>
nnoremap <LEADER>pt :call spacemacs#toggleExplorerAtRoot()<CR>
nnoremap <LEADER>qq :qa<CR>

" Searching
nnoremap <LEADER>sa :Unite -no-split -start-insert ag<CR>
nnoremap <LEADER>sg :Unite -no-split -start-insert grep<CR>
nnoremap <LEADER>sk :Unite -no-split -start-insert ack<CR>
nnoremap <LEADER>ss :Unite -no-split -start-insert line<CR>
nnoremap <LEADER>sp :Ag<SPACE>

" Toggles
nnoremap <LEADER>tF :if &fo =~ 't' <Bar>
  \   set fo-='t'
  \ else <Bar>
  \   set fo+='t'
  \ endif <CR>
nnoremap <LEADER>thh :set invcursorline<CR>
nnoremap <LEADER>thc :set invcursorcolumn<CR>
nnoremap <LEADER>ts :if exists("g:syntax_on") <Bar>
  \   syntax off <Bar>
  \ else <Bar>
  \   syntax enable <Bar>
  \ endif <CR>
nnoremap <LEADER>tS :set invspell<CR>
nnoremap <LEADER>tl :set invwrap<CR>
nnoremap <LEADER>tn :set invnumber<CR>
nnoremap <LEADER>tr :set set invrelativenumber<CR>

" Window management
nnoremap <LEADER>w- :sp<CR>
nnoremap <LEADER>w/ :vsp<CR>
nnoremap <LEADER>w= <C-W>=
nnoremap <LEADER>wc :quit<CR>
nnoremap <LEADER>wh <C-W>h
nnoremap <LEADER>wj <C-W>j
nnoremap <LEADER>wk <C-W>k
nnoremap <LEADER>wl <C-W>l
nnoremap <LEADER>ws <C-W>s
nnoremap <LEADER>wv <C-W>v
nnoremap <LEADER>wm :MaximizerToggle<CR>
nnoremap <LEADER>ww <C-W><C-W>

" vim:fdm=marker:tw=80: ts=2: sw=2
