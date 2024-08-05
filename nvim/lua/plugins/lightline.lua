-- vim.cmd('source $HOME/.config/nvim/lua/plugins/lightline.vim')
return {
	'itchyny/lightline.vim',
	enabled = false,
	lazy = false,
	config = function()
		vim.g.lightline = {
			colorscheme = 'catalina',
			-- colorscheme = 'tokyonight',
			mode_map = vim.g.mode_map,
			active = {
				left = {
					{ 'mode', 'paste' },
					{ 'readonly', 'modified' },
					{ 'fileinfo', 'gitstatus' },
				},
				right = {
					{ 'lineinfo' },
					{ 'percent' },
					vim.fn.winwidth(0) >= 80 and
						{ 'fileformat', 'fileencoding', 'filetype' } or
						{},
				},
			},
			inactive = {
				left = {
					{ 'inactive' },
					{ 'readonly', 'modified' },
					{ 'fileinfo' },
				},
				right = {
					{ 'lineinfo' },
				},
			},
			component = {
				fileinfo = '%f [%{FileSize()}]',
				inactive = '%{winwidth(0) > 32 ? "inactive" : ""}',
				lineinfo = ' %3l:%-2v',
				paste = '%{&paste ? "paste" : ""}',
				readonly = '%{&readonly ? "" : ""}',
			},
			component_function = {
				gitstatus = 'LightlineGitStatus',
			},
			-- separator = { left = '', right = '' },
			-- subseparator = { left = '', right = '' },
			subseparator = { left = '│', right = '│' },
		}
	end
}
