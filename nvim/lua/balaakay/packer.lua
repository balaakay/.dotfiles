
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'folke/tokyonight.nvim'}
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'moon',
        -- disable_background = true,
        styles = {
          italic = false,
        },
      })
    end
  })

  use {
	  'nvim-telescope/telescope.nvim',--, tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use {'nvim-treesitter/playground'}
  use {
    'theprimeagen/harpoon',
    -- branch = "harpoon2",
    requres = { {"nvim-lua/plenary.nvim"} }
  }
  use {'mbbill/undotree'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-dadbod'}
  use {'kristijanhusak/vim-dadbod-completion'}
  use {'kristijanhusak/vim-dadbod-ui'}
  -- use {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'}
  use 'saadparwaiz1/cmp_luasnip'   -- LuaSnip completion source for nvim-cmp
  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim'
  }


  end)
