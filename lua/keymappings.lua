-- Default keymap opts
local default_opts = {noremap = true, silent = true}

-- Shorten function to keymapping where opts is optional with default value to default_opts.
-- Modes:
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local keymap = function(mode, lhs, rhs, opts)
  opts = opts or default_opts
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- All modes
-- Disable navigation with arrow keys
keymap('', '<up>', '<nop>')
keymap('', '<down>', '<nop>')
keymap('', '<left>', '<nop>')
keymap('', '<right>', '<nop>')

-- Normal mode

-- Navigation between windows
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

