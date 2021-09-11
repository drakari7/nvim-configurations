vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 20;
  max_kind_width = 20;
  max_menu_width = 30;
  documentation = {
    border = "rounded", -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 75,
    min_width = 30,
    max_height = math.floor(vim.o.lines* 0.4),
    min_height = 1,
  };
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    ultisnips = true;
  };
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.tab_complete()
  if check_back_space() then
      return t"<tab>"
  elseif vim.fn.pumvisible() == 1 then
    return t"<C-n>"
  else
    return t"<tab>"
  end
end

function _G.s_tab_complete()
  if vim.fn.pumvisible() == 1 then
    return t"<C-p>"
  else
    return t"<S-tab>"
  end
end

local opts = { expr = true, noremap = true }
vim.api.nvim_set_keymap("i", "<tab>", "v:lua.tab_complete()", opts)
vim.api.nvim_set_keymap("s", "<tab>", "v:lua.tab_complete()", opts)
vim.api.nvim_set_keymap("i", "<S-tab>", "v:lua.s_tab_complete()", opts)
vim.api.nvim_set_keymap("s", "<S-tab>", "v:lua.s_tab_complete()", opts)
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
