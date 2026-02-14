return {
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
    dependencies = {
      'rcarriga/nvim-dap-ui',  -- for a nice UI
      'nvim-neotest/nvim-nio', -- required by previous package
      'jay-babu/mason-nvim-dap.nvim', -- easier installing
      'theHamsta/nvim-dap-virtual-text', -- information about current values of variables
    } 
 }
}
