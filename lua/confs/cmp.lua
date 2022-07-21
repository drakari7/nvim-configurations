local cmp = require'cmp'

vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
  mapping = {
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },

  sources = {
    { name = 'nvim_lsp', keyword_length = 2 },
    { name = 'nvim_lua'},
    -- { name = 'ultisnips' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 },
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)      -- for luasnip
      -- vim.fn["UltiSnips#Anon"](args.body)  -- For `ultisnips` users.
    end,
  },

  formatting = {
    format = function (entry, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 1, 35)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[API]",
        path = "[Path]",
        luasnip = "[LuaSnip]",
        ultisnips = "[UltiSnips]",
        buffer = "[Buf]",
      })[entry.source.name]

      return vim_item
    end
  },

  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer', keyword_length = 2 }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline', keyword_length = 2 }
  })
})
