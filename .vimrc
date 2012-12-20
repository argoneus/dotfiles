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

"tab completion shows matches
set wildmenu
set wildmode=list:longest

"Map leader to ,
let mapleader = ","
let maplocalleader = ","

"Turn off highlighting
nnoremap <leader><space> :noh<cr>

"Map ; to : for easier writing
nnoremap ; :

" Map jj in insert mode to escape
inoremap jj <ESC>

"Highlight whitespace chars
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

"Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Changes navigation so pressing down on a wrapped line goes to the next row,
"not the next line
nnoremap j gj
nnoremap k gk

"Navigating window splits
" Move the cursor to the window left of the current one
noremap <silent> ,h :wincmd h<cr>
" Move the cursor to the window below the current one
noremap <silent> ,j :wincmd j<cr>
" Move the cursor to the window above the current one
noremap <silent> ,k :wincmd k<cr>
" Move the cursor to the window right of the current one
noremap <silent> ,l :wincmd l<cr>

" Write a file with sudo if you forgot to open with sudo originally
cmap w!! w !sudo tee % >/dev/null

"Original settings
syn on
se nu
"Added for vimclojure plugin
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
 
" Added for LaTeX support
let g:Tex_ViewRule_pdf = 'Preview'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_DefaultTargetFormat = 'pdf'

" Code folding
" Based on http://smartic.us/2009/04/06/code-folding-in-vim/
set foldmethod=syntax   "fold based on syntax 
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"Shortcuts for NERDTree
imap <F4> <ESC>:NERDTreeToggle<CR>
map <F4> :NERDTreeToggle<CR>
" NERDTree ignore files
let NERDTreeIgnore=['\.o$', '\~$']
" synchronize vim CWD with NERDTree dir
let NERDTreeChDirMode=2

" ctags shortcut
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Shortcut for alternate header
noremap <leader>a	:A<CR>

" Ack is 'ack-grep' in Debian/Ubuntu, so detect OS
" and map command if not on Mac OS X
if has("unix")
	let s:uname = system("uname")
	if s:uname != "Darwin\n"
		let g:ackprg="ack-grep -H --nocolor --nogroup --column"
	endif
endif

" Always show status bar
set laststatus=2
" For vim-powerline
set t_Co=256

" xmllint formatter
" adapted from http://vim.wikia.com/wiki/Format_your_xml_document_using_xmllint
" one or more lines in selection
vmap <leader>px !xmllint --format -<CR>
