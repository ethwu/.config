" Name:         Catalina
" Author:       Ethan Wu <ethanwu@cs.ucsb.edu>
" License:      MIT

highlight clear

let g:colors_name = 'catalina'

let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

if &background ==# 'dark'
    hi Bright   ctermfg=15
    hi Normal   ctermfg=7
    hi Faint    ctermfg=8

    " gutter
    hi! link LineNr         Faint
    hi! link LineNrAbove    LineNr
    hi! link LineNrBelow    LineNr
    hi CursorLine           ctermbg=8       cterm=none
    hi ColorColumn          ctermfg=8       ctermbg=none       cterm=reverse

    " syntax
    hi Comment          ctermfg=8       cterm=italic
    hi Identifier       ctermfg=2
    hi Include          ctermfg=3
    hi PreProc          ctermfg=6       cterm=italic
    hi SpecialComment   ctermfg=5       cterm=italic
    hi Statement        ctermfg=3       cterm=bold
    hi! link String     Constant
    hi Type             ctermfg=2

    " cmdline
    hi MoreMsg          ctermfg=8       cterm=bold

    " menus
    hi Menu             ctermfg=15      ctermbg=8
else
    hi Bright   ctermfg=0
    hi Normal   ctermfg=8
    hi Faint    ctermfg=7

    " gutter
    hi! link LineNr         Normal
    hi CursorLine           ctermbg=7       cterm=none
    hi ColorColumn          ctermfg=8       ctermbg=7

    " syntax
    hi Comment          ctermfg=2       cterm=italic
    hi Identifier       ctermfg=5
    hi Include          ctermfg=4
    hi PreProc          ctermfg=4       cterm=italic
    hi SpecialComment   ctermfg=13      cterm=italic
    hi Statement        ctermfg=4       cterm=bold
    hi String           ctermfg=1
    hi Type             ctermfg=5

    " cmdline
    hi MoreMsg          ctermfg=4       cterm=bold

    " menus
    hi Menu             ctermfg=7       ctermbg=4
endif

" gutter
hi! link Conceal        Faint
hi! link CursorLineNr   Bright
hi! link FoldColumn     Faint
hi! link SignColumn     Faint

" selections
hi! link lCursor        Cursor
hi! link CursorColumn   CursorLine
hi MatchParen           ctermbg=6       cterm=bold
" visual mode selection
hi Visual               ctermbg=none    cterm=reverse
" visual mode when vim does not own the selection
hi VisualNOS            ctermbg=none    cterm=reverse

" syntax
hi! link Conditional    Statement
hi Constant             ctermfg=12
    hi Boolean          ctermfg=6       cterm=italic
    hi Character        ctermfg=9
    hi! link Float      Constant
    hi! link Number     Constant
" debugging statements
hi! link Debug          Special
hi! link Define         PreProc
hi! link Delimiter      Normal
hi! link Exception      Statement
hi! link Function       Identifier
hi! link Keyword        Statement
hi Label                ctermfg=2
hi! link Macro          Include
hi! link Operator       Normal
hi! link PreCondit      PreProc
hi! link Repeat         Statement
hi Special              ctermfg=6       cterm=italic
hi! link SpecialChar    Special
hi! link StorageClass   Type
hi! link Structure      Type
hi! link Tag            Special
hi! link Typedef        Type
hi! link Whitespace     Faint

" search
hi Search       ctermfg=3       ctermbg=none    cterm=reverse
hi IncSearch    ctermfg=11      ctermbg=none    cterm=reverse
hi Substitute   ctermfg=6       ctermbg=none    cterm=reverse

" diffs
hi DiffAdd      ctermfg=2       ctermbg=none
hi DiffChange   ctermfg=4       ctermbg=none
hi DiffDelete   ctermfg=1       ctermbg=none
hi DiffText     ctermfg=6       ctermbg=none

" spelling
hi SpellBad     ctermfg=1       ctermbg=none    cterm=underline
hi SpellCap     ctermfg=5       ctermbg=none    cterm=underline
hi SpellLocal   ctermfg=13      ctermbg=none    cterm=underline
hi SpellRare    ctermfg=6       ctermbg=none    cterm=underline

" warnings
hi Error        ctermbg=1
hi Todo         ctermfg=3       ctermbg=none    cterm=reverse

" special
hi! link        Ignore          Faint
" characters that don't exist in the text
hi! link        NonText         Faint
" nonprintable characters
hi! link        SpecialKey      Faint
hi Underlined   ctermfg=13      cterm=underline
" filler lines after end of buffer
hi! link        EndOfBuffer     Faint

" menus
" line used for closed folds
hi Folded               ctermfg=none    ctermbg=8
" popup menu
hi! link Pmenu          Menu
" popup menu selection
hi PmenuSel             ctermfg=12      ctermbg=none    cterm=reverse
" popup menu scrollbar
hi PmenuSbar            ctermbg=7
" popup menu scrollbar thumb
hi PmenuThumb           ctermbg=8
hi! link QuickFixLine   Search
hi! link Tooltip        Faint
" column splitting vertically-split windows
hi VertSplit            ctermfg=7       ctermbg=8
" current match in wildmenu completion
hi! link WildMenu       PmenuSel

" statusline
" statusline of current window
hi StatusLine               ctermfg=4       ctermbg=none    cterm=reverse
" statusline of non-current window
hi StatusLineNC             ctermbg=4       ctermbg=none
hi! link StatusLineTerm     StatusLine
hi! link StatusLineTermNC   StatusLineNC
" tabline
" tab pages line, not active tab page label
hi TabLine                  ctermfg=4       ctermbg=none    cterm=reverse
" no labels
hi TabLineFill              ctermbg=4
" active tab page label
hi TabLineSel               ctermfg=3       ctermbg=none    cterm=reverse
hi ToolbarLine              ctermbg=8
hi ToolbarButon             cterm=reverse
" cmdline
hi! link MsgArea        Normal
hi! link MsgSeparator   Faint
hi ErrorMsg             ctermfg=1       ctermbg=none    cterm=italic
hi ModeMsg              ctermfg=4       cterm=bold
hi WarningMsg           ctermfg=6       ctermbg=none    cterm=italic
" `Press ENTER to continue` and yes/no questions
hi! link Question       Faint

" listings
hi Directory            ctermfg=4       cterm=bold
" title in output of `:set all`, `:autocmd`, etc
hi Title                ctermfg=4       cterm=bold

hi htmlBold                 cterm=bold
hi htmlItalic               cterm=italic
hi htmlUnderline            cterm=underline
hi htmlStrike               cterm=strikethrough

hi htmlBoldItalic           cterm=bold,italic
hi htmlBoldUnderline        cterm=bold,underline
hi htmlUnderlineItalic      cterm=underline,italic
hi htmlBoldUnderlineItalic  cterm=bold,underline,italic

if !s:italics
    hi Boolean cterm=none
    hi Comment cterm=none
    hi ErrorMsg cterm=none
    hi PreProc cterm=none
    hi SpecialComment cterm=none
    hi WarningMsg cterm=none

    hi htmlItalic cterm=none
    hi htmlBoldItalic cterm=bold
    hi htmlUnderlineItalic cterm=underline
    hi htmlBoldUnderlineItalic cterm=bold,underline
    unlet s:italics
    finish
endif

