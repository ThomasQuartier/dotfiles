"*******************************************************************************
"" Vim-PLug core
"*******************************************************************************
if has('vim_starting')
  " Be iMproved
  set nocompatible
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,python"

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required
call plug#begin(expand('~/.config/nvim/plugged'))

"*******************************************************************************
" Plug install packages
"*******************************************************************************
"
" Navigation
"
" Tree explorer
Plug 'scrooloose/nerdtree'
" Vim integration for command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Display tags in a window ordered by scope
Plug 'majutsushi/tagbar'
" Navigate seamlessly between vin and tmux splits
Plug 'christoomey/vim-tmux-navigator'

"
" Visual
"
" display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'
" Colorscheme
Plug 'tomasr/molokai'
" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"
" Improved editing
"
" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
" Multiple cursors lik in sublime test editor
Plug 'terryma/vim-multiple-cursors'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" enable repeating supported plugin maps with .
Plug 'tpope/vim-repeat'
" Commenter plugin
Plug 'tomtom/tcomment_vim'
" Fix trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" Visualize the vim undo tree
Plug 'sjl/gundo.vim'
" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

"
" Writing
"
" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Hyperfocus-writing in Vim.
Plug 'junegunn/limelight.vim'
" Instant Markdown previews from VIm!
Plug 'suan/vim-instant-markdown'
" Powerful grammar checker using LanguageTool
Plug 'rhysd/vim-grammarous'
" Uncover usage problems in your writing
Plug 'reedes/vim-wordy'
" Rethinking Vim as a tool for writers
Plug 'reedes/vim-pencil'

"
" GIT
"
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'airblade/vim-gitgutter'

"
" C++ development
"
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Simplify Doxygen documentation in C, C++, Python
Plug 'vim-scripts/DoxygenToolkit.vim'
" Async linting
Plug 'w0rp/ale'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plantuml
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on


"*******************************************************************************
" Basic settings
"*******************************************************************************
" Map leader to ,
let mapleader=","
"" Search down into subfolders provides tab-completion for all file related tasks
set path+=**
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
" Automatically update file when changed outside of vim
set autoread
" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Round indent to multiple of 'shiftwidth' when indenting with > and <
set shiftround
"" Do smart autoindenting when starting a new line
set smartindent
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Enable hidden buffers
set hidden
" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
" Show current command at the bottom line of the screen
set showcmd
" Highlight matching bracket when cursor is on one of them
set showmatch
"" Open a new split on the right side
set splitright
"" Open a new split on the bottom
set splitbelow

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
"" Ignore compiled and generated files
set wildignore+=*.o,*~,*.pyc,.git\*,*_amd64,*.d,*_arm,_doc*,__pycache__
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildmode=list:longest,list:full
" Copy/Paste/Cut to clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif


"*******************************************************************************
" Visual
"*******************************************************************************
syntax on
set ruler
set number
set colorcolumn=80
set cursorline
"
let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  colorscheme molokai
endif
"
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10
" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
" Disable the blinking cursor.
set gcr=a:blinkon0
" Keep always 3 screen lines above and below the cursor
set scrolloff=3
" Status bar
set laststatus=2
" Set statusline
" if exists("*fugitive#statusline")
"   set statusline+=%{fugitive#statusline()}
" endif

"*******************************************************************************
" Mappings (not related to a plugin)
"*******************************************************************************

" Splits
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Clipboard Copy Paste Cut
noremap YY "+y
noremap <leader>p "+gP
noremap XX "+x

" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" Clear search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Escape is very very far from the homerow
inoremap jk <esc>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>cv :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Format json
map <leader>js :%!python -m json.tool<cr>

"*******************************************************************************
" Plugin settings
"*******************************************************************************
"
" YouCompleteMe
"
let g:ycm_complete_in_comments = 1
" Don't ask to load .ycm_extra_conf.py file
let g:ycm_confirm_extra_conf = 0
nmap <leader>ycm :YcmCompleter<Space>

"
" UltiSnips
"
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

"
" ALE
"
" Set search paths for the compilation database (compile_commands.json)
let g:ale_c_build_dir_names = ['build', 'bin', '_build', '_build_amd64', '_build_arm']
let g:ale_cpp_build_dir_names = ['build', 'bin', '_build', '_build_amd64', '_build_arm']
" Set enabled linters for cpp
let g:ale_linters = {
\   'cpp': ['clangtidy', 'clangcheck', 'cppcheck'],
\}
" Set enabled fixers for cpp
let g:ale_fixers = {
\   'cpp': ['clang-format'],
\}
" Fix automatically on save
let g:ale_fix_on_save=0
" Setup clang tidy
let g:ale_cpp_clangtidy_executable = 'clang-tidy'
let g:ale_cpp_clangtidy_checks = [
\      '*',
\      '-llvm*',
\      '-google*',
\      '-readability-braces-around-statements'
\      ]
" Setup clang-check
let g:ale_cpp_clangcheck_executable = 'clang-check-5.0'
" Setup cppcheck
let g:ale_cpp_cppcheck_executable = 'cppcheck'
let g:ale_cpp_cppcheck_options = '--enable=all --project=_build/compile_commands.json'
" Setup
let g:ale_cpp_clangformat_executable = 'clang-format'
let g:ale_c_clangformat_executable = 'clang-format'

"
" vim-instant-markdown
"
" don't automatically start when opening a markdown file
let g:instant_markdown_autostart = 0

"
" vim-airline
"
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"
" NERDTree
"
let g:NERDTreeShowBookmarks=1
nmap <leader>ne :NERDTreeToggle<cr>

"
" Gundo
"
nmap <leader>gu :GundoToggle<cr>

"
" GitGutter
"
nmap <leader>gg :GitGutterToggle<cr>
nmap <leader>gn :GitGutterNextHunk<cr>
nmap <leader>gp :GitGutterPrevHunk<cr>

"
" ALE
"
nmap <leader>al :ALENext<cr>
nmap <leader>ap :ALEPrevious<cr>
nmap <leader>af :ALEFix<Space>
nmap <leader>cl :ALEFix clang-format<cr>
nmap <leader>fw :ALEFix remove_trailing_lines<cr>:ALEFix trim_whitespace<cr>

"
" InstantMarkdown
"
nmap <leader>md :InstantMarkdownPreview<cr>

"
" FZF
"
"" fzf.vim
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Default fzf layout
let g:fzf_layout = { 'down': '~40%' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" Key bindings
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
nnoremap <silent> <leader>E :History<CR>

"
" Tagbar
"
nmap <leader>ta :TagbarToggle<cr>
let g:tagbar_sort = 0

