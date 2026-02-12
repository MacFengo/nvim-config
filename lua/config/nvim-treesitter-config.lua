-- code copied from github page

require("nvim-treesitter").setup({
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site'

})

-- installing parsers
require("nvim-treesitter").install({'c', 'cpp','markdown'})

-- highlighting, add file types here
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'lua', 'cpp'},
    callback = function() vim.treesitter.start() end,
})

-- enable folding
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

-- enable indentation (spaces after pressing enter)
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
