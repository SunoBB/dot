local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end
vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer itself
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim' -- Theme

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip' -- Snippet engine
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'nvim-lua/plenary.nvim' -- Utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/bufferline.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/lspsaga.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/dashboard-nvim'
  use { 'andweeb/presence.nvim', config = "require('presence-config')" }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'akinsho/toggleterm.nvim'
end)
