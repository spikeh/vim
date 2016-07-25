set nocompatible

scriptencoding utf-8

execute pathogen#infect()

set number

set backspace=indent,eol,start

set history=1000

" Show (partial) command in the last line of the screen
set showcmd

" When a bracket is inserted, briefly jump to the matching one
set showmatch
set matchtime=3

" If in Insert, Replace or Visual mode put a message on the last line
set showmode

" Disable blinking cursor
set guicursor=a:blinkon0

" Automatically read file again if changed outside of Vim
set autoread

set hidden

set encoding=utf8

" Splitting a window will put the new window right/below the current one
set splitright
set splitbelow

" Copy indent from current line when starting a new line
set autoindent

" Smart autoindenting when starting a new line
set smartindent

" Do not indent access specifiers for C++
set cinoptions=g0

" <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smarttab

" Number of spaces that a <Tab> in the file counts for
set tabstop=4

" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4

" Number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Use appropriate number of spaces to insert a <Tab>
set expandtab

" Copy the structure of the existing lines indent when autoindenting a new line
set copyindent

set nowrap

" Don't insert two spaces after a '.', '?' and '!' with a join command
set nojoinspaces

" Minimum number of lines to keep above and below the cursor
set scrolloff=5

set colorcolumn=81

" Show tabs as ^I is displayed, display $ after end of line
set nolist
set listchars=trail:·,tab:»·

" On pressing 'wildchar' (usually <Tab>), possible matches are shown
" Use ^N and ^P to move to the previous/next match
set wildmenu

" Completion mode that is used for the character specified with 'wildchar'
" When more than one match, list all matches AND complete till longest string
set wildmode=list:longest,full

" Files that match with one of these patterns is ignored when completing
set wildignore+=*.o,*.obj,*~
set wildignore+=*.png,*.jpg,*.jpeg,*.gif
set wildignore+=*.pyc
set wildignore+=*.class

" Use the clipboard register '+' instead of register '*' for all operations
" except yank
set clipboard=unnamedplus

" Do not use a swapfile for the buffer
set noswapfile

" Enable folds by default
set foldenable

" Line with equal indent form a fold
set foldmethod=indent

" Maximum nesting of folds
set foldnestmax=10

" Show searched pattern as it is being typed
set incsearch

" Highlight searched pattern
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override ignorecase if the search pattern contains upper case characters
set smartcase

" Show the line and column number of the cursor position
set ruler

syntax on

" List of fonts which will be used for the GUI version of Vim
set guifont=Terminess\ Powerline\ 12

filetype plugin indent on

colorscheme solarized

set background=light

set t_Co=256

" Do not ring the bell (beep or screen flash) for error messages
set noerrorbells

if has("gui_running")
    set background=light

    " Add tab pages when indicated with showtabline. Use GUI tabs.
    set guioptions+=e
    set guioptions-=T
    set guioptions-=r

    " Change the GUI tab label
    "set guitablabel=%M\ %t
endif

" Highlight the screen line of the cursor
set cursorline

" Always show the status line
set laststatus=2

" Shorten file messages
set shortmess+=filmnrxoOtT

"
" Filetype indentations
"
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM BINDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ","

" Disable highlight
nmap <silent> <leader>n :noh<CR>

" Set all viewports to the same size
map <leader>= <C-W>=

" Toggle NERDTree
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" Toggle Tagbar
nmap <silent> <leader>b :TagbarToggle<CR>

" Toggle Syntastic
nmap <silent> <leader>e :SyntasticCheck<CR>

" Toggle A
nmap <silent> <leader>a :A<CR>

" Maps semi-colon to colon in all modes
map ; :
noremap ;; ;

" Treat long lines as break lines
nnoremap j gj
nnoremap k gk

nmap 0 ^

nnoremap zh zH
nnoremap zl zL

nnoremap Y y$

" Space toggles folding
nnoremap <silent> <Space> za

" Easier way to move between windows
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Easier way to move between tabs
"nnoremap bh  :bfirst<CR>
"nnoremap bj  :bprev<CR>
"nnoremap bk  :bnext<CR>
"nnoremap bl  :blast<CR>
"nnoremap bd  :BD<CR>

" Highlight everything
nnoremap gV `[v`]

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Adjust tabs in Visual mode
vnoremap < <gv
vnoremap > >gv

" Allow the repeat operator '.' to be used with a visual selection
vnoremap . :normal .<CR>

" Force write readonly files using sudo
command! WS w !sudo tee %

" NERDTree
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 0

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5

" vim-easytags
set tags=./.tags;,~/.vim/tags
let g:easytags_async = 1
let g:easytags_file = '~/.vim/tags'
let g:easytags_dynamic_files = 2
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" vim-gitgutter
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
