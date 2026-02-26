
-- this didn't wprl correctly!!!!
-- require('mini.completion').setup()
require('mini.pairs').setup()

require('mini.move').setup()

require('mini.sessions').setup()

vim.api.nvim_create_autocmd({'ExitPre'}, {
  callback = function()
    local info = MiniSessions.detected
    if info and info.current then
      MiniSessions.write(info.current)
    end
  end,
})

-- etesfa
