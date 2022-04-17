local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

local ls = prequire('luasnip')

-- setting some configs
ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,

}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.goto_next_snip = function ()
  if ls and ls.expand_or_jumpable() then
    return t("<Plug>luasnip-expand-or-jump")
  end
  return ""
end

_G.goto_prev_snip = function ()
  if ls and ls.jumpable(-1) then
    return t("<Plug>luasnip-jump-prev")
  end
  return ""
end

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.goto_next_snip()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.goto_next_snip()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.goto_prev_snip()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.goto_prev_snip()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

-- Load some default snippets from friendly-snippets
require("luasnip.loaders.from_vscode").load()
