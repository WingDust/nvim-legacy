"     配置
"     快速进入设置文件夹
nmap <silent> <F2> :Explore c:\Users\Administrator\AppData\Local\nvim<cr>



"     end

"-------------------------------- keymaping
" Learderkey
:let g:mapleader="\<Space>"
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"     switch buffer with Ctrl Tab
nnoremap <silent> <C-Tab> :e #<CR>
" nnoremap <C-Tab> <C-^><CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

"nmap <C-n> :bn<CR>  " Next buffer in list
"nmap <C-p> :bp<CR>  " Previous buffer in list
"nmap <C-#> :b#<CR>  " Previous buffer you were in
"nmap <C-3> :b#<CR>  " Previous buffer you were in

"     end


"     emacs up down right left end keymaping
" insert 下 上下左右
imap <c-f> <Right>
imap <c-b> <Left>
imap <c-n> <Down>
imap <c-p> <Up>
imap <c-e> <End>
"     end
