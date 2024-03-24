return {
	'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
	cmd = 'Telescope',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find Files' },
        { '<leader>fg', '<cmd>Telescope git_files<CR>', desc = 'Find git files' },
        { '<leader>fs', '<cmd>Telescope grep_string<CR>', desc = 'Find a string' },
		{ '<leader>fl', '<cmd>Telescope live_grep<CR>', desc = 'Find grep' },
		{ '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'Find buffers' },
		{ '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Help' },
		{ '<leader>fk', '<cmd>Telescope keymaps<CR>', desc = 'Find keymaps' },
	},
    opts = function(_, opts)
        local actions = require('telescope.actions')
        opts.defaults = {
            mappings = {
                i = {
                    -- Open the selected entries in quickfix list (default keymap: <M-q> does not work in MAC).
                    ['Q'] = actions.send_selected_to_qflist + actions.open_qflist,
                },
            },
        }
    end,
}

