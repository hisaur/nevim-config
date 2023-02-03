vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<CR>', {noremap = true , silent = true})
vim.keymap.set('n', '<Leader>f', ':NvimTreeFocus<CR>',{noremap = true , silent = true})

vim.api.nvim_set_keymap('n', '<Leader>f',':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-[>','<C-\\><C-n>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>t',':ToggleTerm<CR>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>q',':bdelete!<CR>',{noremap = true, silent = true})
-- Copy to system clipboard. Useful for X11 sessions.
vim.api.nvim_set_keymap('v', '<C-y>','"*y',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>','"*p',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-P>','"*P',{noremap = true, silent = true})
