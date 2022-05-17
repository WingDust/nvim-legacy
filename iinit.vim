
"python3 配置
let g:python3_host_prog = 'E:/python/python3.8.1/python'

"显示不可见字符
"set nolist
":set listchars=eol:⏎,tab:>-,trail:·,extends:>,precedes:<,space:-,¦
set listchars=tab:>-,trail:·,extends:>,precedes:<,space:-
set list

"call plug#begin('~/nvim/plugged')
call plug#begin('E:/nvim/Neovim/nvim/plugged')


for file in split(globpath('C:/Users/Administrator/AppData/Local/nvim/container/plugin/','**','*.vim'), '\n')
    if (!isdirectory(file))
      execute 'source' file
    endif
endfor

" Make sure you use single quotes
"
" " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"
 "Plug 'junegunn/vim-easy-align'
 "
"
" " Any valid git URL is allowed
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }
"
" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
" Plug 'lyokha/vim-xkbswitch'




" theme
Plug 'cocopon/iceberg.vim'

" 文件管理器
Plug 'Shougo/defx.nvim',{'do':':UpdateRemotePluginLs'}


" 缩进线增强
"Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1

Plug 'kristijanhusak/defx-git'
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" 配合字体
" Defx icons
" Requires nerd-font, install at https://github.com/ryanoasis/nerd-fonts or
" brew cask install font-hack-nerd-font
" Then set non-ascii font to Driod sans mono for powerline in iTerm2
Plug 'kristijanhusak/defx-icons'
" disbale syntax highlighting to prevent performence issue
" let g:defx_icons_enable_syntax_highlight = 1
" let g:defx_icons_column_length = 2
" let g:defx_icons_directory_icon = ''
" let g:defx_icons_mark_icon = '*'
" let g:defx_icons_copy_icon = ''
" let g:defx_icons_move_icon = ''
" let g:defx_icons_parent_icon = ''
" let g:defx_icons_default_icon = ''
" let g:defx_icons_directory_symlink_icon = ''
" " Options below are applicable only when using "tree" feature
" let g:defx_icons_root_opened_tree_icon = ''
" let g:defx_icons_nested_opened_tree_icon = ''
" let g:defx_icons_nested_closed_tree_icon = ''


" 图标
Plug 'ryanoasis/vim-devicons'

" " Initialize plugin system

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" Lsp 使用支持在 nvim 0.5版
"Plug 'neovim/nvim-lsp' 


" coc
" 使用 release 版
Plug 'neoclide/coc.nvim',{'branch':'release'}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
let g:coc_snippet_next = '<tab>'



" buffer 水平居中
Plug 'junegunn/goyo.vim'

Plug 'junegunn/limelight.vim'


" python 使用
"Plug 'python-mode/python-mode',{'for':'python','branch':'develop'}
"let g:pymode = 1


" 前端
Plug 'mattn/emmet-vim'
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_leader_key='<C-Z>'
" Vue
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'

Plug 'preservim/nerdcommenter'
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

"                            markdown
Plug 'iamcco/markdown-preview.nvim',{'do':'cd app && yarn install '}

"                            end

" which-key
Plug 'liuchengxu/vim-which-key'


Plug 'junegunn/fzf',{'do':{ -> fzf#install() }}
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-x><C-f>  :Files<CR>
nnoremap <silent> <C-x><C-g> :GFiles<CR>
nnoremap <silent> <C-x><C-b> :Buffers<CR>
nnoremap <C-x><C-r> :Rg!

" see vim-plug FAQ `git::@`
"let g:plug_url_format = 'git@github.com:%s.git'
"
" Dependency
set nocompatible
set hidden
set encoding=utf-8
Plug 'https://github.com.cnpmjs.org/vim-ctrlspace/vim-ctrlspace.git'
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'https://github.com/Yggdroot/indentLine.git'


" JavaScript Docblockr
Plug 'heavenshell/vim-jsdoc'
let g:jsdoc_lehre_path='E:\EmscriptenSDK\emsdk\node\12.9.1_64bit\bin\node_modules\lehre\node_modules\.bin'
nmap <silent> <C-l> <Plug>(jsdoc)











call plug#end()

"""--------------------------------Plug-end------------------------------------"""


































"""########################################################

"""let g:XkbSwitchEnabled =1
"""
"""let g:XkbSwitchIMappings = ['cn']
"""let g:XkbSwitchIMappingsTr = {'cn': {'<': '', '>': ''}}
"""
"""" let g:XkbSwitchLib = 'c:\path\to\dll\libxkbswitch32.dll'  "
"""" 这个是手动去添加 libxkbswitch32.dll 的路径，
""""
"""
"""" if !has('nvim') && has('win32') && has('gui_running')
"""if !has('nvim') && has('win32')
"""  autocmd InsertEnter * set iminsert=2
"""endif




" 代码折叠 等号不能有空格
set foldmethod=indent
set foldcolumn=0 "设置折叠区域的宽度
set foldlevel=1 "设置折叠层数
" 多少个空格视为一个缩进
set expandtab
set shiftwidth=2
" 设定 Tab 键缩进的空格数
set tabstop=4
" set foldlevelstart=99 "打开文件默认不折叠代码

" if has("autocmd")
	" autocmd FileType markdown setlocal sw=2


syntax on "语法高亮
filetype plugin indent on "开启自动识别文件类型 并根据文件类型加载不同的插件和缩进规则
set clipboard=unnamed "yy 直接复制到剪贴板





" Theme
syntax enable
colorscheme iceberg

" set guifont=Nerd Font:h12


" 允许使用 Ctrl + Scorll 来改变字体大小
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> h  defx#do_action('cd',['..'])
	nnoremap <silent><buffer><expr> N  defx#do_action('new_file')
	
endfunction
function! s:DelDefxBuffer()
	if bufexists("[defx]")
		exe 'bdelete \[defx]\'
	endif
endfunction

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

autocmd FileType defx call s:defx_mappings()
autocmd BufReadPre,FileReadPre * call s:DelDefxBuffer()



" 设置 Markdown 的缩进折叠
"
" https://stackoverflow.com/questions/3828606/vim-markdown-folding
function! MarkdownLevel()
    let curline = getline(v:lnum)
    if curline =~ '^# .*$'
        return ">1"
    endif
    if curline =~ '^## .*$'
        return ">2"
    endif
    if curline =~ '^### .*$'
        return ">3"
    endif
    if curline =~ '^#### .*$'
        return ">4"
    endif
    if curline =~ '^##### .*$'
        return ">5"
    endif
    if curline =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction

function! MarkdownFoldText()
    let foldsize = v:foldend - v:foldstart
    return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
au BufEnter *.md setlocal foldtext=MarkdownFoldText()

" 正确的显示json 文件的语法高亮
autocmd FileType json syntax match Comment +\/\/.\+$+


"for file in split(globpath('./container','*.vim'), '\n')
for file in split(globpath('C:/Users/Administrator/AppData/Local/nvim/container/','**','*.vim'), '\n')
    if (!isdirectory(file))
      execute 'source' file
    endif
endfor


