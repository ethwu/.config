function! FileSize() abort
	let l:bytes = wordcount()['bytes']
	let l:prefixes = ['B', 'KiB', 'MiB', 'GiB']
	for l:prefix in l:prefixes
		if l:bytes < 1024
			if l:prefix ==# 'B' | return printf('%d B', l:bytes) | endif
			return printf('%.1f %s', l:bytes, l:prefix)
		endif
		let l:bytes = l:bytes / 1024.0
	endfor
endfunction

function! LightlineGitStatus()
	if winwidth(0) > 120
		return trim(get(g:, 'coc_git_status', '') . ' ' . trim(get(b:, 'coc_git_status', '')))
	else
		return ''
	endif
endfunction
