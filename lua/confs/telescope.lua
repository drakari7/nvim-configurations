local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
   layout_strategy = 'horizontal',
    layout_config = {
        preview_width = 0.55,
    },
    prompt_prefix = "   ",
    results_title = false,
    file_ignore_patterns = {
      "__pycache__/",
    },
  },
}

-- Loading extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local M = {}

function M.nvim_config_files()
    require('telescope.builtin').find_files{
        cwd = "~/.config/nvim",
        prompt_title = "Nvim Config Files",
    }
end

return M
