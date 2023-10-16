local function has_git_folder()
    return vim.fn.isdirectory('.git') == 1
end

if has_git_folder() then
    vim.keymap.set('n', '<leader>gs', function()
        vim.api.nvim_command([[vertical Git]])
    end
    );
end
