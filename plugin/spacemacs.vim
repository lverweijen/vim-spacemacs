" Vim plugin for bringing spacemacs keybindings back to vim

if exists("g:loaded_spacemacs")
    finish
endif
let g:loaded_spacemacs=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Optionally integrate with vim-leader-guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:spacemacs_map')
  let g:spacemacs_map = {}
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! spacemacs#toggleExplorerAtRoot()
  if exists(':ProjectRootExe')
    exe "ProjectRootExe NERDTreeToggle"
  elseif exists("NERDTreeToggle")
    exe "NERDTreeToggle"
  else
    exe "Explore"
  endif
endfunction

function! spacemacs#buffers()
  if exists('g:loaded_unite')
    exe "Unite -no-split -start-insert buffer"
  elseif exists('g:loaded_ctrlp')
    exe "CtrlPBuffer"
  else
    exe "buffers"
  endif
endfunction

function! spacemacs#files()
  if exists('g:loaded_unite')
    exe "Unite -no-split -start-insert file"
  elseif exists('g:loaded_ctrlp')
    exe "CtrlPCurFile"
  else
    exe "browse e."
  endif
endfunction

function! spacemacs#recent()
  if exists('g:loaded_unite')
    exe "Unite -no-split -start-insert file_mru"
  elseif exists('g:loaded_ctrlp')
    exe "CtrlPMRU"
  else
    exe "oldfiles"
  endif
endfunction

function! spacemacs#toggleWrap()
  if &formatoptions =~ 't'
    set formatoptions-='t'
  else
    set formatoptions+='t'
  endif
endfunction

function! spacemacs#toggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
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
let g:spacemacs_map.b = {'name': '+buffers'}
nnoremap <LEADER>bd :bdelete<CR>
nnoremap <LEADER>bn :bnext<CR>
nnoremap <LEADER>bp :bprevious<CR>
nnoremap <LEADER>bR :e<CR>
nnoremap <LEADER>bb :call spacemacs#buffers()<CR>

" Files
let g:spacemacs_map.f = {'name': '+files'}
nnoremap <LEADER><TAB> <C-^>
nnoremap <LEADER>fD :Remove<CR>
nnoremap <LEADER>fE :SudoEdit 
nnoremap <LEADER>fL :Locate 
nnoremap <LEADER>fr :call spacemacs#recent()<CR>
nnoremap <LEADER>fR :Rename 
nnoremap <LEADER>fs :write<CR>
nnoremap <LEADER>fS :wa<CR>
nnoremap <LEADER>ft :NERDTreeToggle<CR>
nnoremap <LEADER>ff :call spacemacs#files()<CR>

" Vim config
let g:spacemacs_map.f.e = {'name': '+config'}
nnoremap <LEADER>fed :e $MYVIMRC<CR>
nnoremap <LEADER>feR :source $MYVIMRC<CR>
nnoremap <LEADER>fev :version<CR>

" Fugitive
let g:spacemacs_map.g = {'name': '+version_control'}
nnoremap <LEADER>gb :Gblame<CR>
nnoremap <LEADER>gc :GCommit<CR>
nnoremap <LEADER>gC :Git checkout<CR>
nnoremap <LEADER>gd :Gdiff<CR>
nnoremap <LEADER>gD :Gdiff HEAD<CR>
nnoremap <LEADER>gd :Gdiff<CR>
nnoremap <LEADER>gf :Gfetch<CR>
nnoremap <LEADER>gF :Gpull<CR>
nnoremap <LEADER>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <LEADER>gi :Git init<CR>
nnoremap <LEADER>gI :Gedit .gitignore<CR>
nnoremap <LEADER>gP :GPush<CR>
nnoremap <LEADER>gs :Gstatus<CR>
nnoremap <LEADER>gS :Gwrite<CR>

" Insertion
let g:spacemacs_map.i = {'name': '+version_control'}
nnoremap <LEADER>ij o<ESC>k
nnoremap <LEADER>ik O<ESC>j

" Project
let g:spacemacs_map.p = {'name': '+projects'}
nnoremap <LEADER>pf :CtrlPRoot<CR>
nnoremap <LEADER>pt :call spacemacs#toggleExplorerAtRoot()<CR>

" Quit
let g:spacemacs_map.q = {'name': '+quit'}
nnoremap <LEADER>qq :quitall<CR>
nnoremap <LEADER>qQ :quitall!<CR>

" Searching
let g:spacemacs_map.s = {'name': '+search'}
nnoremap <LEADER>sa :Unite -no-split -start-insert ag<CR>
nnoremap <LEADER>sg :Unite -no-split -start-insert grep<CR>
nnoremap <LEADER>sk :Unite -no-split -start-insert ack<CR>
nnoremap <LEADER>ss :Unite -no-split -start-insert line<CR>
nnoremap <LEADER>sp :Ag<SPACE>

" Toggles
let g:spacemacs_map.t = {'name': '+toggles'}
nnoremap <LEADER>tF :call spacemacs#toggleWrap()<CR>
nnoremap <LEADER>thh :set invcursorline<CR>
nnoremap <LEADER>thc :set invcursorcolumn<CR>
nnoremap <LEADER>ts :call spacemacs#toggleSyntax()<CR>
nnoremap <LEADER>tS :set invspell<CR>
nnoremap <LEADER>tl :set invwrap<CR>
nnoremap <LEADER>tn :set invnumber<CR>
nnoremap <LEADER>tr :set set invrelativenumber<CR>

" Window management
let g:spacemacs_map.w = {'name': '+windows'}
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

" Text
let g:spacemacs_map.x = {'name': '+text'}
nnoremap <LEADER>xa :Align

" vim:fdm=marker:tw=80: ts=2: sw=2
