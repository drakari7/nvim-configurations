require("nvim-lsp-installer").setup{
  automatic_installation = true,
}
local nvim_lsp = require('lspconfig')

local opts = { noremap=true, silent=true }

-- ['─', '│', '─', '│', '┌', '┐', '┘', '└']
local border = {
    {"┌", "FloatBorder"},
    {"─", "FloatBorder"},
    {"┐", "FloatBorder"},
    {"│", "FloatBorder"},
    {"┘", "FloatBorder"},
    {"─", "FloatBorder"},
    {"└", "FloatBorder"},
    {"│", "FloatBorder"},
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
  ["textDocument/signature_help"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'}),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false,}),
}

-- Change diagnostic settings
vim.diagnostic.config({
  signs = false,
  underline = true,
})

-- lsp_signature options and settings
local lsp_signature_cfg = {
  bind = true,
  doc_lines = 7,
  floating_window = false,
  fix_pos = true,
  hint_enable = true,
  hint_prefix = "> ",
  hint_scheme = "String",
  hi_parameter = "Search",
  max_height = 3,
  max_width = 40,
  handler_opts = {
    border = "rounded"
  },
}


vim.api.nvim_set_keymap('n', '<leader>de', '<cmd>lua vim.diagnostic.open_float({border = "rounded"})<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({float = { border = "rounded" }})<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({float = { border = "rounded" }})<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- attaching lsp_signature
  require('lsp_signature').on_attach(lsp_signature_cfg)

  -- Mappings.
  --   See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>sr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap("n", "<leader>fo", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workleader_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workleader_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workleader_folders()))<CR>', opts)
end


-- capabilities from nvim cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  -- "jedi_language_server",
  "pyright",
  "clangd",
  "vimls",
  "tsserver",
  "texlab",
  "bashls",
  "gopls",
  "html",
  "cssls",
  "html",
  "sumneko_lua"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    single_file_support = true,
    capabilities = capabilities,
    handlers = handlers,
  }
end


-- Installing lua language server separately
-- local sumneko_root_path = "/Users/shreyash/git/lua-language-server"
-- local sumneko_binary = "/Users/shreyash/git/lua-language-server/bin/macOS/lua-language-server"

-- nvim_lsp.sumneko_lua.setup {
--     cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--     settings = {
--         Lua = {
--             runtime = {
--                 version = 'LuaJIT',
--                 path = vim.split(package.path, ';')
--             },
--             diagnostics = {
--                 globals = {'vim'}
--             },
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--         },
--     },
--     on_attach = on_attach,
--     handlers = handlers,
-- }
