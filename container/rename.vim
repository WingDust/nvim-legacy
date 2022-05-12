" 设置能重命名当前编辑的文件名 使用 Rename 1.txt 的形式
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))
