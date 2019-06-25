set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="color"

" Background
" 333333 
hi Normal guibg=#080100 
hi Comment guibg=NONE guifg=#1ec1d6
hi Todo guibg=NONE guifg=#ff7b1a

" Java specifics colors
hi javaClassDecl guibg=NONE guifg=#c12000
hi javaScopeDecl guibg=NONE guifg=#c12000
hi javaStorageClass guibg=NONE guifg=#5d469b
hi javaType guibg=NONE guifg=#935ab1
hi javaMethodName guibg=NONE guifg=#1ec1d6
hi javaParameterType guibg=NONE guifg=#0042ab
hi javaParameterVariable guibg=NONE guifg=#0072e1
"hi javaParenT guibg=NONE guifg=#0042ab
" Class name 'javaClassName is in after/syntax/java.vim
hi default javaClassName guibg=NONE guifg=#ff0000

