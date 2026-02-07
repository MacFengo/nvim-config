local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)

-- Define mapleader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- Save by using ,w
keymap("n", "<Leader>w", ":w<CR>", { noremap = true })

-- " Surround word with {{ when pressing ,a (var in Ansible)
keymap("n", "<Leader>a", "viw<Esc>bi{{ <Esc>ea }}<Esc>", { noremap = true })
-- " Same as above, but also enclosed in double quotes "{{var}}"
keymap("n", "<Leader>aq", 'viw<Esc>bi"{{ <Esc>ea }}"<Esc>', { noremap = true })
-- " Enclose in () when pressing ,p (parenthesis)
keymap("n", "<Leader>p", "viw<Esc>bi(<Esc>ea)<Esc>", { noremap = true })
-- " Enclose in {} when pressing ,c (curly)
keymap("n", "<Leader>c", "viw<Esc>bi{<Esc>ea}<Esc>", { noremap = true })
-- Single quotes with ,sq
keymap("n", "<Leader>sq", "viw<Esc>bi'<Esc>ea'<Esc>", { noremap = true })
-- Double quotes with ,dq
keymap("n", "<Leader>dq", 'viw<Esc>bi"<Esc>ea"<Esc>', { noremap = true })
--  Insert current hosts IP address at cursor when pressing ,ip
-- BROKEN vim.api.nvim_set_keymap('n', '<Leader>ip', [[:execute 'normal! i' .. vim.fn.system("ifconfig\\|awk '/broadcast/ {print $2}'")<CR>dd]], { noremap = true })
