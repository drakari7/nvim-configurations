require 'colorizer'.setup(
  _,
  {
    names = false,
  }
)

vim.api.nvim_set_keymap('n', '<leader>co', ':ColorizerToggle<CR>', {})

