local opts = { noremap = true, silent = true }

local term_opts = { silent = true }


-- leader
vim.g.mapleader      = ';'
vim.g.maplocalleader = ';'


-- telescope



-- neo-tree
vim.keymap.set('n', '<leader>nt', ':Neotree filesystem left toggle<CR>', { desc = 'toggle file System' })
vim.keymap.set('n', '<leader>nf', ':Neotree filesystem focus<CR>', { desc = 'focus file System' })

