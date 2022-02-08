require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained", or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "vim" },

    additional_vim_regex_highlighting = false,
  },
}
