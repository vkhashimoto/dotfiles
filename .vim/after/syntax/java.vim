" Matches Class name
syn match javaClassName "\(class \)\@<=[a-zA-Z]*"
" Matches methods name
" TODO: Make this dynamic to search by every reserved word that comes before method's name
syn match javaMethodName "\(void \|String \)\@<=[a-zA-Z]*\((\)\@="
" Matches parameters type
" TODO: Make this dynamic to search by every reserved word and classes name
" containedin=javaParenT it's own region (ctrl+shift+p) ????
syn match javaParameterType "\((\|\,\ \)\@<=\(String\|Integer\)" containedin=javaParenT contained

" Matches parameter variable
" TODO: Make this dynamic to search by every reserved word an classes name
" containedin=javaParenT it's own region (ctrl+shift+p) ????
syn match javaParameterVariable "\(\((\)\@<=String \|Integer \)\@<=[a-zA-Z0-9_]*" containedin=javaParenT contained
