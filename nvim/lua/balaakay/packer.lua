
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
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
    branch = "harpoon2",
    requres = { {"nvim-lua/plenary.nvim"} }
  }
  use {'mbbill/undotree'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-dadbod'}
  use {'kristijanhusak/vim-dadbod-completion'}
  use {'kristijanhusak/vim-dadbod-ui'}
  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use {'williamboman/mason.nvim'}    -- Language server installer
  use {'williamboman/mason-lspconfig.nvim'} -- Integration between mason and lspconfig
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use 'L3MON4D3/LuaSnip'           -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip'   -- LuaSnip completion source for nvim-cmp


  end)
