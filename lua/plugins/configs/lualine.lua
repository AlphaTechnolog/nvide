local present, lualine = pcall(require, 'lualine')

local hi = require 'utils.hi'

if not present then
	return
end

local layout = {
	lualine_a = {
		{
			function ()
				return ''
			end,
			separator = { left = '', right = '' },
		}
	},
	lualine_b = {
		{
			'filetype',
			icon_only = true,
			colored = true,
			separator = { right = nil, left = nil }
		},
		{
			'filename',
		},
		{
			function ()
				return ''
			end,
			color = { bg = hi.get_fg('String'), fg = hi.get_bg('Normal') },
			separator = { left = '', right = '' },
		},
		{
			'diagnostics',
			sources = { 'nvim_lsp' },
			sections = {
				'info',
				'error',
				'warn',
				'hint',
			},
			diagnostics_color = {
				error = { fg = hi.get_fg('DiagnosticError'), bg = hi.get_bg('StatusLine') },
				warn = { fg = hi.get_fg('DiagnosticWarn'), bg = hi.get_bg('StatusLine') },
				info = { fg = hi.get_fg('DiagnosticInfo'), bg = hi.get_bg('StatusLine') },
				hint = { fg = hi.get_fg('DiagnosticHint'), bg = hi.get_bg('StatusLine') },
			},
			update_in_insert = true,
			always_visible = false,
			symbols = {
				error = ' ',
				warn = ' ',
				hint = ' ',
				info = ' ',
			},
			colored = true,
			separator = { left = nil, right = nil }
		},
		{
			'diff',
			colored = true,
			diff_color = {
				added = { fg = hi.get_fg('DiffAdd'), bg = hi.get_bg('StatusLine') },
				modified = { fg = hi.get_fg('DiffChange'), bg = hi.get_bg('StatusLine') },
				removed = { fg = hi.get_fg('DiffDelete'), bg = hi.get_bg('StatusLine') },
			},
			symbols = {
				added = ' ',
				modified = ' ',
				removed = ' '
			},
			separator = { left = nil, right = nil }
		},
		{
			'branch',
			icon = '',
			color = { bg = hi.get_bg('StatusLine'), fg = hi.get_fg('Keyword') },
			separator = { left = nil, right = nil }
		},
	},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {
		{
			'filesize',
			color = 'StatusLine',
		},
		{
			function ()
				return ''
			end,
			color = { bg = hi.get_fg('Variable'), fg = hi.get_bg('Normal') },
			separator = { left = '', right = '' },
		},
		{
			'progress',
			color = 'StatusLine',
		},
		{
			function ()
				return ''
			end,
			color = { bg = hi.get_fg('WarningMsg'), fg = hi.get_bg('Normal') },
			separator = { left = '', right = '' },
		},
		{
			'location',
			color = 'StatusLine',
		},
		{
			function ()
				return ''
			end,
			color = { bg = hi.get_fg('Title'), fg = hi.get_bg('Normal') },
			separator = { left = '', right = '' },
		}
	},
}

local no_layout = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {},
}

lualine.setup {
	sections = layout,
	inactive_sections = no_layout,
	options = {
		globalstatus = true,
		theme = 'decay',
	},
}
