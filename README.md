## VIM COMMANDS:

select and configure text segments:
https://stackoverflow.com/questions/17890904/how-do-you-select-text-in-vim

use :qa to quit everything(all) and not get stuck in the filesystem

To open window commands use: <Ctrl>w
I remapped some of the commands: (just press <leader>s and you will see the options :D)
<leader>sv - splits window vertically
<leader>sh - splits window horizontally
<leader>sq - to close split

To switch between splits use:
<Ctrl>h: left
<Ctrl>j: down
<Ctrl>k: up
<Ctrl>l: right

I added the option of using Ctrl + s to save the current document. It will automatically reenter insert mode. (Also it can only be used inside of insert mode)

Ctrl + w inside of insert to delete current content of line, or line if empty

Using Tabs:
I remapped the commands to:
<leader>t
Just read through them. Can also be changed! (obviously)

https://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
To go to a functions definition:
<Ctrl>]

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

I've also added folding for functions etc. (german: einklappen)
You can turn this off my commeting the corresponding line in the config.

The commands to toggle Folding are:
zR: open all folded
zM: close all open folded
za: toggle the fold at the cursor (not your mouse cursor ;D )

Folds are currently open on entry. You can changes this by removing the line in options.lua

## Which-Key
Because no human is capable of remembering all the keybindings just by reading them once.
I added the plugin "which-key": https://github.com/folke/which-key.nvim
This Plugin shows you the possible follows to the just pressed key in a box at the bottom.
If you want to disable that, just remove the file "which-key.lua"

i added a config in which you can also specifiy groups for your keymaps. Such that pressing <leader>b whill e.g. tell you these are debugger commands.

## Filesystem (Neo-Tree)
Using neo-tree: https://github.com/nvim-neo-tree/neo-tree.nvim
The filesystem can be opened by using: ':Neotree'
I added a short command: <leader>nt to toggle the fileystem window (if it's opened this way, it's also focused). Can be changed in the keymaps.lua config file
<leader>nf to focus (and if needed open) the filesystem
To add files/directories inside of the filesystem use: 'a' for 'add'

to open the selected file as a split use: s and S
s: vertically    (small s)
S: horizontally  (big S)

to open it in a new tab: 't'

## LSP: Language Server Protocol
using mason: https://github.com/mason-org/mason.nvim
Servers can be installed using :Mason. I didn't find a good source for which language corresponds to which server yet :/

In general: 
You can edit the lsp-plugin.lua file under plugins. Add the Language servers you want under the "ensured_installed" section!
Other more complicated option: You choose a Server, Install it via Mason (:Mason) and then you need to add it to lsp-config, this way you don't have to write the config yourself.
Important: don't change the order the plugins are loaded, lsp-config has to come last!

Currently I added support for C, C++ and Lua (scripting language of nvim).

Autocompletion automatically pops up if the language requests it (e.g. after a dot '.').
Or you can just use Ctrl + Space, which should be known from e.g. VS Code. (This can be configured as well obviously - in keymaps.lua)

Default buildin Commands:
while something press: K (shift + k) to open the documentation
also you can press grn: to rename the function

more can be found here: https://neovim.io/doc/user/lsp.html#_defaults

Commands I added from different sources:
<leader>D shows the diagnostics buffer of the code. -> that means warnings, errors etc. What you would see if you hovered a warning/error in vscode but for the whole file
<leader>d shows the diagnostics only for the current line, exactly what you would see when hovering a line
with '\[d' and 'd\]' you can jump to the previous and to the next diagnostic in the buffer.

Also if you don't want to see inlay hints, you can also disable them in the config (keymaps)!

additionally, if you want different symbols for error markins etc. in the code. You can configure them there as well!

How to jump to a declaration/definition of a variable/struct/class etc.?
<leader>g + D/d (see text)

<leader>gt + D/d opens a new tab with the declaration/definition instead of opening it in the current tab!

## Dashboard
added a dashboard from: https://github.com/goolord/alpha-nvim
there are also different themes. Check it out of interested. I liked this version the most!

## autopairs
does what the name says. Creates autopairs! e.g. when typing " it will make it "<your cursor is here>"

## The Terminal incident:
https://neovim.io/doc/user/terminal.html
There are default options for terminals in neovim. Like: ':terminal'
To exit this terminal you have to press <Ctrl>\ and <Ctrl>n for returning to normal mode

I decided to use: https://github.com/akinsho/toggleterm.nvim
Also I added the mapping to toggle the terminal with <Ctrl>\ because <Ctrl>' is already occupied.

I decided on this being a float window because I liked it! (can be changed)

## THE Debugger
using:
https://github.com/mfussenegger/nvim-dap
https://github.com/rcarriga/nvim-dap-ui
https://github.com/nvim-neotest/nvim-nio
https://github.com/jay-babu/mason-nvim-dap.nvim
https://github.com/theHamsta/nvim-dap-virtual-text

the associated config file is: config/debugger.lua. There all the keybinds are set as well due to execution order requirements
Currently the leader is set to 'b' for the debugger. <leader>b will open the information!

https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
