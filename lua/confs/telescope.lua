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
    layout_strategy = 'horizontal',
    layout_config = {
        preview_width = 0.55,
    },
    file_ignore_patterns = {
      "__pycache__/",
    },
    -- path_display = {
    --     "absolute",
    --     -- shorten = 3,
    -- },
  },
}

-- Loading extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local M = {}

function M.nvim_config_files()
    require('telescope.builtin').find_files{
        -- path_display = "tail",
        cwd = "~/.config/nvim",
        prompt_title = "Nvim Config Files",
    }
end

return M
