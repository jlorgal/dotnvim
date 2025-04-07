return {
  'stevearc/oil.nvim',
  keys = {
    { '-', '<cmd>Oil --float<cr>', mode = 'n', desc = "Open Filesystem" },
  },
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}

