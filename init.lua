require("plugins")


function c()
  print(222)
end
-- treesitter
--  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
vim.api.nvim_create_user_command(
  'Ad', 
  function(opts) 
    vim.pretty_print(vim.api.nvim_win_get_cursor(0)) 
    p = vim.treesitter.get_parser(0)
    vim.pretty_print(p._lang) 

    --vim.pretty_print(opts.fargs) 
  end, 
  { nargs = '*' }
  )
vim.api.nvim_create_user_command('Test2', function(opts) vim.pretty_print(opts.fargs) end, { nargs = '*' })
