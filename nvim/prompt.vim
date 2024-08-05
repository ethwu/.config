let g:mode_map = {
    \ 'n': 'normal',
    \ 'no': 'operator pending',
    \ 'v': 'visual',
    \ 'V': 'v-line',
    \ '^V': 'v-block',
    \ 's': 'select',
    \ 'S': 's-line',
    \ '^S': 's-block',
    \ 'i': 'insert',
    \ 'R': 'replace',
    \ 'Rv': 'v-replace',
    \ 'c': 'command',
    \ 'cv': 'vim ex',
    \ 'ce': 'ex',
    \ 'rm': 'more',
    \ 'r?': 'confirm',
    \ '!': 'shell',
    \ 't': 'terminal',
    \ }

let s:prefixes = ['B', 'KiB', 'MiB', 'GiB', 'TiB']
function! FileSize() abort
    let l:bytes = getfsize(expand(@%))
    for l:prefix in s:prefixes
        if l:bytes < 1024
            if l:prefix ==# 'B' | return printf('%d B', l:bytes) | endif
            return printf('%.1f %s', l:bytes, l:prefix)
        endif
        let l:bytes = l:bytes / 1024.0
    endfor
endfunction

set statusline=
set statusline+=%#StatusLine#
set statusline+=\ %{g:mode_map[mode()]}\ 
set statusline+=%#Search#
set statusline+=\ %f\ 
set statusline+=%#Normal#
set statusline+=%(\ %r%)%(\ %h%)%(\ %w%)%(\ %m%)%=
set statusline+=\ %y\ [%{FileSize()}]\ 
set statusline+=%#Search#
set statusline+=\ %3p%%\ 
set statusline+=%#StatusLine#
set statusline+=\ %3l:%-2v\ 
