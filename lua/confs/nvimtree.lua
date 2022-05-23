require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,

  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },

  update_cwd          = false,
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = math.floor(vim.o.columns * 0.2),
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  git = {
    enable = false,
  },
  filters = {
    dotfiles = true,
    custom = {
      '__pycache__',
    }
  },
}
