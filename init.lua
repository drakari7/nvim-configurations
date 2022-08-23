vim.opt.termguicolors = true
--------------------------------------------------------------
-- Sourcing config files
-------------------------------------------------------------

require('confs.packer')
require('confs.tree_sitter')
require('confs.lsp_config')
require('confs.autopairs')
require('confs.cmp')
require('confs.gitsigns')
require('confs.which_key')
require('confs.nvimtree')
require('confs.symbols')
require('confs.lualine')
require('confs.toggleterm')
require('confs.luasnip')
require('confs.bufferline')
-- require('confs.colorizer')
require('confs.telescope')
require('confs.dap')
require('confs.null_ls')

vim.cmd([[
" For startup speed
lua require('impatient')

"------------------------------------------------------------
" Vim native options and settings
"------------------------------------------------------------
syntax enable

" Some basic options
" TODO: lookup wildmenu
set number
set hidden
set whichwrap+=<,>,h,l,[,]

" Tabs
set autoindent
set cindent
set wrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set breakindent
set linebreak
set showbreak=>

set encoding=utf-8 fileencoding=utf-8 fileformat=unix
set noshowmode
" set cursorline
set shortmess+=c
set clipboard+=unnamedplus
set ignorecase incsearch
set pumheight=15                " sets the pmenu height
set pumblend=10
set timeoutlen=1000
" set autochdir
set scrolloff=5
set splitbelow splitright       " split below instead of top
set conceallevel=0
" set textwidth=70

" listchars
set list
set lcs=
set lcs+=eol:¬
set lcs+=tab:»·
set lcs+=trail:·
set lcs+=extends:<
set lcs+=precedes:>
set lcs+=conceal:┊
set lcs+=nbsp:␣

" Setting leader keys
let mapleader= ","
let maplocalleader = ","

" Mouse options
set mouse=a
let g:is_mouse_enabled = 1

" Enable filetype plugins
filetype plugin indent on
"------------------------------------------------------------
" Language specific settings here
"------------------------------------------------------------
" Setting up python3 for neovim
let g:python3_host_prog = '/usr/local/bin/python3'

" C++ syntax highlighting
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Latex settings
let g:tex_flavor = "latex"

" Templates for different types of files
au BufNewFile *.c               0r ~/.config/nvim/templates/skeleton.c
au BufNewFile *.tex             0r ~/.config/nvim/templates/skeleton.tex

" Executing code from within nvim
au FileType python  nnoremap <buffer> <leader>rr :w<CR>:!python3 %<CR>
au FileType sh      nnoremap <buffer> <leader>rr :w<CR>:!sh %<CR>
au FileType c       nnoremap <buffer> <leader>rr :w<CR>:!gcc % && ./a.out<CR>
au FileType go      nnoremap <buffer> <leader>rr :w<CR>:!go run %<CR>
au FileType haskell nnoremap <buffer> <leader>rr :w<CR>:!runhaskell %<CR>
au FileType lua     nnoremap <buffer> <leader>rr :w<CR>:!lua %<CR>

" CPP different flag runs for CP
au FileType cpp     nnoremap <buffer> <leader>rr :w<CR>:!g++ -std=c++17 % && ./a.out<CR>
au FileType cpp     nnoremap <buffer> <leader>rt :w<CR>:!g++ -std=c++17 % && ./a.out < testfile<CR>
au FileType cpp     nnoremap <buffer> <leader>rc :w<CR>:!g++ -g -std=c++17 %<CR>

" Haskell testfile run
au FileType haskell nnoremap <buffer> <leader>rt :w<CR>:!runhaskell % < testfile<CR>

" Open module documentation
au FileType python  nnoremap <leader>gc yiw:!open https://docs.python.org/3/library/<C-r>".html<CR><CR>

" Open help for options in vimrc
au FileType vim     nnoremap <leader>gc yiw:vert h <C-r>"<CR>

" Compiling latex files
au FileType tex     nnoremap <leader>gc yi}:!open https://ctan.org/pkg/<C-r>"<CR><CR>
au FileType tex     nnoremap <leader>ls :VimtexCompileSS<CR>

" Shortcuts for python
au Filetype python  nnoremap <leader>p Iprint(<ESC>A)<ESC>

" Open vim plugins in github
au Filetype vim     nnoremap <leader>gh yiw:vert h <C-r>"<CR>
au Filetype vim     nnoremap <leader>gc yi':!open https://github.com/<C-r>"<CR><CR>
au Filetype lua     nnoremap <leader>gc yi':!open https://github.com/<C-r>"<CR><CR>

" Open Markdown preview
au Filetype markdown nnoremap <leader>mp :MarkdownPreviewToggle<CR>
"----------------------------------------------------------
" Plugin options
"----------------------------------------------------------
" Vimtex options
let g:tex_flavor = "latex"
" let g:vimtex_view_general_viewer = "zathura"
let g:vimtex_quickfix_ignore_filters = [
    \ 'Underfull',
    \ 'Overfull',
    \]

" Startify options
let g:startify_custom_header = 'startify#fortune#quote()'
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [
            \ {'c': '~/.config/nvim/init.lua'},
            \ {'p': '~/.config/nvim/lua/confs/packer.lua'},
            \ {'n': '~/notes/todo.md'},
            \ {'tc': '~/random/test.cpp'},
            \ {'tp': '~/random/test.py'},
            \ {'th': '~/random/test.hs'},
            \ {'tl': '~/random/test.lua'},
            \ {'tx': '~/random/test.tex'},
            \ {'bl': '~/notes/bucket_list.md'},
            \ ]

" Symbol outline
nnoremap <silent> <leader>ta :SymbolsOutline<CR>

" Openbrowser settings
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Indent blankline
let g:indent_blankline_buftype_exclude = ['terminal', 'nofile']

"-----------------------------------------------------------
" Mappings for different plugins
"-----------------------------------------------------------
" General purpose vim shortcuts
nnoremap <silent> <space> :noh<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>ss :so ~/.config/nvim/lua/confs/snippets.lua<CR>
nnoremap <leader>vc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>pc :e ~/.config/nvim/lua/confs/packer.lua<CR>
nnoremap <leader>nc :e ~/notes/todo.md<CR>
nnoremap <leader>sh :!cp ~/custom_headers_cpp/* .<CR><CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>w <C-W><C-W>
nnoremap <leader>bb "_d
vnoremap <leader>bb "_d
nnoremap <leader>ya mmggVGy'm
nnoremap gb :ls<CR>:b<space>
nnoremap <leader>bd :Bd<CR>
nnoremap <leader>ps :PackerSync<CR>
nnoremap <leader>cd :cd %:p:h<CR>

" Better navigation
nnoremap n nzz
nnoremap N Nzz
nnoremap ]c ]czz
nnoremap [c [czz

" Move text around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Shortcuts for file tree
nnoremap <leader>nn :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>

" Bufferline commands
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent>[b :BufferLineCyclePrev<CR>

" Nvim dap mappings
nnoremap <silent> <leader>dn :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>sn :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>si :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>so :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>dc :lua require'dap'.close()<CR>

nnoremap <silent> <leader>br :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>

" Nvim dap ui mappings
nnoremap <silent> <leader>dt :lua require'dapui'.toggle()<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bf <cmd>Telescope buffers<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fv <cmd>lua require('confs.telescope').nvim_config_files()<CR>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<CR>

" Tree sitter show highlight group
nnoremap <leader>hi :tshighlightcapturesundercursor<cr>
nnoremap <leader>cp "ayiw~h"byw:%s/<C-R>a/<C-R>b/g<CR>
"------------------Miscellaneous----------------------------
" Open test file
" nnoremap <silent> <leader>ot :call <SID>NewTestFile()<CR>
" function! <SID>NewTestFile()
"     let l:test_file = 'test.' . expand('%:e')
"     execute ":e ~/random/" . l:test_file
" endfunc
" 
" source ~/.config/nvim/after/colors.vim
" 
" nnoremap <silent> <leader>mt :call <SID>MakeTransparent()<CR>
" function! <SID>MakeTransparent()
"     execute ":hi Normal guibg=None"
"     execute ":hi EndOfBuffer guibg=None"
"     execute ":hi SignColumn guibg=None"
"     execute ":hi LineNr guibg=None"
" endfunc

" Manually source at the end
source ~/.config/nvim/after/colors.vim
]])
