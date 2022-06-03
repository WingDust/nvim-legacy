require("plugins")
require("keybindings")


--vim.api.nvim_eval('set shell=pwsh')
--
-- lua config
-- https://stackoverflow.com/questions/36108950/setting-up-powershell-as-vims-shell-command-does-not-seem-to-be-passed-correct
vim.cmd([[
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
set clipboard=unnamed
]])

function c()
  print(222)
end
-- treesitter
--  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
--

vim.api.nvim_create_user_command(
  'Ad', 
  function(opts) 
    --vim.pretty_print(vim.api.nvim_win_get_cursor(0)) 
    --p = vim.treesitter.get_parser(0)
    --vim.pretty_print(p._lang) 
    --vim.pretty_print(p._lang) 
    --vim.pretty_print(vim.fn.expand('%'))
    --vim.pretty_print(type(vim.api.nvim_buf_get_name(0)))

    cmd = ("node tree-sitter.js"..vim.api.nvim_buf_get_name(0))

   -- os.execute(cmd)
    
    --vim.fn.expand('%')

   vim.pretty_print(opts.fargs) 
   --vim.pretty_print(opts) 
  end, 
  { nargs = '*' }
  )
vim.api.nvim_create_user_command('Test2', function(opts) vim.pretty_print(opts.fargs) end, { nargs = '*' })
