local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local keymap = vim.keymap -- for easier typing


-- leader
vim.g.mapleader      = ';'
vim.g.maplocalleader = ';'

-- inspiration: https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/core/keymaps.lua
-- window management
opts.desc = "Split window vertically"
keymap.set("n", "<leader>sv", "<C-w>v", opts)

opts.desc = "Split window horizontally"
keymap.set("n", "<leader>sh", "<C-w>s", opts)

opts.desc = "Make splits equal size" 
keymap.set("n", "<leader>se", "<C-w>=", opts)

opts.desc = "Close current split"
keymap.set("n", "<leader>sq", "<C-w>q", opts)

-- changing between splits

opts.desc = "Switch to split on the left"
keymap.set("n", "<C-h>", "<C-w>h", opts)

opts.desc = "Switch to split on the bottom (down)"
keymap.set("n", "<C-j>", "<C-w>j", opts)

opts.desc = "Switch to split on the top (up)"
keymap.set("n", "<C-k>", "<C-w>k", opts)

opts.desc = "Switch to split on the right"
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- save with Ctrl + s
keymap.set("i", "<C-s>", "<esc><cmd>w<CR>i", opts)

-- tab management

opts.desc = "Open new tab"
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", opts) -- open a new tab

opts.desc = "Close current tab"
keymap.set("n", "<leader>tw", "<cmd>tabclose<CR>", opts) -- close current tab

opts.desc = "Go to [n]ext tab"
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts) -- go to next tab

opts.desc = "Go to [p]revious tab"
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts) -- go to previous tab


-- telescope



-- neo-tree
keymap.set('n', '<leader>nt', ':Neotree filesystem left toggle<CR>', { desc = 'toggle file System' })
keymap.set('n', '<leader>nf', ':Neotree filesystem focus<CR>', { desc = 'focus file System' })


-- autocompletion for LSP
keymap.set('i', '<C-Space>', function()
  vim.lsp.completion.get()
end)

-- ===================================================================
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



-- terminal
opts.desc = "Open and Close Terminal"
keymap.set({"n", "t", "i"}, "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", opts)






