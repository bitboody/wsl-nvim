-- Mute annoying warnings
vim.opt.shortmess:append("c") -- Suppress completion messages
vim.notify = function() end -- Disable notifications entirely

-- Load keymaps
require('keymaps')

-- nvim-tree 
require('tree')

--  Autoclose
require('autoclose').setup()

-- Change colorscheme
vim.cmd([[colorscheme solarized]])

-- lualine setup
require('lualine').setup {
  options = {
    theme = 'solarized',
  },
}

-- Bootstrap packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Auto-reload Neovim whenever this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

-- Plugin setup
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'm4xshen/autoclose.nvim'
  use 'maxmx03/solarized.nvim'

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Treesitter for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  -- Git integration
  use 'lewis6991/gitsigns.nvim'

  -- Colorscheme
  use 'gruvbox-community/gruvbox'

  -- Sync packer if it's a fresh install
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- General settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- nvim-tree setup
require('nvim-tree').setup {}

-- gitsigns setup
require('gitsigns').setup {}

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript", "html", "css", "c" },
  highlight = {
    enable = true,
  },
}

-- LSP settings
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls', 'pyright', 'tsserver' },
}
local lspconfig = require('lspconfig')
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

-- for _, server in ipairs({ 'lua_ls', 'pyright', 'tsserver' }) do
--   lspconfig[server].setup { on_attach = on_attach }
-- end

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
})

-- Keybindings
vim.g.mapleader = ' '

