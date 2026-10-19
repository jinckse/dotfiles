-- define common options
-- (vim.keymap.set is non-recursive by default, so noremap isn't needed)
local opts = {
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.keymap.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
-- <cmd> runs the command directly, without entering command-line mode
vim.keymap.set('n', '<C-Up>', '<cmd>resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', '<cmd>resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
