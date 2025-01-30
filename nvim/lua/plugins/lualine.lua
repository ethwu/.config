--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
	return function(str)
		local win_width = vim.fn.winwidth(0)
		if hide_width and win_width < hide_width then
			return ''
		elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
			return str:sub(1, trunc_len) .. (no_ellipsis and '' or '…')
		end
		return str
	end
end


local theme = {
	normal = {
		a = { fg = 0, bg = 4 },
		b = { fg = 0, bg = 3 },
		c = { gui = 'italic' },
		y = { fg = 7 },
		z = { fg = 0, bg = 4 },
	}
}

local colors = {
	black = 0,
	red = 1,
	green = 2,
	yellow = 3,
	blue = 4,
	magenta = 5,
	orange = 6,
	grey = 7,
}
local bright = 8
local mode_colors = {
	-- normal
	n = colors.blue,
	-- operator pending
	no = colors.blue,
	-- insert
	i = colors.green,
	-- visual
	v = colors.magenta,
	-- v-line
	V = colors.magenta,
	-- v-block
	[""] = colors.magenta,
	-- select
	s = colors.magenta + bright,
	-- s-line
	S = colors.magenta + bright,
	-- s-block
	[""] = colors.magenta + bright,
	-- replace
	R = colors.orange,
	-- v-replace
	Rv = colors.orange,
	-- command
	c = colors.blue + bright,
	-- vim ex
	cv = colors.black,
	-- ex
	ce = colors.black,
	-- more
	rm = colors.red,
	-- confirm
	["r?"] = colors.red,
	-- shell
	["!"] = colors.red,
	-- terminal
	["t"] = colors.red,
}

-- set the color according to the mode
local function mode_color()
	return {
		bg = mode_colors[vim.fn.mode()],
		gui = 'italic',
	}
end
local inactive_color = { bg = colors.magenta + bright, gui = 'italic' }

local inactive = { "'inactive'", color = inactive_color }
local mode = { 'mode', fmt = string.lower, color = mode_color }
local branch = { 'branch', icons_enabled = true, icon = '', fmt = trunc(60, 60, 60, false), separator = '' }
local diff = {
	'diff',
	diff_color = {
		added = { fg = colors.green + bright, gui = 'bold' },
		modified = { fg = colors.orange + bright, gui = 'bold' },
		removed = { fg = colors.red + bright, gui = 'bold' },
	}
}
local diagnostics = {
	'diagnostics',
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.yellow },
		info = { fg = colors.blue },
		hint = { fg = colors.orange },
	},
	update_in_insert = true,
	fmt = trunc(80, 80, 80, false)
}
local filename = {
	'filename',
	file_status = true,
	newfile_status = true,
	separator = '',
	color = { gui = '' },
	symbols = {
		modified = '[+]', readonly = '[-]', unnamed = '[No Name]', newfile = '[New]',
	}
}
local fullfilename = filename
fullfilename['path'] = 3
local filesize = {
	'filesize',
	fmt = function(s)
		if s ~= '' then
			if s:match 'b$' then
				return '[' .. s:upper() .. ']'
			else
				return '[' .. s:upper() .. 'iB]'
			end
		else
			return s
		end
	end,
	padding = { left = 0, right = 1 },
	color = { gui = 'None' },
}
-- local lineno = { function() return vim.fn.line '.' end, icons_enabled = true, icon = '', } -- separator = '', padding = { left = 1, right = 0 } }
-- local colno = { function() return vim.fn.charcol '.' end, icons_enabled = true, icon = '' }
-- local readonly = { "''", cond = function() return vim.bo[vim.api.nvim_win_get_buf(0)].readonly end }
local windowno = { "vim.api.nvim_win_get_number(0)", color = { colors = colors.black, bg = colors.magenta }, cond = function() return #vim.api
	.nvim_list_wins() > 1 end }
-- improved progress impl based on
-- https://github.com/verigak/progress/blob/52de04b95db27fc7db32f81b9fd0887e32af9d00/progress/bar.py#L71
local progress_width = 4
local progress_indicator_styles = {
	-- braille = { '⠁', '⠃', '⠇', '⡇', '⡏', '⡟', '⡿', '⣿', },
	-- shading = { '░', '▒', '▓', '█', },
	block = { '▏', '▎', '▍', '▌', '▋', '▊', '▉', '█', },
}
local progress_indicators = progress_indicator_styles['block']
local function progress()
	local cur = vim.fn.line('.')
	local total = vim.fn.line('$')
	if total == 1 then
		return ('🮕'):rep(progress_width)
	elseif cur == 1 then
		return ('▔'):rep(progress_width)
	elseif cur == total then
		return ('█'):rep(progress_width)
	end
	local prog = progress_width * cur / total
	local full = math.floor(prog)
	local phase = math.floor((prog - full) * #progress_indicators)
	local filled = progress_indicators[#progress_indicators]:rep(full)
	-- local current if phase > 0 then current = progress_indicators[phase] else current = '' end
	local current if phase > 0 then current = progress_indicators[phase] else current = ' ' end
	local empty = (' '):rep(math.max(progress_width - full - 1, 0))
	return filled .. current .. empty
end

return {
	'nvim-lualine/lualine.nvim',
	lazy = false,
	-- dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			icons_enabled = false,
			theme = theme,
			section_separators = { left = '', right = '' },
			component_separators = { left = '│', right = '│' },
			-- section_separators = { left = '', right = ''},
			-- component_separators = { left = '', right = ''},
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { branch },
			lualine_c = {
				filename,
				filesize,
			},
			lualine_x = {
				diff,
				diagnostics,
				-- { 'encoding',   fmt = trunc(100, 100, 100, false) },
				-- { 'fileformat', fmt = trunc(100, 100, 100, false) },
				-- { 'filetype',   fmt = trunc(80, 80, 80, false) },
			},
			lualine_y = { { progress, padding = 0, fmt = trunc(80, 80, 80, false) } },
			lualine_z = {
				{ 'location', icons_enabled = true, icon = '' },
				-- lineno,
				-- colno,
				windowno,
			},
		},
		inactive_sections = {
			lualine_a = { inactive },
			lualine_b = {},
			lualine_c = { filename, filesize, },
			lualine_x = { diff, diagnostics, },
			lualine_y = { { progress, padding = 0, fmt = trunc(80, 80, 80, false) } },
			lualine_z = {
				{ 'location', icons_enabled = true, icon = '' },
				-- lineno, colno,
				windowno,
			},
		},
		-- tabline = {
		-- 	lualine_a = {
		-- 		{ 'buffers', mode = 2, symbols = { modified = '[+]', directory = '🮹🮺' } },
		-- 	},
		-- 	lualine_b = { readonly },
		-- 	lualine_c = { fullfilename },
		-- 	lualine_z = { 'tabs' },
		-- },
		winbar = {},
		extensions = {
			'fugitive',
			'fzf',
			'lazy',
			'mason',
			'trouble',
		},
	},
}
