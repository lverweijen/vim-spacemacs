# spacemacs.vim #

Spacemacs keybindings and settings ported to Vim.  Also see the [recommended plugins](#recommended-plugins) which make Vim feel even more like Spacemacs.

Please open an issue or create a pull request if there is a Spacemacs keybinding or setting that you use which is not included.

## Installation ##

Using Vundle:

```
Plugin 'jimmay5469/vim-spacemacs'
```

### Leader Key ###
By default this plugin uses whatever leader key you have set up.  If you like Spacemacs and you aren't already using `<SPACE>` as your leader key, then you can set it in your `.vimrc` using the following:
```
let mapleader = "\<SPACE>"
let maplocalleader = ","
```

## Recommended Plugins ##

```
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" A spacemacs-like menu displaying keybindings (highly recommended)
Plugin 'hecal3/vim-leader-guide'
call leaderGuide#register_prefix_descriptions("<Space>", "g:spacemacs_map")
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" One of these for fuzzy files / buffers
" Plugin 'kien/ctrlp.vim'
" Plugin 'Shougo/unite.vim'

" Other plugins
Plugin 'easymotion/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'szw/vim-maximizer'
Plugin 'tpope/vim-commentary'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Layers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"git layer
Plugin 'tpope/vim-fugitive'

"javascript layer
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'

"version-control layer
Plugin 'airblade/vim-gitgutter'
```

## Footnotes ##

![I don't always use Vim, but when I do I use Spacemacs key bindings](http://i.imgur.com/BlgbKnM.jpg)
