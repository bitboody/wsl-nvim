-- Load keymaps
require('keymaps')

-- LSP config 
require('lsp')

-- nvim-tree 
require('tree')

--  Autoclose
require('autoclose').setup()

-- Change colorscheme
vim.cmd('colorscheme solarized')

-- Basic Neovim settings
vim.o.number = true                 -- Show line numbers
vim.o.relativenumber = true         -- Show relative line numbers
vim.o.clipboard = "unnamedplus"     -- Use system clipboard
vim.o.tabstop = 4                   -- Number of spaces that a <Tab> counts for
vim.o.shiftwidth = 4                -- Number of spaces to use for each step of (auto)indent
vim.o.expandtab = true              -- Convert tabs to spaces
vim.o.autoindent = true             -- Copy indent from current line when starting a new line
vim.o.smartindent = true            -- Smart auto-indenting

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Save and quit
map('n', '<C-s>', ':w<CR>', opts)             -- Save with Ctrl+s in normal mode
map('i', '<C-s>', '<Esc>:w<CR>', opts)        -- Save with Ctrl+s in insert mode
map('n', '<C-q>', ':q<CR>', opts)             -- Quit with Ctrl+q in normal mode
map('i', '<C-q>', '<Esc>:q<CR>', opts)        -- Quit with Ctrl+q in insert mode

-- Clipboard copy and paste
map('v', '<C-c>', '"+y', opts)                -- Copy to system clipboard with Ctrl+c in visual mode
map('n', '<C-v>', '"+p', opts)                -- Paste from system clipboard with Ctrl+v in normal mode
map('i', '<C-v>', '<C-r>+', opts)             -- Paste from system clipboard with Ctrl+v in insert mode

-- Optionally, you can install plugins with packer.nvim
-- Example:
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Plugin manager
  use 'maxmx03/solarized.nvim' 
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'm4xshen/autoclose.nvim'
end)
