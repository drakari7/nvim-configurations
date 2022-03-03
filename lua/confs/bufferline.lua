require 'bufferline'.setup(
  {
    options = {
      -- numbers = function (opts)
        --   return string.format('%s', opts.ordinal)
        -- end,
        -- mappings = true,
        -- max_name_length = 18,
        -- max_prefix_length = 15, -- prefix used when a buffer is deduplicated
        -- tab_size = 18,
        -- diagnostics = "nvim_lsp",
        -- show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = true,
        -- show_tab_indicators = true,
        -- persist_buffer_sort = true,
        -- separator_style = "thin",
      }
  }
)
