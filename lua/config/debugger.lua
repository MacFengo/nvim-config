
local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- dap virtual text
dap_virtual_text.setup()


-- mason dap

mason_dap.setup({
	ensure_installed = { "cppdbg" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

-- adapters for dap
-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#c-c-rust-via-gdb

--dap.adapters.gdb = {
--  type = "executable",
--  command = "gdb",
--  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
--}








-- configurations for dap

dap.configurations.c = {
  {
    name = "Launch",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    runInTerminal = true,
    stopAtBeginningOfMainSubprogram = true,
  }
}





-- dap UI
ui.setup()


dap.listeners.before.attack.dapui_config = function ()
  ui.open()
end

dap.listeners.before.launch.dapui_config = function ()
  ui.open()
end

dap.listeners.before.event_terminated.dapui_config = function ()
  ui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end

-- debugger keybindings
local opts = {noremap = true, silent = true}

opts.desc = "Toggle Breakpoint"
vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, opts)

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

opts.desc = "Terminate"
vim.keymap.set("n", "<leader>bq", function ()
  dap.terminate()
  ui.close()
  dap_virtual_text.toggle()
end,
opts
)

opts.desc = "Pause"
vim.keymap.set("n", "<leader>bp", dap.pause, opts)


