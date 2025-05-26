require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "cssls",
    "html",
    "eslint",
    "ts_ls",
    "pylsp",
    "sqlls",
    "vuels",
    "jdtls"
  }
})

-- LSP Attach function for keybindings
---@diagnostic disable-next-line: unused-local
local function lsp_attach(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
end

vim.diagnostic.config({
  signs = true,
  sign_highlight = true,
  virtual_text = true, -- Enable virtual text
  underline = false, -- Disable underline
  update_in_insert = false, -- Disable updates while in insert mode
})

-- Default capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Default config for all LSP servers
local default_config = {
  on_attach = lsp_attach,
  capabilities = capabilities,
}

-- Setup each LSP server
local lspconfig = require('lspconfig')

-- Get the list of installed servers from mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")
local installed_servers = mason_lspconfig.get_installed_servers()

-- Set up each installed server with our default config
for _, server_name in ipairs(installed_servers) do
  -- Special configuration for specific servers
  if server_name == "lua_ls" then
    lspconfig.lua_ls.setup(vim.tbl_extend('force', default_config, {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
        },
      },
    }))
  elseif server_name == "pylsp" then
    -- Add your special pylsp config if needed
    lspconfig.pylsp.setup(default_config)
  else
    -- Default setup for most servers
    lspconfig[server_name].setup(default_config)
  end
end

-- Configure nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = "vim-dadbod-completion" },
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-y>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
  }
})
