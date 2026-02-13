
-- not used anymore, but kept incase you ever want to use a server without using mason-org/mason-lspconfig.nvim
-- enable lua_ls
--vim.lsp.enable('lua_ls')


-- enable clangd
--vim.lsp.enable('clangd')


-- a lot of the keymaps here comes from this page: https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/lsp.lua
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)  

    -- enable text completion
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})


