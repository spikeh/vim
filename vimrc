" Use Vim settings
set nocompatible

" Initialise Pathogen
execute pathogen#infect()
execute pathogen#helptags()

"
" NEW SHIT
"
scriptencoding utf-8
" Use the clipboard register '+' instead of register '*' for all operations
" except yank
if has('unnamedplus')
    set clipboard=unnamedplus
endif

set shortmess+=filmnrxoOtT

set spell

set splitright
set splitbelow

" Used to restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo

"
" DISABLED SHIT
"
"set whichwrap
"set rulerformat
"set scrolljump
"set pastetoggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Print the line number
set number

" Allow backspace in insert mode
set backspace=indent,eol,start

" Lines of :commands to store in history
set history=1000

" Show partial commands in the last line of the screen
set showcmd

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Tenths of a second to show the matching paren
set matchtime=2

" Show current mode in the last line of the screen
set showmode

" Disable cursor blink in all modes
set gcr=a:blinkon0

" Automatically read the file if changed outside of Vim
set autoread

" Buffers can exist in the background without being in a window
set hidden

" Set default encoding
set encoding=utf8

let mapleader = ","
let g:mapleader = ","


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy indent from current line when starting a new line
set autoindent

" Do smart autoindenting when starting a new line
set smartindent

" <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smarttab

" Number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4

" Number of spaces that a <Tab> in the file counts for
set tabstop=4

" Use appropriate number of spaces to insert a <Tab>
set expandtab

" Copy the structure of the existing lines indent when autoindenting a new
" line
set copyindent

" When changing the indent of the current line, preserve as much of the indent
" structure as possible
set preserveindent

" Don't wrap lines
set nowrap

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Don't insert two spaces after a '.', '?' and '!' with a join command
set nojoinspaces


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLDING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line with equal indent form a fold
set foldmethod=indent

set foldlevel=99
set foldlevelstart=10

" Maximum nesting of folds
set foldnestmax=10

" Enable folds by default
set foldenable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCROLLING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minimum number of lines to keep above and below the cursor
set scrolloff=5

" Minimum number of lines to keep left and right of the cursor
"set sidescrolloff=15
"set sidescroll=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show searched pattern as it is being typed
set incsearch

" Highlight searched pattern
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override ignorecase if the search pattern contains upper case characters
set smartcase

" Changes the special characters that can be used in search patterns (regex)
set magic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMPLETION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion mode that is used for the character specified with 'wildchar'
" When more than one match, list all matches AND complete till longest string
set wildmode=list:longest

" On pressing 'wildchar' (usually <Tab>), possible matches are shown
" Use ^N and ^P to move to the previous/next match
set wildmenu

" Things to ignore when completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backup*
set wildignore+=*.png,*.jpg,*.jpeg,*.gif
set wildignore+=*.pyc
set wildignore+=*.class

" Show a comma separated list of options for INsert mode completion
set completeopt=longest,menu

" When completing a word in insert mode from the tags file, show both the tag
" name and a tidied up form of the search pattern as possible matches
" Does NOT work well with having 'longest' in completeopt!
set showfulltag

" Specify how keyword completion works when ^P or ^N are used
" . current buffer
" w buffers from other windows
" u unloaded buffers in the buffer list
" U buffers not in the buffer list
" t tag completion
" i current and included files
" d current and included files for defined name or macro
set complete=.,w,b,u,U,t,i,d


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show the line and column number of the cursor position
set ruler

" Enable syntax highlighting
syntax on

" Font
set guifont=Source\ Code\ Pro\ Medium\ 11

" Enable filetype plugins
filetype plugin indent on

" Colour scheme and background
colorscheme solarized
set background=light

" GNOME Terminal has support for 256 colours by default
set t_Co=256

" Disable all bells
set noerrorbells
set novisualbell

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

" Always show a status line
set laststatus=2
"set statusline

" Number of screen lines to use for the command-line
set cmdheight=1

" Control the behaviour when switching between buffers
"set switchbuf=usetab

" Screen will not redraw while executing macros
set lazyredraw

"set showtabline=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BACKUP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make a backup before overwriting a file
set backup
set writebackup
set backupcopy=auto
" List of directories for the backup file
set backupdir=~/.vim/backup,/tmp

" Persistent undo
set undofile
set undodir=~/.vim/backup

" No swap file
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM BINDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<CR>

nnoremap <space> za

command W w !sudo tee % > /dev/null

" Maps semi-colon to colon in all modes
map ; :
noremap ;; ;

" Treat long lines as break lines
noremap j gj
noremap k gk

" Map 0 to ^
map 0 ^

map zh zH
map zl zL

nnoremap Y y$

" Easier way to move between windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" Easier way to move between tabs
nnoremap bh  :bfirst<CR>
nnoremap bj  :bprev<CR>
nnoremap bk  :bnext<CR>
nnoremap bl  :blast<CR>
nnoremap bd  :BD<CR>

nnoremap gV `[v`]

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

vnoremap < <gv
vnoremap > >gv

" Allow the repeat operator '.' to be used with a visual selection
vnoremap . :normal .<CR>

" Disable highlight
map <silent> <leader>n :noh<CR>

" Set all viewports to the same size
map <leader>= <C-w>=

map <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

map <leader>te :tabedit <C-R>=expand("%:p:h")<CR>/

map <leader>cd :cd %:p:h<CR>:pwd<CR>

map <leader>q :e ~/buffer<CR>
map <leader>x :e ~/buffer.md<CR>
