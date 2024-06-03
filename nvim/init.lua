local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.localleader = '\\'

require("lazy").setup("plugins", {})

-- disallow :autocmd, shell, and write commands in local rc
vim.opt.secure = true

-- indentation
local tab_width = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = tab_width
vim.opt.tabstop = tab_width
vim.opt.expandtab = false

-- show whitespace
vim.opt.list = true
vim.opt.listchars = {
	-- spaces
	multispace = '·',
	trail = '·',
	nbsp = '␣',
	-- tabs
	tab = '⇥ ',
	-- leading/trailing
	precedes = '┄',
	extends = '┄',
}
-- show foldcolumn only if necessary
vim.opt.foldcolumn = 'auto'
-- folding determined by the syntax highlighting
vim.opt.foldmethod = 'syntax'
-- do not fold by default
vim.opt.foldenable = false

-- gutter
vim.opt.colorcolumn = { 73, 81, 101, 121 }
-- line numbers
vim.opt.number = true
-- highlight cursor line
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
-- display as much of a line that doesn't fit on the window as possible
vim.opt.display:append('lastline')
vim.opt.display:append('msgsep')

-- highlight braces
vim.opt.showmatch = true

-- load file changes
vim.opt.autoread = true
-- how long to wait to update after finishing typing
vim.opt.updatetime = 2400

-- mostly case-insensitive search
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- disable <F1>
vim.api.nvim_set_keymap('i', '<F1>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F1>', '<nop>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>', '<nop>', { noremap = true })
-- use backslash as the local leader
vim.g.localleader = '\\'

-- ; to :
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>;', ';', { noremap = true })
-- copy to system clipboard
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>Y', '"+yg_', { noremap = true })
-- paste to system clipbooard
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>P', '"+P', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>P', '"+P', { noremap = true })

-- -- use F7 to enter paste mode
-- vim.opt.pastetoggle = '<F7>'

-- always show at least one line above/below cursor
vim.opt.scrolloff = 1
-- disable mouse compat
vim.opt.mouse = nil
-- fancy cursor
vim.opt.guicursor = {
	['n-v-c'] = 'block',
	['i-ci-ve'] = 'block',
	['r-cr'] = 'hor20',
	['o'] = 'hor50',
	['a'] = 'blinkwait700-blinkoff400-blinkon250-Cursor/lCursor',
	['n-c'] = 'blinkon0',
	['sm'] = 'block-blinkwait175-blinkoff150-blinkon175',
}

-- completion menu
vim.opt.wildmenu = true
-- show the statusline
vim.opt.laststatus = 2
-- hide the mode
vim.opt.showmode = false

-- netrw
vim.g.netrw_keepdir = 0
vim.g.netrw_bufsettings = 'noma nomod nobl nowrap ro nu rnu'

-- user commands
vim.cmd([[noremap <expr> <Leader>n ":set list! number! signcolumn=" .. (&signcolumn == "yes" ? "no" : "yes") .. "\n"]])

vim.cmd('source $HOME/.config/nvim/prompt.vim')
