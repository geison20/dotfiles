set nocompatible

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plug 'pangloss/vim-javascript'

" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

"The NERDTree is a file system explorer for the Vim editor
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto Open NERDTree
autocmd vimenter * NERDTree

" Show hidden files
let NERDTreeShowHidden=1

" Status/tab visual and themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='angr'

" Syntastic is a syntax checking plugin for Vim

Plug 'scrooloose/syntastic'

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

call plug#end()
