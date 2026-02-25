
-- this didn't wprl correctly!!!!
-- require('mini.completion').setup()
require('mini.pairs').setup()

require('mini.move').setup()

require('mini.sessions').setup()

vim.api.nvim_create_autocmd({'ExitPre'}, {
  callback = function()
    MiniSessions.write()
  end,
})

-- etesfa
