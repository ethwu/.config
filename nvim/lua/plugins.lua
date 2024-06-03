vim.opt.termguicolors = false
vim.cmd.colorscheme('catalina')

vim.g.mode_map = {
	n = 'normal',
	no = 'operator pending',
	v = 'visual',
	V = 'v-line',
	['\022'] = 'v-block',	-- C-V
	s = 'select',
	S = 's-line',
	['\019'] = 's-block',	-- C-S
	i = 'insert',
	R = 'replace',
	Rv = 'v-replace',
	c = 'command',
	cv = 'vim ex',
	ce = 'ex',
	rm = 'more',
	['r?'] = 'confirm',
	['!'] = 'shell',
	t = 'terminal',
}


return {}
