return {
    -- Treesitter is a new parser generator tool that we can
    -- use in Neovim to power faster and more accurate
    -- syntax highlighting.
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'bash',
                    'dockerfile',
                    'go',
                    'json',
                    'latex',
                    'lua',
                    'make',
                    'markdown',
                    'python',
                    'rust',
                    'xml',
                    'yaml',
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    -- Treesitter context is a plugin that shows the current context at the top of the window.
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        config = function()
            require("treesitter-context").setup()
        end
    }
}

