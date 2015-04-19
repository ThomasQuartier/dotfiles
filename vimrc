" -------------------------------------- "
" ----------- PLUGIN LOADING ----------- "
" -------------------------------------- "
"  Install Plugins the easy way using vundle. Use this as an example how to
"  use vundle. If something is not clear, check the vundle repo for
"  instructions. Use the github link as argument for Plugin
"  To install vundle itself :git clone https://github.com/gmarik/vundle.git
"  ~/.vim/bundle/
set nocompatible						" disable vi compatibility (emulation of old bugs)
filetype off							" required by Vundle plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'				" Let Vundle manage Vundle
Plugin 'Valloric/YouCompleteMe'         " completer + syntax checker
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'              " Lean and mean status/tabline for vim that's light as air
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'a.vim'
" Plugin 'scrooloose/syntastic'           " static code analysis using external tools
" Plugin 'steffanc/cscopemaps.vim'
call vundle#end()                       " required by Vundle
filetype plugin indent on               " required by Vundle

" -------------------------------------- "
" --------------- LEADER --------------- "
" -------------------------------------- "
let mapleader = ","                     " , is leader key, used as <leader> in key bindings
let g:mapleader = ","                   " g: global variable see :help internal-variables

" -------------------------------------- "
" --------------- NERDtee -------------- "
" -------------------------------------- "
nmap <leader>ne :NERDTreeToggle<cr>

" -------------------------------------- "
" -------------- ctrlp ----------------- "
" -------------------------------------- "

" -------------------------------------- "
" -------------- Gundo ----------------- "
" -------------------------------------- "
nmap <leader>gu :GundoToggle<cr>

" -------------------------------------- "
" -------------- SOLIRIZED ------------- "
" -------------------------------------- "
syntax enable
set background=dark
let g:solarized_termcolors=256 
set t_Co=256
colorscheme solarized

" -------------------------------------- "
" --------------- Airline -------------- "
" -------------------------------------- "
let g:airline#extensions#tabline#enabled = 1

" -------------------------------------- "
" --------------- Tagbar -------------- "
" -------------------------------------- "
nmap <leader>ta :TagbarToggle<cr>

" -------------------------------------- "
" --------------- Tagbar -------------- "
" -------------------------------------- "

" -------------------------------------- "
" ----------- GENERAL OPTIONS ---------- "
" -------------------------------------- "
set tabstop=4 							" number of visual spaces per TAB
set softtabstop=4						" number of spaces in tab when editing
set shiftwidth=4						" nuber of spaces for each step of (auto)indentAL OPTIONS -------------- "
set expandtab                           " convert tab to 4 spaces
set autoindent							" Copy indent from current line when starting a new line
set smartindent							" use entelligent identation for C-like languages
set number								" show line numbers
set cursorline							" highlight current line
set wildmenu							" visual autocomplete for command menu
set incsearch							" search as characters are entered
set hlsearch							" highlight matches
set showmatch							" highlight matchin [{()}]
set ignorecase							" ignore case of normal letters 
set smartcase							" ignore case whem the pattern ocntains lowercase only
set hidden								" hide buffers instead of closing them
set mouse=a								" enable use of the mouse. Only works for certain terminals
"set showcmd								" show command in bottom bar
"set cmdheight=2							" Nuber of screen lines to use for the command-line
"set laststatus=2						" the last window will always have a status line
"set ruler								" Show line and column numbers of the cursor position, seperated by a comma
"filetype indent plugin on              " (needed no top of file by Vundle)
"set nocompatible						" disable vi compatibility (emulation of old bugs) (needed on top of file by Vundle)

" -------------------------------------- "
" ----------- Other Bindings ----------- "
" -------------------------------------- "
inoremap jk <esc>						" jk is escape

map <C-h> <C-w>h                        " Smarter moving between split windows
map <C-j> <C-w>j                        " Smarter moving between split windows
map <C-k> <C-w>k                        " Smarter moving between split windows
map <C-l> <C-w>l                        " Smarter moving between split windows
