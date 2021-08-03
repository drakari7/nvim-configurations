-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use {
    --     'nvim-treesitter/nvim-treesitter',
    --     branch = '0.5-compat',
    --     run = ':TSUpdate',
    -- }

    -- use 'nvim-treesitter/playground'

end)
