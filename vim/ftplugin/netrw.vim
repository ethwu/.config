" Highlight selected lines in the file explorer.
setlocal cursorlineopt=line
" Relative/absolute line numbers.
setlocal number
setlocal relativenumber

map <silent> <buffer> h /\.\.<CR>:noh<CR><CR>
map <silent> <buffer> l <CR>

