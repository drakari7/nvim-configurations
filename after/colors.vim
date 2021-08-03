" Overwrites the color scheme
" Background is 1f1f1f
" temp color #ebdbb2
" let background = "#1f1f1f"

hi Normal           guifg=#efefef       guibg=none          gui=none
hi SignColumn       guifg=none          guibg=none          gui=none
hi EndOfBuffer      guifg=#303030       guibg=none          gui=none
hi LineNr           guifg=#e37412       guibg=none          gui=none
hi Pmenu            guifg=#efefef       guibg=#363944       gui=none
hi NormalFloat      guifg=none          guibg=none          gui=none
hi FloatBorder      guifg=#21eda9       guibg=none          gui=none
hi Visual           guifg=none          guibg=#303030       gui=none
hi Comment                                                  gui=italic
hi helpExample      guifg=#ebdbb2       guibg=none          gui=none

hi CompeDocumentationBorder  guifg=#21eda9      guibg=none      gui=none

" LSP diagnostic colors
hi LspDiagnosticsDefaultError       guifg=#f22222
hi LspDiagnosticsDefaultWarning     guifg=#fcf91c
hi LspDiagnosticsDefaultInformation guifg=#29a3ff
hi LspDiagnosticsDefaultHint        guifg=#29ff7e

" Tree sitter related colors
" Misc
" hi TSError        
hi TSPunctDelimiter     guifg=#696969
hi TSPunctBracket       guifg=#d94311
" hi TSPunctSpecial

" Constants
" hi TSConstant
" hi TSConstBuiltin
" hi TSConstMacro
" hi TSStringRegex
hi TSString             guifg=#AFD787
hi TSStringEscape       guifg=#619fff
hi TSCharacter          guifg=#63ffb9
hi TSNumber             guifg=#e9875f
hi TSBoolean            guifg=#63ffb9       gui=italic
hi TSFloat              guifg=#e9875f
" hi TSAnnotation
" hi TSAttribute
" hi TSNamespace

" Functions
hi TSFuncBuiltin        guifg=#50e1ff       gui=italic
hi TSFunction           guifg=#829fff
hi TSMethod             guifg=#829fff       gui=none
" hi TSFuncMacro
" hi TSParameter
" hi TSParameterRefe    rence
hi TSField              guifg=#fa6950
" hi TSProperty
hi TSConstructor        guifg=#829fff       gui=italic

" Keywords
" temp color AF87D7
hi TSConditional        guifg=#AF87D7
hi TSRepeat             guifg=#AF87D7
hi TSKeywordOperator    guifg=#AF87D7
hi TSKeyword            guifg=#AF87D7       gui=italic
" hi TSKeywordFunction
hi TSOperator           guifg=#de671d
" hi TSException
" hi TSLabel
" hi TSType
" hi TSTypeBuiltin
" hi TSStructure
hi TSInclude            guifg=#5ade18        

" Variable
" hi TSVariable
hi TSVariableBuiltin    guifg=#adadad       gui=italic

