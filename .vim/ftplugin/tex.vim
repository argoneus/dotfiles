" Set colorscheme, enable conceal (except for
" subscripts/superscripts), and match conceal
" highlight to colorscheme
" from http://b4winckler.wordpress.com/2010/08/07/using-the-conceal-vim-feature-with-latex/
colorscheme topfunky-light
set cole=2
let g:tex_conceal= 'adgm'
hi Conceal guibg=White guifg=DarkMagenta
