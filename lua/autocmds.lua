local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Set indentation to 2 spaces for some filetypes
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'json' },
  command = 'setlocal tabstop=2 shiftwidth=2 expandtab smarttab'
})

