set background=dark
"highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="color"

highlight vimString guifg=#0000ff

" TODO: Overide default 'TODO' colors
highlight Todo guifg=#990000 guibg=NONE
highlight Normal guibg=#000000
