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
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
" enable repeating supported plugin maps with .
Plug 'tpope/vim-repeat'
" Commenter plugin
Plug 'tomtom/tcomment_vim'
" Fix trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" Visualize the vim undo tree
Plug 'sjl/gundo.vim'

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

" Writing Rst
"
" Take notes in rst
Plug 'Rykka/riv.vim'
" Instant rst preview in browser
Plug 'gu-fan/InstantRst'
Plug 'vim-voom/voom'

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

" "
" " C++ / Python
" "
" " Dark powered asynchronous completion framework for neovim/Vim8
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" " Clang completer for deoplete.nvim that's faster than deoplete-clang
" Plug 'tweekmonster/deoplete-clang2'
" " deoplete.nvim for jedi
" Plug 'zchee/deoplete-jedi'
" " Language Server Protocol (LSP) support for vim and neovim.
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" " Print documents in echo area
" Plug 'Shougo/echodoc.vim'
" Simplify Doxygen documentation in C, C++, Python
Plug 'vim-scripts/DoxygenToolkit.vim'
" Async linting
Plug 'w0rp/ale'
" VimL completion for coc.nvim
Plug 'Shougo/neco-vim'
" Vim completion source for coc.nvim using neco-vim
Plug 'neoclide/coc-neco'
" Include completion source for coc.nvim using neoinclude.vim
Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
" coc.nvim
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"
" Snippets used by coc.nvim
"
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'


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
set smarttab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Directories for swp files
" set nobackup
" set noswapfile
" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
" set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
" if has("patch-8.1.0251")
" 	" consolidate the writebackups -- not a big
" 	" deal either way, since they usually get deleted
" 	set backupdir^=~/.vim/backup//
" end

" persist the undo tree for each file
set undofile
" set undodir^=~/.vim/undo//
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shortcuts for 3-way merge
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use better diff algorithm
set diffopt+=internal,algorithm:patience
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set wildignore+=*.o,*~,*.pyc,*/\.git/*,*_amd64,*.d,*_arm,_doc*,__pycache__
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*/\.ccls-cache/*
" .ccls-cache,.ccls-cache/*
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
\      '-readability-braces-around-statements',
\      '-fuchsia-default-arguments',
\      '-hicpp-braces-around-statements'
\      ]

nmap <leader>an :ALENext<cr>
nmap <leader>ap :ALEPrevious<cr>
nmap <leader>ac :ALEFix clang-format<cr>
nmap <leader>af :ALEFix remove_trailing_lines<cr>:ALEFix trim_whitespace<cr>

"
" vim-instant-markdown
"
" don't automatically start when opening a markdown file
let g:instant_markdown_autostart = 0
nmap <leader>md :InstantMarkdownPreview<cr>

"
" InstantRst
"
let g:instant_rst_browser = 'firefox'
let g:instant_rst_port = 5676
nmap <leader>rst :InstantRst<cr>

"
" Riv
"
let g:riv_section_levels = '*=-^"~'

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
nmap <leader>gn <plug>(signify-next-hunk)
nmap <leader>gp <plug>(signify-prev-hunk)
nmap <leader>gN 9999<leader>gj
nmap <leader>gP 9999<leader>gk

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
" vim-markdown
"
" Disable folding configuration
" let g:vim_markdown_folding_disabled = 1
" Disable conceal reagardless of vim conceallevel
let g:vim_markdown_conceal = 0
" Disable Default Key Mappings
" let g:vim_markdown_no_default_key_mappings = 1
" Let TOC autofit
let g:vim_markdown_toc_autofit = 1
" Set makrdown indent to 2 spaces
let g:vim_markdown_new_list_item_indent = 2

"
" vim-pencil
"
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd,text,rst call pencil#init({'wrap': 'hard', 'autoformat': 1})
" augroup END
" Disable conceal regardless of vim conceallevel
let g:pencil#conceallevel = 0
" Set textwidh to 80 characters instead of the default 74
let g:pencil#textwidth = 80

"
" vim-litecorrect
"
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd,text,rst call litecorrect#init()
augroup END

"
" vim-autocorrect
"
augroup autocorrect
  autocmd FileType markdown,mkd,text,rst call litecorrect#init()
augroup END


"
" coc.nvim
"
"" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> <leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>crf <Plug>(coc-references)
" Rename symbol
nmap <leader>crn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" vmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Use `:Format` for format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` for fold current buffer
" command! -nargs=? Fold :call CocAction('fold', <f-args>)


" " Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status'
"       \ },
"       \ }

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" textDocument/documentHighlight
" set updatetime=300
" au CursorHold * sil call CocActionAsync('highlight')
" au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" navigate
" nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
" nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
" nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
" nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>

" bases
" nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" " bases of up to 3 levels
" nn <silent> xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" " derived
" nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" " derived of up to 3 levels
" nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>
"
" " caller
" nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" " callee
" nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>
"
" " $ccls/member
" " member variables / variables in a namespace
" nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" " member functions / functions in a namespace
" nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" " nested classes / types in a namespace
" nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>
"
" nmap <silent> xt <Plug>(coc-type-definition)<cr>
" nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
" nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>
"
" nn xx x
