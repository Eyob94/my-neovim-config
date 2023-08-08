require('lualine').setup {
    options = {
        component_separators = '|',
        section_separator = '',
        icons_enabled = true,
        theme = 'rose-pine',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,

            },
            {
                'buffers'
            },
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                color_error = '#ff0000',
                color_warn = '#ffff00',
                color_info = '#00ffff',

            },
            {
                'filetype',
                colored = true,
            },
        }
    }
}
