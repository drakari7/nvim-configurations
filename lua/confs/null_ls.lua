local formatting = require('null-ls').builtins.formatting
local diagnostics = require('null-ls').builtins.diagnostics

require("null-ls").setup({
  debug = true,
  sources = {
    formatting.prettier,
    formatting.stylua,
  },
})
