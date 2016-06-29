" -------------------------------------- "
" ----------- PLUGIN LOADING ----------- "
" -------------------------------------- "
" Install Plugins the easy way using vundle. Use this as an example how to
" use vundle. If something is not clear, check the vundle repo for
" instructions. Use the github link as argument for Plugin
" To install vundle itself :git clone https://github.com/gmarik/vundle.git
" ~/.vim/bundle/
set nocompatible                            " disable vi compatibility (emulation of old bugs)
filetype off                                " required by Vundle plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'                  " Let Vundle manage Vundle
Plugin 'altercation/vim-colors-solarized'   " vim colorscheme
Plugin 'vim-airline/vim-airline'                  " Lean and mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'                " Tree explorer
Plugin 'renyard/vim-rangerexplorer'        " Vim Ranger Explorer
Plugin 'kien/ctrlp.vim'                     " Fuzzy file buffer, mru, tag, etc finder
Plugin 'sjl/gundo.vim'                      " Visualize the vim undo tree
Plugin 'majutsushi/tagbar'                  " Display tags in a window ordered by scope

Plugin 'tpope/vim-fugitive'                 " Git wrapper so awesome, it should be illegal
Plugin 'airblade/vim-gitgutter'             " Shows git diff in the gutter (sign column) and stages revert hunks

Plugin 'Valloric/YouCompleteMe'             " Code-completion engine: completer + syntax checker
Plugin 'rdnetto/YCM-Generator'
" Plugin 'scrooloose/syntastic'               " static code analysis using external tools
Plugin 'Raimondi/delimitMate'               " insert mode auto-completion for quotes, parents, brackets, etc.

Plugin 'bronson/vim-trailing-whitespace'    " Fix trailing whitespace
Plugin 'a.vim'                              " Alternate .c and .h files quickly
Plugin 'christoomey/vim-tmux-navigator'     " Navigate seamlessly between vin and tmux splits

Plugin 'will133/vim-dirdiff'                " Vimdiff for directories
Plugin 'tomtom/tcomment_vim'

Plugin 'Lokaltog/vim-easymotion'            " vim motion on speed

" Plugin 'tpope/vim-abolish'                  " Easily search for, substiture, and abbreviate multiple variants of a word
" Plugin 'scrooloose/nerdcommenter'                " Tree explorer
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'  " vim-snipmate default snippets
" Plugin 'mileszs/ack.vim'   " vim plugin for the Perl module/CLI script 'ack'
" Plugin 'steffanc/cscopemaps.vim'
call vundle#end()                           " required by Vundle
filetype plugin indent on                   " required by Vundle
" -------------------------------------- "
" --------------- LEADER --------------- "
" -------------------------------------- "
let mapleader = "," " , is leader key, used as <leader> in key bindings
let g:mapleader = ","    " g: global variable see :help internal-variables
" -------------------------------------- "
" -------------- SOLIRIZED ------------- "
" -------------------------------------- "
syntax enable
set background=dark
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
" colorscheme dracula
" -------------------------------------- "
" --------------- Airline -------------- "
" -------------------------------------- "
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = "dark"
let g:airline_powerline_fonts = 1         " automatically populate g:airline_symbols with powerline symbols
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enable = 1
set laststatus=2                            " Start vim-airline automatically
" -------------------------------------- "
" --------------- NERDtee -------------- "
" -------------------------------------- "
nmap <leader>ne :NERDTreeToggle<cr>
" -------------------------------------- "
" ----------- Ranger-explorer ---------- "
" -------------------------------------- "
nmap <leader>ra :RangerExplorer<cr>
" -------------------------------------- "
" -------------- ctrlp ----------------- "
" -------------------------------------- "
let g:ctrlp_working_path_mode='a'
" -------------------------------------- "
" -------------- Gundo ----------------- "
" -------------------------------------- "
nmap <leader>gu :GundoToggle<cr>
" -------------------------------------- "
" --------------- Tagbar -------------- "
" -------------------------------------- "
nmap <leader>ta :TagbarToggle<cr>
let g:tagbar_sort = 0
" -------------------------------------- "
" -------------- gitgutter ------------- "
" -------------------------------------- "
nmap <leader>gg :GitGutterToggle<cr>
" -------------------------------------- "
" ----------- YouCompleteMe ------------ "
" -------------------------------------- "
"  let g:ycm_complete_in_comments = 0
" let g:ycm_register_as_syntastic_checker = 0 " This is needed when clang is not available: use syntastic as syntax checker
let g:ycm_show_diagnostics_ui = 0
" -------------------------------------- "
" -------------- Syntastic ------------- "
" -------------------------------------- "
" nmap <leader>sy :SyntasticToggleMode<cr>
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" " let g:syntastic_c_checkers = ['gcc', 'make', 'splint']
" let g:syntastic_c_checkers = ['gcc']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" -------------------------------------- "
" ------------ DelimitMate ------------- "
" -------------------------------------- "
" -------------------------------------- "
" -------- trailing-whitespace --------- "
" -------------------------------------- "
nmap <leader>fw :FixWhitespace<cr>
" -------------------------------------- "
" ------------ DelimitMate ------------- "
" -------------------------------------- "
let g:snip_trigger_key = '<tab>'
let g:snip_trigger_key_backwards = '<s-tab>'
" -------------------------------------- "
" --------------- a.vim ---------------- "
" -------------------------------------- "
nmap <leader>AA :A<cr>
nmap <leader>AS :AS<cr>
nmap <leader>AV :AV<cr>
nmap <leader>AT :AT<cr>

" -------------------------------------- "
" ----------- GENERAL OPTIONS ---------- "
" -------------------------------------- "
set tabstop=2               " number of visual spaces per TAB
set softtabstop=2           " number of spaces in tab when editing
set shiftwidth=2            " nuber of spaces for each step of (auto)indentAL OPTIONS
set expandtab               " convert tab to spaces
set autoindent              " Copy indent from current line when starting a new line
set smartindent             " use entelligent identation for C-like languages
set cinoptions=g1,h1

set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set showmatch               " highlight matchin [{()}]
set ignorecase              " ignore case of normal letters
set smartcase               " ignore case whem the pattern ocntains lowercase only

set number                  " show line numbers
set relativenumber
set colorcolumn=80         " keep lines 100 characters at most
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set hidden                  " hide buffers instead of closing them
set mouse=a                 " enable use of the mouse. Only works for certain terminals

set autoread                " Set to auto read when a file is changed from the outside

"set showcmd                " show command in bottom bar
"set cmdheight=2            " Nuber of screen lines to use for the command-line
"set ruler                  " Show line and column numbers of the cursor position, seperated by a comma
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%82v.*/
" -------------------------------------- "
" ----------- Other Bindings ----------- "
" -------------------------------------- "

" --- Tiping j and k to switch to command mode
inoremap jk <esc>

" --- Smarter moving between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
set splitright
set splitbelow

" --- Fast saving
nmap <leader>w :w!<cr>

" --- Fast vimrc editing
nmap <leader>e :e! ~/.vimrc<cr>

" --- Automatic reload and source of ~/.vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" --- Fast buffer navigation
map <leader>t :bp<cr>
map <leader>s :bn<cr>
nnoremap gb :ls<CR>:b<Space>

" --- Fast tabular navigation
map <tab> gt
map <S-tab> gT

" --- :W sudo saving
command W w !sudo tee % > /dev/null

" --- Ignore compiled files
set wildignore=*.o,*~,*.pyc,.git\*,*_amd64
