"set nocompatible
syntax on
"set background=dark
"set termguicolors
"color color
" GUI colors on terminal
"Be able to identify filetype
"filetype on

" <leader> 'prefix'
let mapleader = ","
"let maplocalleader = "\\"

"Editing .vimrc file
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Remapping <esc> key
inoremap jk <esc>
inoremap <esc> <nop>

"Remapping motions key (arrow keys)
noremap <Up> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Left> <nop>

"Put current word in uppercase
"noremap <silent> <c-u> :call JavaUppercase()<CR>

" This function convert current word to uppercase and returns the cursor to last position
"function! Uppercase()
"	let l:current_pos = getpos(".")
"	normal!	viwU
"	call setpos('.', l:current_pos) 
"endfunction

" This functions makes all Java constants to Uppercase
"function! JavaUppercase()
"	let l:current_pos = getpos(".")
"	let line = getline(".")
"	let match = matchstr(line, '\(static final String \| static final Integer \)\@<=[a-z_]*\( = \S\)\@=')
"	let match = toupper(match)
"	let newline = substitute(line, '\(static final String \| static final Integer \)\@<=[a-z_]*\( = \S\)\@=', match, "")
"	echom newline
"	call setline('.', newline)
"	call setpos('.', l:current_pos)
"endfunction

" Git Functions
" Get current git branch
"function! GitBranch()
"	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction

" statusline

"function! StatuslineGit()
"	let l:branchname = GitBranch()
"	return strlen(l:branchname) > 0?' '.l:branchname.' ':''
"endfunction

"set laststatus=2
"set statusline=
"set statusline+=%#CursorColumn#
"set statusline+=%{StatuslineGit()}

" Show syntax highlighting groups for word under cursor
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
 " if !exists("*synstack")
  "  return
  "endif
  "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc
" Highlight hex colors
"http://vim.1045645.n5.nabble.com/Check-if-highlight-exists-and-not-quot-cleared-quot-td1185235.html

"https://stackoverflow.com/questions/16737192/vim-remove-highlight-not-search-highlight
highlight hexColors guifg=red guibg=green
syntax match hexColors '\(#\)\@<=[a-z0-9]\{6}'
"nnoremap <leader>h :call HighlightHexColors()<CR>
nnoremap <leader>h :call HighlightText()<CR>
function! HighlightHexColors()
	let l:hex_regex= '\(#\)\@<=[a-z0-9]\{6}'
	let l:line = getline(".")
	let l:match = matchstr(line, l:hex_regex)
	execute 'syn keyword var_' . match '#'.match
	execute 'hi default var_' . match  ' guifg=#' . match
	echom 'syn keyword var_' . match . ' #' . match
	echom 'hi default var_' . match . ' guifg=#' . match
	echom "Match: ".match
endfunction

function! HighlightText()
	let line = getline(".")
	let match = matchstr(line, '\(static final String \| static final Integer \)\@<=[a-z_]*\( = \S\)\@=')
	execute 'syn keyword var_'.match match
	execute 'hi default var_'.match . ' guifg=#ff0000'
	echom 'Highlighted ' . match . ' to #ff0000'
endfunction

