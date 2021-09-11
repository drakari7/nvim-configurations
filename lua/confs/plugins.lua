-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'            -- Packer manages itself

    -- Functionality plugins
    use 'windwp/nvim-autopairs'
    use 'famiu/bufdelete.nvim'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use 'mfussenegger/nvim-dap'
    -- use 'mfussenegger/nvim-dap-python'


end)
