return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_, bufnr)
                -- See default keymaps:
                -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/api-reference.md#default_keymapsopts
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason-lspconfig').setup({
                -- See https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
                ensure_installed = {
                    'bashls',           -- bash
                    'jsonls',           -- json
                    'lua_ls',           -- lua
                    'marksman',         -- markdown
                    'pylsp',            -- python
                    'rust_analyzer',    -- rust
                    'texlab',           -- latex
                    'lemminx',          -- xml
                },
                handlers = {
                    lsp_zero.default_setup,
                    bashls = function()
                        require('lspconfig').bashls.setup({})
                    end,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                    marksman = function()
                        require('lspconfig').marksman.setup({})
                    end,
                    pylsp = function()
                        local pylsp_opts = {
                            settings = {
                                pylsp = {
                                    plugins = {
                                        pycodestyle = {
                                            ignore = {
                                                'E111', -- E111 indentation is not a multiple of four
                                                'W391', -- W391 blank line at end of file
                                            },
                                            maxLineLength = 120,
                                        },
                                    },
                                },
                            },
                        }
                        require('lspconfig').pylsp.setup(pylsp_opts)
                    end,
                    rust_analyzer = function()
                        local on_attach = function(client)
                            require('completion').on_attach(client)
                        end
                        local rust_analyzer_opts = {
                            on_attach = on_attach,
                            settings = {
                                ['rust-analyzer'] = {
                                    checkOnSave = {
                                        command = 'clippy',
                                    },
                                    imports = {
                                        granularity = {
                                            group = 'module',
                                        },
                                        prefix = 'self',
                                    },
                                    cargo = {
                                        buildScripts = {
                                            enable = true,
                                        },
                                    },
                                    procMacro = {
                                        enable = true,
                                    },
                                },
                            },
                        }
                        require('lspconfig').rust_analyzer.setup(rust_analyzer_opts)
                    end,
                    texlab = function()
                        local texlab_opts = {
                            settings = {
                                texlab = {
                                    build = {
                                        args = {
                                            '-X',
                                            'compile',
                                            '%f',
                                            '--synctex',
                                            '--keep-logs',          -- Enable report warnings.
                                            '--keep-intermediates', -- Find out section numbers and show them in the completion list.
                                        },
                                        executable = 'tectonic',
                                        onSave = true,
                                        forwardSearchAfter = true,
                                    },
                                    forwardSearch = {
                                        executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
                                        args = {'%l', '%p', '%f'},
                                    },
                                    chktex = {
                                        onEdit = true,
                                        onOpenAndSave = true,
                                    },
                                    diagnosticsDelay = 300,
                                    formatterLineLength = 80,
                                    latexFormatter = 'latexindent',
                                    latexindent = {
                                        modifyLineBreaks = true,
                                    },
                                    lint = {
                                        onChange = true,
                                    },
                                },
                            },
                        }
                        require('lspconfig').texlab.setup(texlab_opts)
                    end,
                }
            })
        end
    }
}

