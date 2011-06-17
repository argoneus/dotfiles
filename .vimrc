filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set nocompatible

set modelines=0

"Vim tips from http://nvie.com/posts/how-i-boosted-my-vim/
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup

let mapleader = ","

"Set color scheme
if &t_Co >= 256 || has("gui_running")
   colorscheme macvim 
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

"Highlight whitespace chars
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

"Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Changes navigation so pressing down on a wrapped line goes to the next row,
"not the next line
nnoremap j gj
nnoremap k gk

"Clear search highlight buffer
nmap <silent> ,/ :nohlsearch<CR>

" Write a file with sudo if you forgot to open with sudo originally
cmap w!! w !sudo tee % >/dev/null

"Original settings
syn on
se nu
"Added for vimclojure plugin
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
 
"Add 80 column demarcation
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Added for LaTeX support
let g:Tex_ViewRule_pdf = 'Preview'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_DefaultTargetFormat = 'pdf'

" Show status line and always show it
" From http://www.linux.com/archive/feature/120126
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Code folding
" Based on http://smartic.us/2009/04/06/code-folding-in-vim/
set foldmethod=syntax   "fold based on syntax 
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
