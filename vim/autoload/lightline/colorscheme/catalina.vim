" =============================================================================
" Filename: autoload/lightline/colorscheme/catalina.vim
" Author: ewu
" License: MIT License
" =============================================================================

" Define the foreground color if the color scheme doesn't define it.
function s:fixfg()
    if !hlexists('Normal') || split(execute('hi Normal'))[-1] ==# 'cleared'
        if lightline#colorscheme#background() ==# 'light'
            hi Normal ctermfg=0
        else
            hi Normal ctermfg=15
        endif
    endif
endfunction

augroup lightline
    autocmd! ColorScheme * if !has('vim_starting') || expand('<amatch>') !=# 'macvim'
                \ | call s:fixfg() | call lightline#update() | call lightline#highlight() | endif
augroup END

let s:normal    = [ 'blue', 'NONE', 'blue', 'NONE', 'reverse' ]
let s:insert    = [ 'green', 'NONE', 'green', 'NONE', 'reverse' ]
let s:replace   = [ 'cyan', 'NONE', 'cyan', 'NONE', 'reverse' ]
let s:visual    = [ 'magenta', 'NONE', 'magenta', 'NONE', 'reverse' ]

let s:badge_normal  = [ 'blue', 'NONE', 'blue', 'NONE', 'italic,reverse' ]
let s:badge_insert  = [ 'green', 'NONE', 'green', 'NONE', 'italic,reverse' ]
let s:badge_replace = [ 'cyan', 'NONE', 'cyan', 'NONE', 'italic,reverse' ]
let s:badge_visual  = [ 'magenta', 'NONE', 'magenta', 'NONE', 'italic,reverse' ]

let s:warning   = [ 'yellow', 'NONE', 'yellow', 'NONE', 'reverse' ]
let s:error     = [ 'red', 'NONE', 'red', 'NONE', 'reverse' ]

let s:middle    = [ 'fg', 'NONE', 'fg', 'NONE' ]
let s:connector = [ 'yellow', 'NONE', 'yellow', 'NONE', 'reverse' ]
let s:tabsel    = [ 'yellow', 'NONE', 'yellow', 'NONE', 'bold,reverse' ]
let s:inactive  = [ 'darkmagenta', 'NONE', 'darkmagenta', 'NONE', 'reverse' ]
let s:badge_inactive = [ 'darkmagenta', 'NONE', 'darkmagenta', 'NONE', 'italic,reverse' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ s:badge_normal, s:connector ]
let s:p.normal.middle   = [ s:middle ]
let s:p.normal.right    = [ s:normal, s:connector, s:middle ]
let s:p.normal.warning  = [ s:warning ]
let s:p.normal.error    = [ s:error ]

let s:p.insert.left     = [ s:badge_insert, s:connector ]
let s:p.insert.middle   = [ s:middle ]
let s:p.insert.right    = [ s:normal, s:connector, s:middle ]

let s:p.replace.left    = [ s:badge_replace, s:connector, s:middle ]
let s:p.replace.middle  = [ s:middle ]
let s:p.replace.right   = [ s:normal, s:connector, s:middle ]

let s:p.visual.left     = [ s:badge_visual, s:connector, s:middle ]
let s:p.visual.middle   = [ s:middle ]
let s:p.visual.right    = [ s:normal, s:connector, s:middle ]

let s:p.inactive.left   = [ s:badge_inactive, s:connector ]
let s:p.inactive.middle = [ s:middle ]
let s:p.inactive.right  = [ s:inactive, s:connector, s:middle ]

let s:p.tabline.left    = [ s:normal ]
let s:p.tabline.middle  = [ s:normal ]
let s:p.tabline.right   = [ s:connector ]
let s:p.tabline.tabsel  = [ s:tabsel ]

let g:lightline#colorscheme#catalina#palette = lightline#colorscheme#fill(s:p)

