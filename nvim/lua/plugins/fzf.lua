return {
	'junegunn/fzf.vim',
	dependencies = {
		'junegunn/fzf',
	},
	keys = {
		{ '<F7>', "<CMD>Rg!<CR>", { 'n', 'v', 's', 'i' } },
		{ '<F8>', "<CMD>execute (exists('*fugitive#head') && len(fugitive#head())) ? 'GFiles!' : 'Files!'<CR>", { 'n', 'v', 's', 'i' } },
	},
}
