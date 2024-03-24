vim.g.mapleader = ' '

vim.opt.guicursor = ''
vim.opt.cursorline = true           -- highlight current line

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true                 -- wrap lines (break long lines)
vim.opt.linebreak = true            -- wrap lines at convenient points (more readable)
vim.opt.breakindent = true          -- indent wrapped lines
vim.opt.tw = 120                    -- textwidth
vim.opt.colorcolumn = '120'         -- column marker (must be string)

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

