vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.wo.relativenumber=true
vim.opt.fillchars = {eob = " "}
require("config.lazy")
--Key Bind
--Change Tab
vim.keymap.set('n', '<Leader>w', ':write<CR>')
vim.keymap.set('n', '<Leader>a', ':wqa<CR>')
vim.keymap.set('n', '<Leader>x', ':wq<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')
---- Insert mode
vim.keymap.set('i', ';w', '<esc>:write<CR>')
vim.keymap.set('i', ';x', '<esc>:wq<CR>')
vim.keymap.set('i', ';a', '<esc>:wqa<CR>')

-- map for quick open the file init.lua
vim.keymap.set('n', '<leader>nv', ':vsplit ~/.config/nvim/init.lua<cr>', {})


vim.keymap.set('n','<leader>-', 'g-', {})
vim.keymap.set('n','<leader>=', 'g+', {})

vim.keymap.set('n','<leader>te', ':terminal<CR>i', {})

