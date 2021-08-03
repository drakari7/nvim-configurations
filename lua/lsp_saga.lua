local saga = require 'lspsaga'

-- add your config value here
-- default value

saga.init_lsp_saga {
use_saga_diagnostic_sign = true,
error_sign = '',
warn_sign = '',
hint_sign = '',
infor_sign = '',
dianostic_header_icon = '',
code_action_icon = '',
code_action_prompt = {
  enable = true,
  sign = true,
  sign_priority = 20,
  virtual_text = true,
},
finder_definition_icon = '',
finder_reference_icon = '',
max_preview_lines = 12, -- preview lines of lsp_finder and definition preview
finder_action_keys = {
  open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-j>', scroll_up = '<C-k>' -- quit can be a table
},
code_action_keys = {
  quit = {'q', '<Esc>'},exec = '<CR>'
},
rename_action_keys = {
  quit = '<Esc>',exec = '<CR>'  -- quit can be a table
},
definition_preview_icon = '',
border_style = "single",
rename_prompt_prefix = '>',
}

local function set_keymap(...) vim.api.nvim_set_keymap(...) end


local opts = { silent=true, noremap=true }

-- set_keymap('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
-- set_keymap('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
-- set_keymap('n', 'K', "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", opts)
set_keymap('n', '<leader>sr', "<cmd>lua require'lspsaga.rename'.rename()<CR>", opts)
-- set_keymap('n', 'gs', "<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>", opts)
set_keymap('n', '<leader>ca', "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
set_keymap('v', '<leader>ca', "<C-U>lua require'lspsaga.codeaction'.range_code_action()<CR>", opts)
-- set_keymap('n', '<leader>de', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
-- set_keymap('n', '[d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
-- set_keymap('n', ']d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

-- set_keymap('n', '<C-j>', "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", opts)
-- set_keymap('n', '<C-k>', "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", opts)

