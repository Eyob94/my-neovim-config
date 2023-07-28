require('noice').setup({
    lsp = {
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.open_floating_preview'] = true,
            ['vim.lsp.util.close_preview_autocmd'] = true,
            ['vim.lsp.util.preview_location'] = true,
            ['cmp.entry.get_documentation'] = true,
        }
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    }
})
