local present, bufferline = pcall(require, 'bufferline')

if not present then
	return
end

bufferline.setup {
	options = {
		mode = 'buffers',
		numbers = 'none',
		diagnostics = 'nvim_lsp',
		diagnostics_update_in_insert = true,
		offsets = {
			{
				filetype = 'NvimTree',
				text = '',
				separator = false
			}
		},
		color_icons = true,
		groups = {
			options = {
				toggle_hidden_on_enter = true,
			},
			items = {
				{
					name = "Dev",
					priority = 1,
					matcher = function (buf)
						return not (
							buf.filename:match('%.json')
								or buf.filename:match('.env')
								or buf.filename:match('%.yaml')
								or buf.filename:match('%.toml')
								or buf.filename:match('%.md')
								or buf.filename:match('%.txt')
								or buf.filename:match('.gitignore')
								or buf.filename:match('.gitmodules')
						)
					end,
				},
				{
					name = 'Conf',
					priority = 2,
					matcher = function (buf)
						return buf.filename:match('%.json')
							or buf.filename:match('.env')
							or buf.filename:match('%.yaml')
							or buf.filename:match('%.toml')
					end,
				},
				{
					name = 'Docs',
					priority = 3,
					matcher = function (buf)
						return buf.filename:match('%.md')
							or buf.filename:match('%.txt')
					end
				},
				{
					name = 'Git',
					priority = 4,
					matcher = function (buf)
						return buf.filename:match('.gitignore')
							or buf.filename:match('.gitmodules')
					end
				}
			}
		}
	},
}
