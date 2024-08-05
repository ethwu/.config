" Name:         Fontaine
" Author:       Ethan Wu <ethanwu@cs.ucsb.edu>
" License:      MIT

highlight clear
if exists("syntax_on") | syntax reset | endif
let g:colors_name = 'fontaine'

" Detect italics support.
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

" Color definitions.
let s:black = 0
let s:red = 1
let s:green = 2
let s:yellow = 3
let s:blue = 4
let s:magenta = 5
let s:orange = 6
let s:darkgray = 7
let s:lightgray = 8
let s:white = 15
let s:bright = 8

let s:bold = 'bold'
let s:italic = s:italics ? 'italic' : ''

" Set highlights that differ depending on background.
if &background ==# 'light'
    " Plain colors.
    hi Bright   ctermfg=Black
    hi Normal   ctermfg=DarkGray
    hi Faint    ctermfg=LightGray

    " gutter
    hi! link LineNr         Normal
    hi! link LineNrAbove    Faint
    hi! link LineNrBelow    Faint
    hi CursorLine   ctermfg=DarkGray    cterm=none
    hi! link CursorColumn   CursorLine
    hi ColorColumn  ctermfg=LightGray   ctermbg=none    cterm=none

    let s:colors = {
        \ 'comment': { 'fg': s:green + s:bright, 'cterm': 'italic' },
        \ 'string': { 'fg': s:red },
        \ 'constant': { 'fg': s:blue, 'cterm': 'none' },
        \ }

    hi Comment  ctermfg=LightGray       cterm=italic

    hi Constant ctermfg=LightMagenta    cterm=italic
else
    let s:colors = {
        \ 'comment': { 'fg': 'DarkGray', 'cterm': 'italic' },
        \ 'string': { 'fg': s:blue },
        \ }
endif

" Highlight the given group using the given style dictionary.
function! s:highlight(group, style)
    execute 'highlight' a:group
        \ 'ctermfg=' (has_key(a:style, 'fg') ? a:style.fg : 'none')
        \ 'ctermbg=' (has_key(a:style, 'bg') ? a:style.bg : 'none')
        \ 'cterm=' (has_key(a:style, 'cterm') ? a:style.cterm : 'none')
endfunction


function! s:applydefs(colors, defs)
    for [group, def] in items(a:defs)
        if type(def) == v:t_string
            call s:highlight(group, s:colors[def])
        elseif type(def) == v:t_list && len(def) > 1
            call s:highlight(group, extend(s:colors[def[0]], def[1]))
        endif
    endfor
endfunction

call s:applydefs(s:colors, {
    \ 'Comment': 'comment',
    \ 'Boolean': [ 'constant', { 'cterm': s:italic } ], 
    \ 'String': 'string',
    \ 'Constant': 'constant',
    \ 'Float': 'constant',
    \ 'Number': 'constant',
    \ })

