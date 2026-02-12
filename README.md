## VIM COMMANDS:

select and configure text segments:
https://stackoverflow.com/questions/17890904/how-do-you-select-text-in-vim

## LEADER KEY
more information here:
https://gist.github.com/subfuzion/7d00a6c919eeffaf6d3dbf9a4eb11d64

it is set at the beginning of keymaps.lua. Currently it's set to ';' but it can simply be changed to any desired letter.
I will refer to the chosen key with <leader> from now on.

## for the Status bar i am using:
https://github.com/nvim-lualine/lualine.nvim

Options for design will become a thing in the future. (I think)
Currently I am using the Config from LinuxTage 2025 (NVIM Crash Course)

## telescope
https://github.com/nvim-telescope/telescope.nvim
with it's dependencies. I just used the recommended installation.

How to use it:
<leader>ff for fuzzyfind for finding files
<leader>fg for grep
<leader>fb open buffers
<leader>fh to open help tags

One way to close this window that works for me is Crl + C
additionally pressing <Esc> twice provides the same result

## Tree-sitter
Although I can't exactly explain what this is, I included it. It creates abstractions of your code for parsers.
You can add Language support or something like that for unsupported languages.
Link to the supported Languages that can ve added in the config (nvim-treesitter-config.lua in /.config/nvim/lua/config/): https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md

I've also added folding for functions etc. (einklappen)
You can turn this off my commeting the corresponding line in the config.

The commands to toggle Folding are:
zR: open all folded
zM: close all open folded
za: toggle the fold at the cursor (not your mouse cursor ;D )

## Which-Key
Because no human is capable of remembering all the keybindings just by reading them once.
I added the plugin "which-key": https://github.com/folke/which-key.nvim
This Plugin shows you the possible follows to the just pressed key in a box at the bottom.
If you want to disable that, just remove the file "which-key.lua"

## Filesystem (Neo-Tree)
Using neo-tree: https://github.com/nvim-neo-tree/neo-tree.nvim
The filesystem can be opened by using: ':Neotree'
I added a short command: <leader>nt to toggle the fileystem window (if it's opened this way, it's also focused). Can be changed in the keymaps.lua config file
<leader>nf to focus (and if needed open) the filesystem
To add files/directories inside of the filesystem use: 'a' for 'add'

