-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'              -- Packer manages itself

  -- LSP and nvim core
  use 'neovim/nvim-lspconfig'               -- Basic LSP plugin
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'williamboman/nvim-lsp-installer'
  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'

  -- Functionality plugins
  use 'windwp/nvim-autopairs'               -- Autoclose brackets
  use 'famiu/bufdelete.nvim'                -- Delete buffers nicely
  use 'tyru/open-browser.vim'               -- Open links with gx
  use 'tpope/vim-unimpaired'                -- Symmetric mappings
  use 'tpope/vim-commentary'                -- Easy comments
  use 'tpope/vim-surround'                  -- change surroundings
  use 'tpope/vim-repeat'                    -- For repeating stuff
  use 'mhinz/vim-startify'                  -- Startpage
  use 'folke/which-key.nvim'                -- easy keymap guide
  use 'lukas-reineke/indent-blankline.nvim' -- Indentation lines

  use {'kyazdani42/nvim-tree.lua',          -- File tree
    requires = 'kyazdani42/nvim-web-devicons' -- Icons
  }
  -- Temporary and homeless plugins
  use 'dstein64/vim-startuptime'            -- Measure startup performance

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim'
  }
  use 'tpope/vim-fugitive'                  -- Git commands in nvim
  use 'tpope/vim-rhubarb'                   -- Gives Gbrowse command

  -- SpeedUp
  use 'nathom/filetype.nvim'
  use 'lewis6991/impatient.nvim'

  -- LSP related plugins
  use 'simrat39/symbols-outline.nvim'       -- Symbol table
  use 'ray-x/lsp_signature.nvim'            -- Function signatures
  use 'jose-elias-alvarez/null-ls.nvim'     -- Formatting

  -- Debugging
  use 'mfussenegger/nvim-dap'               -- Debugging engine
  use 'rcarriga/nvim-dap-ui'                -- UI and overlay
  use 'theHamsta/nvim-dap-virtual-text'     -- Virtual text summary

  -- Terminal wrapper
  use 'akinsho/toggleterm.nvim'             -- better terminal

  -- Completion Plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  -- use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- Snippets
  -- use 'SirVer/ultisnips'
  -- use 'honza/vim-snippets'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'        -- Some default snippets

  -- Telescope
  use 'nvim-telescope/telescope.nvim'       --File finder and grep
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Colors and aesthetics
  use 'norcalli/nvim-colorizer.lua'         -- Color hexcodes
  use 'ellisonleao/gruvbox.nvim'

  -- Statusline and bufferline
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'


  -- Language specific plugins
  use 'lervag/vimtex'                       -- Latex
  use {
    'iamcco/markdown-preview.nvim',         -- Markdown preview
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
  }
end)
