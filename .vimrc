set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" ================ Map keys ====================
" Show last files open/edit
:map <F2> :MRU<CR>
:map sd i
:map se s

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on
set background=dark
colorscheme solarized

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
      set undofile
      endif


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plug 'pangloss/vim-javascript'

"The NERDTree is a file system explorer for the Vim editor
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Status/tab visual and themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntastic is a syntax checking plugin for Vim
Plug 'scrooloose/syntastic'

" storage last files opens and edit
Plug 'vim-scripts/mru.vim'

" Thema vim
Plug 'altercation/vim-colors-solarized'


call plug#end()

syntax enable

" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

" Auto Open NERDTree
autocmd vimenter * NERDTree

" Show hidden files
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" Default config to syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Default linter 
let g:syntastic_javascript_checkers = ['eslint']

"default theme
let g:airline_theme='angr'
