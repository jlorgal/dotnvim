return {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'rose-pine',
                icons_enabled = true,
            },
        })
    end
}

