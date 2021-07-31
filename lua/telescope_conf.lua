local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
        i = {
          ["<leader>t"] = actions.select_tab,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<leader>t"] = actions.select_tab,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
  }
}
