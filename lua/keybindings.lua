--

local opt = {
  noremap = true,
  silent = true,
}
-- 本地变量
local map = vim.api.nvim_set_keymap

map("v","v","V",opt)
map("n","<tab>","%",opt)
map("n","<tab>","%",opt)


map("t","<esc>","<C-\\><C-n> ",opt)
