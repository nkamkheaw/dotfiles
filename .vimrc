" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

filetype indent off

set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle starts
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Vundle ends

syntax enable

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

colorscheme cleanroom

set hls
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set hidden
set lazyredraw
set showmode
set wildmenu
set number
set cpoptions+=$
" set cc=+1

" air-line configurations
set laststatus=2
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]

let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']

" Easy motion prefix
map <space><space> <Plug>(easymotion-prefix)

" personal remap
nmap <silent> ,ev :tabedit $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>
nmap <silent> <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-\> :tab split <CR>:exec("tag ".expand("<cword>"))<CR>
map <space>l /\%>80v.\+<cr>
map <C-n> <plug>NERDTreeTabsToggle<cr>

" ag
if executable('ag')
    let g:ackprg = 'ag'
else
    echom "Install silversearch-ag!!"
endif

