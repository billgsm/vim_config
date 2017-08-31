set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'elzr/vim-json'
Plugin 'lumiliet/vim-twig'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
" Adds icons based on the file type
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plugin 'ryanoasis/vim-devicons'
" Git inside your file
Plugin 'airblade/vim-gitgutter'
" Run git cmd from inside your file
Plugin 'tpope/vim-fugitive'
" PHP Xdebug
Plugin 'joonty/vdebug'
" MarkDown
Plugin 'plasticboy/vim-markdown'
" vuejs
Plugin 'posva/vim-vue'
" Emmet vim
Plugin 'mattn/emmet-vim'
" rename vim
Plugin 'vim-scripts/rename.vim'
" editorconfig
Plugin 'editorconfig/editorconfig-vim'
" Comment/Uncomment html xml ...
Plugin 'tomtom/tcomment_vim'
" vim-scripts/matchit.zip html xml ...
Plugin 'vim-scripts/matchit.zip'
" tpope/vim-surround html xml ...
Plugin 'tpope/vim-surround'
" vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'
" sass/scss/haml syntax
Plugin 'tpope/vim-haml'
" less
Plugin 'groenewege/vim-less'
" css color highlight
Plugin 'skammer/vim-css-color'
" postcss
Plugin 'stephenway/postcss.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * NERDTree

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:nerdtree_tabs_open_on_console_startup=1

" vim-devicons
" TODO broken so far, investigate ASAP
"set encoding=utf8
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" let s:brown = "905532"
" let s:aqua =  "3AFFDB"
" let s:blue = "689FB6"
" let s:darkBlue = "44788E"
" let s:purple = "834F79"
" let s:lightPurple = "834F79"
" let s:red = "AE403F"
" let s:beige = "F5C06F"
" let s:yellow = "F09F17"
" let s:orange = "D4843E"
" let s:darkOrange = "F16529"
" let s:pink = "CB6F6F"
" let s:salmon = "EE6E73"
" let s:green = "8FAA54"
" let s:lightGreen = "31B53E"
" let s:white = "FFFFFF"
" let s:rspec_red = 'FE405F'
" let s:git_orange = 'F54D27'

" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

" let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

" let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

"""""""""""""""""""""""""""""""""""""


syntax enable
set background=dark
colorscheme solarized

set number
set hlsearch
set incsearch
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Backup file is not important anymore (thanks to version control systems)
set noswapfile
" Disable the mouse
set mouse=
" Look for next occurrence of the visual selected pattern
vnoremap // y/<C-R>"<CR>

" Load ctags file from the root project directory
set tags=./tags;/

" PHP Xdebug config
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Emmet vim
" Only enables html/css
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
