--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
       return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end


local theme = {
	normal = {
		a = { fg = 15, bg = 13, gui = 'italic' },
		b = { fg = 15, bg = 3 },
		c = { gui = 'italic' },
		y = { fg = 15, bg = 7 },
		z = { fg = 15, bg = 4 },
	}
}

local function window()
	return vim.api.nvim_win_get_number(0)
end

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

local mode = { 'mode', fmt = string.lower, color = mode_color }
local branch = { 'branch', icons_enabled = true, icon = '', fmt = trunc(60, 60, 60, false), separator = '' }
local diff = { 'diff', diff_color = {
	added = { fg = colors.green + bright, gui = 'bold' },
	modified = { fg = colors.orange + bright, gui = 'bold' },
	removed = { fg = colors.red + bright, gui = 'bold' },
} }
local filename = { 'filename', newfile_status = true, separator = '', symbols = {
	modified = '[+]', readonly = '[-]', unnamed = '[No Name]', newfile = '[New]',
} }
local filesize = {
	'filesize',
	fmt = function(s)
		if s ~= '' then
			if s:match'b$' then
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
local lineno = { function() return vim.fn.line'.' end, icons_enabled = true, icon = '', separator = '', padding = { left = 1, right = 0 } }
local colno = { function() return vim.fn.charcol'.' end, icons_enabled = true, icon = '' }
-- local readonly = { "''", cond = function() return vim.bo[vim.api.nvim_win_get_buf(0)].readonly end }

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
				diff,
				{ 'diagnostics', fmt = trunc(80, 80, 80, false) },
			},
			lualine_x = {
				{ 'encoding', fmt = trunc(80, 80, 80, false) },
				{ 'fileformat', fmt = trunc(80, 80, 80, false) },
				{ 'filetype', fmt = trunc(60, 60, 60, false)  },
			},
			lualine_y = { { 'progress', fmt = trunc(60, 60, 60, false) } },
			lualine_z = {
				-- { location, icons_enabled = true, icon = '' },
				lineno,
				colno,
				{
					window,
					color = { bg = colors.magenta },
					cond = function() return #vim.api.nvim_list_wins() > 1 end,
				},
			},
		},
		inactive_sections = {
			lualine_a = { "'inactive'" },
			lualine_b = { },
			lualine_c = { filename, filesize, diff },
			lualine_x = {},
			lualine_y = { },
			lualine_z = {
				lineno, colno,
				{ window, color = { bg = colors.magenta } },
			},
		},
		extensions = {
			'fugitive',
			'mason',
		},
	},
}
