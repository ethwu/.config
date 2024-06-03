" Sourced when vim fails to find a filetype.

" https://vi.stackexchange.com/a/29063
function! s:StartsWith(prefix, string) abort
    return a:string[0:len(a:prefix) - 1] ==# a:prefix
endfunction

function! s:DetectFileType()
    let s:first_line = getline(1)
    if s:StartsWith('#lang racket', s:first_line)
        set filetype=racket
    elseif s:StartsWith('#lang pollen', s:first_line)
        set filetype=pollen
    endif
endfunction

au BufNewFile,BufRead * call s:DetectFileType()

