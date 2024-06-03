" Name:         Ynez
" Author:       Ethan Wu <ethanwu@cs.ucsb.edu>
" Maintainer:   Ethan Wu <ethanwu@cs.ucsb.edu>
" License:      Vim License (see `:help license`)
" Last Updated: Sat 04 Sep 2021 12:55:38 PM PDT
highlight clear

let g:colors_name = 'ynez'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

if s:t_Co >= 16
  hi IncSearch ctermfg=6 ctermbg=NONE cterm=reverse
  hi Search ctermfg=3 ctermbg=NONE cterm=reverse
  hi! link QuickFixLine Search
  hi Visual ctermfg=NONE ctermbg=8 cterm=NONE
  hi MatchParen ctermfg=11 ctermbg=8 cterm=bold
  hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
  hi! link lCursor Cursor
  hi CursorLine ctermfg=NONE ctermbg=8 cterm=NONE
  hi! link CursorColumn CursorLine
  hi Folded ctermfg=NONE ctermbg=8 cterm=NONE
  hi ColorColumn ctermfg=8 ctermbg=NONE cterm=reverse
  hi VertSplit ctermfg=7 ctermbg=8 cterm=NONE
  hi VertSplit ctermfg=7 ctermbg=8 cterm=NONE
  hi StatusLine ctermfg=NONE ctermbg=NONE cterm=reverse
  hi StatusLineNC ctermfg=NONE ctermbg=8 cterm=NONE
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi TabLineSel ctermfg=15 ctermbg=8 cterm=bold,reverse
  hi TabLine ctermfg=8 ctermbg=NONE cterm=reverse
  hi TabLineFill ctermfg=8 ctermbg=NONE cterm=reverse
  hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ToolbarLine ctermfg=NONE ctermbg=8 cterm=NONE
  hi Pmenu ctermfg=15 ctermbg=8 cterm=NONE
  hi PmenuSel ctermfg=15 ctermbg=0 cterm=NONE
  hi PmenuThumb ctermfg=15 ctermbg=7 cterm=NONE
  hi PmenuSbar ctermfg=15 ctermbg=0 cterm=NONE
  hi Comment ctermfg=8 ctermbg=NONE cterm=italic
  hi Constant ctermfg=4 ctermbg=NONE cterm=NONE
  hi! link String Constant
  hi! link Number Constant
  hi Boolean ctermfg=4 ctermbg=NONE cterm=italic
  hi! link Character Constant
  hi! link Float Constant
  hi Identifier ctermfg=2 ctermbg=NONE cterm=NONE
  hi! link Function Identifier
  hi Statement ctermfg=11 ctermbg=NONE cterm=bold
  hi! link Conditional Statement
  hi! link Repeat Statement
  hi! link Keyword Statement
  hi Label ctermfg=3 ctermbg=NONE cterm=NONE
  hi! link Exception Statement
  hi PreProc ctermfg=3 ctermbg=NONE cterm=NONE
  hi! link Define PreProc
  hi! link PreCondit PreProc
  hi Include ctermfg=3 ctermbg=NONE cterm=bold
  hi! link Macro Include
  hi Type ctermfg=2 ctermbg=NONE cterm=NONE
  hi! link Typedef Type
  hi! link StorageClass Type
  hi! link Structure Type
  hi Special ctermfg=6 ctermbg=NONE cterm=NONE
  hi! link SpecialChar Special
  hi SpecialComment ctermfg=9 ctermbg=NONE cterm=italic
  hi! link Debug Special
  hi! link Tag Special
  hi Error ctermfg=1 ctermbg=NONE cterm=bold
  hi Todo ctermfg=5 ctermbg=NONE cterm=bold
  hi Underlined ctermfg=13 ctermbg=NONE cterm=underline
  hi Ignore ctermfg=8 ctermbg=NONE cterm=NONE
  hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WarningMsg ctermfg=3 ctermbg=NONE cterm=italic
  hi ErrorMsg ctermfg=9 ctermbg=NONE cterm=italic
  hi VimCommand ctermfg=2 ctermbg=NONE cterm=NONE
  hi RubyDefine ctermfg=7 ctermbg=NONE cterm=bold
  hi Terminal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
  if !s:italics
    hi Comment cterm=NONE
    hi Boolean cterm=NONE
    hi SpecialComment cterm=NONE
    hi WarningMsg cterm=NONE
    hi ErrorMsg cterm=NONE
  endif
  if &background ==# 'dark'
    hi Normal ctermfg=7 ctermbg=NONE cterm=NONE
    hi LineNr ctermfg=8 ctermbg=NONE cterm=NONE
    hi CursorLineNr ctermfg=8 ctermbg=NONE cterm=NONE
    hi Operator ctermfg=7 ctermbg=NONE cterm=NONE
    hi Delimiter ctermfg=7 ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=8 ctermbg=NONE cterm=NONE
    hi NonText ctermfg=8 ctermbg=NONE cterm=NONE
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  hi Normal ctermfg=0 ctermbg=NONE cterm=NONE
  hi LineNr ctermfg=8 ctermbg=NONE cterm=NONE
  hi CursorLineNr ctermfg=8 ctermbg=NONE cterm=NONE
  hi Operator ctermfg=8 ctermbg=NONE cterm=NONE
  hi Delimiter ctermfg=8 ctermbg=NONE cterm=NONE
  hi Constant ctermfg=5 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=4 ctermbg=NONE cterm=bold
  hi SpecialKey ctermfg=15 ctermbg=NONE cterm=NONE
  hi NonText ctermfg=15 ctermbg=NONE cterm=NONE
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 8
  hi IncSearch ctermfg=DarkCyan ctermbg=NONE cterm=reverse
  hi Search ctermfg=DarkYellow ctermbg=NONE cterm=reverse
  hi! link QuickFixLine Search
  hi Visual ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi MatchParen ctermfg=LightYellow ctermbg=DarkGrey cterm=bold
  hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
  hi! link lCursor Cursor
  hi CursorLine ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi! link CursorColumn CursorLine
  hi Folded ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi VertSplit ctermfg=LightGrey ctermbg=DarkGrey cterm=NONE
  hi VertSplit ctermfg=LightGrey ctermbg=DarkGrey cterm=NONE
  hi StatusLine ctermfg=NONE ctermbg=NONE cterm=reverse
  hi StatusLineNC ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi TabLineSel ctermfg=White ctermbg=DarkGrey cterm=bold,reverse
  hi TabLine ctermfg=DarkGrey ctermbg=NONE cterm=reverse
  hi TabLineFill ctermfg=DarkGrey ctermbg=NONE cterm=reverse
  hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ToolbarLine ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi Pmenu ctermfg=White ctermbg=DarkGrey cterm=NONE
  hi PmenuSel ctermfg=NONE ctermbg=Black cterm=NONE
  hi PmenuThumb ctermfg=NONE ctermbg=LightGrey cterm=NONE
  hi PmenuSbar ctermfg=NONE ctermbg=Black cterm=NONE
  hi Comment ctermfg=DarkGrey ctermbg=NONE cterm=italic
  hi Constant ctermfg=DarkBlue ctermbg=NONE cterm=NONE
  hi! link String Constant
  hi! link Number Constant
  hi Boolean ctermfg=DarkBlue ctermbg=NONE cterm=italic
  hi! link Character Constant
  hi! link Float Constant
  hi Identifier ctermfg=DarkGreen ctermbg=NONE cterm=NONE
  hi! link Function Identifier
  hi Statement ctermfg=LightYellow ctermbg=NONE cterm=bold
  hi! link Conditional Statement
  hi! link Repeat Statement
  hi! link Keyword Statement
  hi Label ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi! link Exception Statement
  hi PreProc ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi! link Define PreProc
  hi! link PreCondit PreProc
  hi Include ctermfg=DarkYellow ctermbg=NONE cterm=bold
  hi! link Macro Include
  hi Type ctermfg=DarkGreen ctermbg=NONE cterm=NONE
  hi! link Typedef Type
  hi! link StorageClass Type
  hi! link Structure Type
  hi Special ctermfg=DarkCyan ctermbg=NONE cterm=NONE
  hi! link SpecialChar Special
  hi SpecialComment ctermfg=LightRed ctermbg=NONE cterm=italic
  hi! link Debug Special
  hi! link Tag Special
  hi Error ctermfg=DarkRed ctermbg=NONE cterm=bold
  hi Todo ctermfg=DarkMagenta ctermbg=NONE cterm=bold
  hi Underlined ctermfg=LightMagenta ctermbg=NONE cterm=underline
  hi Ignore ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WarningMsg ctermfg=DarkYellow ctermbg=NONE cterm=italic
  hi ErrorMsg ctermfg=LightRed ctermbg=NONE cterm=italic
  hi VimCommand ctermfg=DarkGreen ctermbg=NONE cterm=NONE
  hi RubyDefine ctermfg=LightGrey ctermbg=NONE cterm=bold
  hi Terminal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
  if !s:italics
    hi Comment cterm=NONE
    hi Boolean cterm=NONE
    hi SpecialComment cterm=NONE
    hi WarningMsg cterm=NONE
    hi ErrorMsg cterm=NONE
  endif
  if &background ==# 'dark'
    hi Normal ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi LineNr ctermfg=DarkGrey ctermbg=Black cterm=NONE
    hi CursorLineNr ctermfg=DarkGrey ctermbg=Black cterm=NONE
    hi Operator ctermfg=LightGrey ctermbg=NONE cterm=NONE
    hi Delimiter ctermfg=LightGrey ctermbg=NONE cterm=NONE
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  hi Normal ctermfg=Black ctermbg=White cterm=NONE
  hi LineNr ctermfg=DarkGrey ctermbg=White cterm=NONE
  hi CursorLineNr ctermfg=DarkGrey ctermbg=White cterm=NONE
  hi Operator ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi Delimiter ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi Constant ctermfg=DarkMagenta ctermbg=NONE cterm=NONE
  hi Statement ctermfg=DarkBlue ctermbg=NONE cterm=bold
  unlet s:t_Co s:italics
  finish
endif

" Background: any
" Color: black        #011517 0       Black
" Color: red          #C43424 1       DarkRed
" Color: green        #CFDD45 2       DarkGreen
" Color: yellow       #FFB511 3       DarkYellow
" Color: blue         #00B0DA 4       DarkBlue
" Color: magenta      #E44C9A 5       DarkMagenta
" Color: orange       #FF6E1B 6       DarkCyan
" Color: white        #DCE1E5 7       LightGrey
" Color: gray         #46535E 8       DarkGrey
" Color: br_red       #EF5645 9       LightRed
" Color: br_green     #F0FF6B 10      LightGreen
" Color: br_yellow    #FFD200 11      LightYellow
" Color: br_blue      #72CDF4 12      LightBlue
" Color: purple       #716FB2 13      LightMagenta
" Color: br_orange    #FF8F28 14      LightCyan
" Color: br_white     #EEF0F2 15      White
" Term colors: black red    green    yellow    blue    magenta orange    white
" Term colors: gray  br_red br_green br_yellow br_blue purple  br_orange br_white
" Background: dark
" Background: light
" Background: any
" Background: dark
" Background: light
" Background: any
" Background: dark
" Background: light
" Background: any
" Background: dark
" Background: light
" Background: any
" vim: et ts=2 sw=2
