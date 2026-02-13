local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local keymap = vim.keymap -- for easier typing


-- leader
vim.g.mapleader      = ';'
vim.g.maplocalleader = ';'


-- telescope



-- neo-tree
keymap.set('n', '<leader>nt', ':Neotree filesystem left toggle<CR>', { desc = 'toggle file System' })
keymap.set('n', '<leader>nf', ':Neotree filesystem focus<CR>', { desc = 'focus file System' })


-- autocompletion for LSP
keymap.set('i', '<C-Space>', function()
  vim.lsp.completion.get()
end)

-- key maps for LSP usage

local opts = { silent = true }

-- set keybinds
opts.desc = "Show LSP references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

opts.desc = "Go to declaration"
keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- show lsp declaration

opts.desc = "Show LSP definition"
keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definition

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

opts.desc = "See available code actions"
keymap.set({"n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection!

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename, choose a new text for the selected text

opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics (i.e. errors and warnings) for file

opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", function ()
  vim.diagnostic.jump({ count = -1, float = true})
end, opts) -- jump to the previous diagnostic in the buffer

opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", function ()
  vim.diagnostic.jump({ count = 1, float = true})
end, opts) -- jump to the next diagnostic in the buffer

-- inlay hints, tells you which function argument (the name) the one you provided to it corresponds to. You can disable/enable depending on your preference
vim.lsp.inlay_hint.enable(true)

-- different symbols for default LSP symbols, can be changed arbitrarily
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
