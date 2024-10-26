-- nvim-tree configuration
require('packer').startup(function()
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'  -- Add this line for icons
end)

require'nvim-tree'.setup {
  view = {
    width = 30,                  -- Width of the tree
    side = 'left',               -- Position of the tree (left or right)
    number = false,              -- Show line numbers
    relativenumber = false,      -- Show relative line numbers
    signcolumn = "no",           -- Disable sign column
  },
  filters = {
    dotfiles = false,            -- Show dotfiles
    custom = { "node_modules" }, -- Hide node_modules folder
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",           -- Default file icon
        symlink = "",           -- Symlink icon
        git = {
          unstaged = "✗",        -- Unstaged file icon
          staged = "✓",          -- Staged file icon
          untracked = "★",       -- Untracked file icon
          deleted = "",         -- Deleted file icon
          ignored = "◌",         -- Ignored file icon
        },
        folder = {
          default = "",         -- Folder icon
          open = "",            -- Open folder icon
          empty = "",           -- Empty folder icon
          empty_open = "",      -- Open empty folder icon
          symlink = "",         -- Symlink folder icon
        },
      },
    },
  },
}

-- Key mapping for toggling nvim-tree with Ctrl + A
vim.api.nvim_set_keymap('n', '<C-a>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

