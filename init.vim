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
" vim plugin for tmux.conf
Plug 'tmux-plugins/vim-tmux'

"
" Visual
"
" display the indention levels with thin vertical lines
" Plug 'Yggdroot/indentLine'
" Colorscheme
Plug 'tomasr/molokai'
" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Restore FocusGained and FocusLost autocommand events in terminal vim.
Plug 'tmux-plugins/vim-tmux-focus-events'

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
" A collection of language packs for Vim (only syntax for c/c++)
" Plug 'sheerun/vim-polyglot'

"
" Snippets
"
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

"
" GIT
"
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Show added, modified and removed lines in sign column
Plug 'mhinz/vim-signify'

"
" Writing Markdown
"
" Syntax highlighting, matching rules and mappings for the original Markdown
" and extensions.
Plug 'plasticboy/vim-markdown'
" Dependency for vim-markdown
Plug 'godlygeek/tabular'
" Instant Markdown previews from VIm!
Plug 'suan/vim-instant-markdown'

"
" Writing Rst
"
" Take notes in rst
Plug 'Rykka/riv.vim'
" Instant rst preview in browser
Plug 'gu-fan/InstantRst'

"
" General writing
"
" Rethinking Vim as a tool for writers
Plug 'reedes/vim-pencil'

"
" Spell/Grammar checking
"
" Disctraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Powerful grammar checker using LanguageTool
Plug 'rhysd/vim-grammarous'
" Uncover usage problems in your writing
Plug 'reedes/vim-wordy'
" Leightweight auto-correction in Vim
Plug 'reedes/vim-litecorrect'
" Correct common typos and misspellings as you type in Vim
Plug 'panozzaj/vim-autocorrect'

"
" C++ / Python
"
" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Clang completer for deoplete.nvim that's faster than deoplete-clang
Plug 'tweekmonster/deoplete-clang2'
" deoplete.nvim for jedi
Plug 'zchee/deoplete-jedi'
" Language Server Protocol (LSP) support for vim and neovim.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Print documents in echo area
Plug 'Shougo/echodoc.vim'
" Simplify Doxygen documentation in C, C++, Python
Plug 'vim-scripts/DoxygenToolkit.vim'
" Async linting
Plug 'w0rp/ale'

"
" Plantuml
"
" vim syntax file for plantuml
Plug 'aklt/plantuml-syntax'
" Dependency of plantuml-previewer
Plug 'tyru/open-browser.vim'
" vim/neovim plugin for plantuml
Plug 'weirongxu/plantuml-previewer.vim'

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required
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
" let g:indentLine_enabled = 1
" let g:indentLine_setColors = 1
" let g:indentLine_concealcursor = 0
" let g:indentLine_char = '┆'
" let g:indentLine_faster = 1
" Disable the blinking cursor.
set gcr=a:blinkon0
" Keep always 3 screen lines above and below the cursor
set scrolloff=3
" Status bar
set laststatus=2

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

" This is a quick way to call search-and-replace on a current word
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//g<Left><Left>

"*******************************************************************************
" Plugin settings
"*******************************************************************************
"
" ALE
"
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" Set search paths for the compilation database (compile_commands.json)
let g:ale_c_build_dir_names = ['build', 'bin', '_build', '_build_amd64', '_build_arm']
let g:ale_cpp_build_dir_names = ['build', 'bin', '_build', '_build_amd64', '_build_arm']
" Set enabled linters for cpp
let g:ale_linters = {
\   'cpp': ['clangtidy', 'cppcheck', 'flawfinder'],
\}
" Setup clang tidy
let g:ale_cpp_clangtidy_checks = [
\      '*',
\      '-llvm*',
\      '-google*',
\      '-readability-braces-around-statements'
\      ]
" Setup clang-check
" let g:ale_cpp_clangcheck_executable = 'clang-check-6.0'
" Setup cppcheck
" let g:ale_cpp_cppcheck_executable = 'cppcheck'
" let g:ale_cpp_cppcheck_options = '--enable=all --project=_build/compile_commands.json'
" Setup clang-format
" let g:ale_cpp_clangformat_executable = 'clang-format'
" let g:ale_c_clangformat_executable = 'clang-format'

nmap <leader>an :ALENext<cr>
nmap <leader>ap :ALEPrevious<cr>
nmap <leader>af :ALEFix<Space>
nmap <leader>cl :ALEFix clang-format<cr>
nmap <leader>fw :ALEFix remove_trailing_lines<cr>:ALEFix trim_whitespace<cr>

"
" vim-instant-markdown
"
" don't automatically start when opening a markdown file
let g:instant_markdown_autostart = 0
nmap <leader>md :InstantMarkdownPreview<cr>

"
" InstantRst
"
nmap <leader>rst :InstantRst<cr>

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
" vim-signify
"
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

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

"
" Deoplete
"
let g:deoplete#enable_at_startup = 1

"
" LanguageClient-neovim
"
" let g:LanguageClient_loggingFile =  expand('~/LanguageClient.log')
" let g:LanguageClient_serverStderr = expand('~/LanguageServer.log')

" Recommended settings from LanguageClient-neovim wiki
function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c,sh call SetLSPShortcuts()
augroup END

set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Always draw the signcolumn.
set signcolumn=yes

" Recommended settings from ccls wiki
let g:LanguageClient_serverCommands = {
    \ 'c': ['~/.local/ccls/Release/ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['~/.local/ccls/Release/ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['~/.local/ccls/Release/ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['~/.local/ccls/Release/ccls', '--log-file=/tmp/cc.log'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/tquar/.config/nvim/settings.json'
" https://github.com/autozimu/LanguageClient-neovim/issues/379 LSP snippet is not supported
let g:LanguageClient_hasSnippetSupport = 0

" See :help key-notation
" Press Ale + j to go to definition
" nn <silent> <M-j> :call LanguageClient#textDocument_definition()<cr>
" Press Alt + k to find references
" nn <silent> <M-k> :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>
" Press K to show hover info
" nn <silent> K :call LanguageClient#textDocument_hover()<cr>

" textDocument / documentHighlight
" augroup LanguageClient_config
"   au!
"   au BufEnter * let b:Plugin_LanguageClient_started = 0
"   au User LanguageClientStarted setl signcolumn=yes
"   au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
"   au User LanguageClientStopped setl signcolumn=auto
"   au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
"   au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif
" augroup END

" nn <silent> xh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
" nn <silent> xj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
" nn <silent> xk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
" nn <silent> xl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
" bases
" nn <silent> xb :call LanguageClient#findLocations({'method':'$ccls/inheritance'})<cr>
" bases of up to 3 levels
" nn <silent> xB :call LanguageClient#findLocations({'method':'$ccls/inheritance','levels':3})<cr>
" derived
" nn <silent> xd :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true})<cr>
" derived of up to 3 levels
" nn <silent> xD :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true,'levels':3})<cr>

" caller
" nn <silent> xc :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>
" callee
" nn <silent> xC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>

" $ccls/member
" nested classes / types in a namespace
" nn <silent> xs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<cr>
" member functions / functions in a namespace
" nn <silent> xf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
" member variables / variables in a namespace
" nn <silent> xm :call LanguageClient#findLocations({'method':'$ccls/member'})<cr>

" nn xx x

"
" UltiSnips
"
" let g:UltiSnipsExpandTrigger = '<C-j>'
" let g:UltiSnipsJumpForwardTrigger = '<C-j>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" neosnippets
"
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'

"
" vim-markdown
"
" Disable folding configuration
let g:vim_markdown_folding_disabled = 1
" Disable conceal reagardless of vim conceallevel
let g:vim_markdown_conceal = 0
" Disable Default Key Mappings
let g:vim_markdown_no_default_key_mappings = 1
" Let TOC autofit
let g:vim_markdown_toc_autofit = 1
" Set makrdown indent to 2 spaces
let g:vim_markdown_new_list_item_indent = 2

"
" vim-pencil
"
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text call pencil#init({'wrap': 'hard', 'autoformat': 1})
augroup END

"
" vim-litecorrect
"
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd,text call litecorrect#init()
augroup END

"
" vim-autocorrect
"
augroup autocorrect
  autocmd FileType markdown,mkd,text call litecorrect#init()
augroup END
