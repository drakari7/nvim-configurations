"--------------------Plugins Section -------------------------
call plug#begin('~/.config/nvim/plugged')

" TODO : modernise some plugins which have lua versions
" Functionality Plugins
Plug 'preservim/nerdtree'           " NerdTree
Plug 'jistr/vim-nerdtree-tabs'      " Nerdtree tabs supplement
Plug 'tpope/vim-unimpaired'         " Symmetric mappings
Plug 'tpope/vim-commentary'         " Easy comments
Plug 'tpope/vim-surround'           " change surroundings
" Plug 'jiangmiao/auto-pairs'         " Bracket auto pairing
Plug 'mhinz/vim-startify'           " Startpage
Plug 'vim-syntastic/syntastic'      " Linting
Plug 'gennaro-tedesco/nvim-peekup'  " Register management
Plug 'folke/which-key.nvim'         " easy keymap access

" Git integration
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git addition to nerdtree
Plug 'airblade/vim-gitgutter'       " Shows changed lines
Plug 'tpope/vim-fugitive'           " Git commands in nvim
Plug 'tpope/vim-rhubarb'            " Gives Gbrowse command

" Tab completion
Plug 'hrsh7th/nvim-compe'           " autocomplete with LSP
Plug 'SirVer/ultisnips'             " snippet engine
Plug 'honza/vim-snippets'           " Actual snippets

" LSP related plugins
Plug 'neovim/nvim-lspconfig'        " Basic LSP plugin
Plug 'glepnir/lspsaga.nvim'         " enhanced LSP features
Plug 'ray-x/lsp_signature.nvim'     " Function signatures
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do' : ':TSUpdate' }
Plug 'nvim-treesitter/playground'   " Testing and queries for treesitter
" TODO: take a look at treesitter objects

" Miscellaneous and temp
" Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
" TODO: checkout ctrlp

" Color schemes and appearance
Plug 'sainnhe/sonokai'
Plug 'tanvirtin/monokai.nvim'
Plug 'morhetz/gruvbox'
Plug 'rrethy/vim-hexokinase',   {'do': 'make hexokinase'}
Plug 'octol/vim-cpp-enhanced-highlight'

" Tags
Plug 'preservim/tagbar'             " Tags implementation
" Plug 'ludovicchabant/vim-gutentags' " generates tags

" File finding
Plug 'nvim-lua/popup.nvim'          " Telescope dependency
Plug 'nvim-lua/plenary.nvim'        " Telescope dependency
Plug 'nvim-telescope/telescope.nvim' "File finder and grep

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'lervag/vimtex'                " Latex
Plug 'iamcco/markdown-preview.nvim', {'do':{ -> mkdp#util#install()}, 'for':['markdown', 'vim-plug']}
call plug#end()
"------------------------------------------------------------
" Vim native options and settings
"------------------------------------------------------------
" Setting the neovim color scheme
set termguicolors
syntax enable
colorscheme gruvbox

" Some basic options
" TODO: lookup wildmenu
set number
set hidden
set whichwrap+=<,>,h,l,[,]
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab autoindent
set encoding=utf-8 fileencoding=utf-8 fileformat=unix
set noshowmode
set shortmess+=c
set clipboard+=unnamedplus
set ignorecase incsearch
set pumheight=15                " sets the pmenu height
set timeoutlen=1000
" set autochdir
set scrolloff=7
set splitbelow splitright       " split below instead of top

" Setting leader keys
let mapleader= ","
let maplocalleader = ","

" Mouse options
set mouse=a
let g:is_mouse_enabled = 1

" Enable filetype plugins
filetype plugin indent on
"------------------------------------------------------------
" Sourcing config files
"------------------------------------------------------------
source ~/.config/nvim/after/colors.vim
" source ~/.config/nvim/after/search.vim
" Airline settings
source ~/.config/nvim/after/airline.vim

lua require('plugins')
lua require('lsp_config')
lua require('compe_config')
lua require('tree_sitter')
lua require('lsp_saga')
lua require('which_key')
lua require('telescope_conf')
lua require('neorg_conf')
lua require('autopairs')
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
au BufNewFile *.cpp             0r ~/.config/nvim/templates/skeleton.cpp
au BufNewFile *.c               0r ~/.config/nvim/templates/skeleton.c
au BufNewFile *.tex             0r ~/.config/nvim/templates/skeleton.tex
au BufNewFile *.py              0r ~/.config/nvim/templates/skeleton.py
au BufNewFile ~/cp/cf/*.cpp     %delete|0r ~/.config/nvim/templates/cf_skel.cpp

" Executing code from within nvim
au FileType python  nnoremap <buffer> <leader>rr :w<CR>:!python3 %<CR>
au FileType sh      nnoremap <buffer> <leader>rr :w<CR>:!sh %<CR>
au FileType c       nnoremap <buffer> <leader>rr :w<CR>:!gcc % && ./a.out<CR>

" CPP different flag runs for CP
au FileType cpp     nnoremap <buffer> <leader>rr :w<CR>:!g++ -std=c++17 -Wshadow -Wall % && ./a.out<CR>
au FileType cpp     nnoremap <buffer> <leader>rt :w<CR>:!g++ -std=c++17 -Wshadow -Wall % && ./a.out < testfile<CR>
au FileType cpp     nnoremap <buffer> <leader>rf :w<CR>:!g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result % && ./a.out < testfile <CR>

" Open module documentation
au FileType python  nnoremap <leader>gc yiw:!open https://docs.python.org/3/library/<C-r>".html<CR><CR>

" Compiling latex files
au FileType tex     nnoremap <leader>rr :w<CR>:!pdflatex %<CR>
au FileType tex     nnoremap <leader>gc yi}:!open https://ctan.org/pkg/<C-r>"<CR><CR>

" Shortcuts for python
au Filetype python  nnoremap <leader>p Iprint(<ESC>A)<ESC>

"----------------------------------------------------------
" Plugin options
"----------------------------------------------------------
" Trigger configuration for UltiSnips.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>z"
let g:UltiSnipsJumpBackwardTrigger="<leader>Z"
let UltiSnipsEditSplit="vertical"

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
let g:syntastic_auto_jump = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_python_checkers = ["flake8", "pylint"]
let g:syntastic_stl_format = "errors: %e, warnings: %w"
let g:syntastic_quiet_messages = {
    \ "regex": ['docstring']
    \}

" Vimtex options
let g:tex_flavor = "latex"
" let g:vimtex_view_general_viewer = "zathura"

" Nerdtree settings
let g:NERDTreeDirArrowExpandable = '-'
let g:NERDTreeMinimalUI = 1
let NERDTreeWinSize = 25

" Tagbar options
let g:tagbar_width = 35
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" Git gutter
hi GitGutterAdd     guifg=#009900   ctermfg=Green
hi GitGutterChange  guifg=#bbbb00   ctermfg=Yellow
hi GitGutterDelete  guifg=#ff2222   ctermfg=Red
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" Hexokinase
let g:Hexokinase_highlighters = ['foregroundfull']

" Peekup
lua require('nvim-peekup.config').on_keystroke["delay"] = ''

"-----------------------------------------------------------
" Mappings for different plugins
"-----------------------------------------------------------
" General purpose vim shortcuts
nnoremap <silent> <space> :noh<CR><space>
nnoremap Y y$
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>vc :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>sh :!cp ~/custom_headers_cpp/* .<CR><CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>w <C-W><C-W>
nnoremap gz yi':!open https://github.com/<C-r>"<CR><CR>
nnoremap <leader>b "_d
vnoremap <leader>b "_d
nnoremap <leader>ya ggVGy
nnoremap gb :ls<CR>:b

" Move text around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" For floatterm
nnoremap <leader>tg :FloatermToggle<CR>
tnoremap <leader>tg <C-\><C-n>:FloatermToggle<CR>

" Shortcuts for file tree
map <leader>nn :NERDTreeTabsToggle<CR>
map <leader>nf :NERDTreeFocus<CR>

" Tag list toggle
map <leader>ta :TagbarToggle<CR>

" Git gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nnoremap <leader>hp :GitGutterPreviewHunk<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Syntastic mappings
nnoremap <leader>sc :SyntasticCheck<CR>

" Tree sitter show highlight group
nnoremap <leader>hi :TSHighlightCapturesUnderCursor<CR>

"------------------Miscellaneous----------------------------
" Open test file
nnoremap <leader>ot :call <SID>NewTestFile()<CR>
function! <SID>NewTestFile()
    let l:test_file = 'test.' . expand('%:e')
    execute ":tabe " . l:test_file
endfunc
