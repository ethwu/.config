vim.cmd.colorscheme('catalina')
return {
	'folke/tokyonight.nvim',
	enabled = false,
	lazy = false,
	priority = 100,
	opts = {
		style = "night",
		light_theme = "day",
		transparent = false,
		terminal_colors = true,
		styles = {
			-- comments = { italic = true },
			keywords = { bold = true },
			-- functions = { italic = true },
			variables = {},
			sidebars = "dark",
			floats = "normal",
		},
	},
	init = function()
		vim.cmd.colorscheme('tokyonight')
		-- vim.g.lightline['colorscheme'] = 'tokyonight'
	end
}
