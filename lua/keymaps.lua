-- Window navigation (Normal mode)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Window navigation (Insert mode)
vim.api.nvim_set_keymap('i', '<C-h>', '<C-o>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-o>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<C-o>l', { noremap = true, silent = true })

-- Moving lines (Normal mode)
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Moving lines (Insert mode)
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })

-- Moving lines (Visual mode)
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Remap jj to Esc in insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Terminal mode mappings
vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Insert a new line in insert mode
vim.api.nvim_set_keymap('i', '<C-Enter>', '<Esc>o', { noremap = true, silent = true })

-- Resize splits
vim.api.nvim_set_keymap('n', '<A-M>', ':vertical res +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-?>', ':vertical res -1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-m>', ':res +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-/>', ':res -1<CR>', { noremap = true, silent = true })

-- Scrolling in normal and visual modes
vim.api.nvim_set_keymap('n', '<S-k>', '<C-u>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-j>', '<C-d>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-k>', '<C-u>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-j>', '<C-d>j', { noremap = true, silent = true })

-- Jump to beginning and end of the line
vim.api.nvim_set_keymap('n', '<S-l>', '<S-$>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', '<S-^>', { noremap = true, silent = true })

-- Change text inside quotes or something with 'ci'
vim.api.nvim_set_keymap('n', ';', 'ci', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-;>', 'ci"', { noremap = true, silent = true })
