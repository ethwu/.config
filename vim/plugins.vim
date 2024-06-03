
" color scheme {{{
    " 16-color color scheme
    colorscheme catalina
" }}}

" indent guides {{{
    let g:indentguides_concealcursor_unaltered = 1
    let g:indentguides_ignorelist = [ 'text', 'help' ]
    let g:indentguides_spacechar = '╎'
    let g:indentguides_tabchar = '┇'

    command IndentGuidesToggle packadd vim-indentguides | IndentGuidesToggle
    map <Leader><F7> :IndentGuidesToggle<CR>
" }}}

" coc.nvim {{{
    if exists('$XDG_CONFIG_HOME')
        let g:coc_config_home = '$XDG_CONFIG_HOME/coc'
    else
        let g:coc_config_home = '~/.config/coc'
    endif

    if exists('$XDG_DATA_HOME')
        let g:coc_data_home = '$XDG_DATA_HOME/coc'
    else
        let g:coc_data_home = '~/.local/share/coc'
    endif
    " show the sign column
    set signcolumn=yes

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~ '\s'
    endfunction

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
    " list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-prev)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nmap <silent> gs <Plug>(coc-git-chunkinfo)
    nmap <silent> gm <Plug>(coc-git-commit)

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

" tex {{{
    " use LaTeX by default
    let g:tex_flavor = 'latex'
    " do not conceal characters
    let g:tex_conceal = ''
" }}}

" lightline {{{
    let g:lightline = {}
    let g:lightline.colorscheme = 'catalina'
    " g:mode_map defined in `vimrc`
    let g:lightline.mode_map = g:mode_map
    let g:lightline.active = {}
    let g:lightline.active.left =
                \ [ [ 'mode', 'paste' ],
                \   [ 'readonly', 'modified' ],
                \   [ 'fileinfo', 'gitstatus' ] ]
    let g:lightline.active.right =
                \ [ [ 'lineinfo' ],
                \   [ 'percent' ],
                \   winwidth(0) >= 80 ?
                    \ [ 'fileformat', 'fileencoding', 'filetype' ] :
                    \ [] ]
    let g:lightline.inactive = {}
    let g:lightline.inactive.left =
                \ [ [ 'inactive' ],
                \   [ 'readonly', 'modified' ],
                \   [ 'fileinfo' ] ]
    let g:lightline.inactive.right =
                \ [ [ 'lineinfo' ] ]
    let g:lightline.component = {}
    let g:lightline.component.fileinfo = '%f [%{FileSize()}]'
    let g:lightline.component.inactive = '%{winwidth(0) > 32 ? "inactive" : ""}'
    let g:lightline.component.lineinfo = ' %3l:%-2v'
    let g:lightline.component.paste = '%{&paste ? "paste" : ""}'
    let g:lightline.component.readonly = '%{&readonly ? "" : ""}'
    let g:lightline.component_function = {
                \ 'gitstatus': 'LightlineGitStatus' }
    " let g:lightline.separator = { 'left': '', 'right': '' }
    " let g:lightline.subseparator = { 'left': '', 'right': '' }
    let g:lightline.subseparator = { 'left': '│', 'right': '│' }

    " function! LightlineGitBlame()
    "     let blame = get(b:, 'coc_git_blame', '')
    "     return winwidth(0) > 120 && blame != '' ? blame : ''
    " endfunction

    function! LightlineGitStatus()
        if winwidth(0) > 120
            return trim(get(g:, 'coc_git_status', '') . ' ' . trim(get(b:, 'coc_git_status', '')))
        else
            return ''
        endif
    endfunction

" }}}

