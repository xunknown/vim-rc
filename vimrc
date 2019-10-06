" ====== 基本配置 ======
" 设置<Leader>键，默认为\
let mapleader = "\\"
" 行号开关快捷键
map <C-n> :set number!<CR>
" 开启行号显示
set number
" 水平分割窗口快捷键
nmap <Leader>ws :sp<cr>
" 垂直分割窗口快捷键
nmap <Leader>wv :vsp<cr>
" 切换窗口快捷键
nnoremap <Leader>ww <C-w><C-w>
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
" 关闭当前窗口快捷键
nmap <Leader>wc :close<cr>
" 关闭其他当前窗口快捷键
nmap <Leader>wo :only<cr>
" 调整窗口大小
nmap <Leader>w> :10wincmd><cr>
nmap <Leader>w< :10wincmd<<cr>
nmap <Leader>w+ :10wincmd+<cr>
nmap <Leader>w- :10wincmd-<cr>
nnoremap <Leader>w= <C-w>=
" 高亮显示当前行/列
set cursorline
hi CursorLine cterm=NONE ctermbg=brown ctermfg=white guibg=darkred guifg=white
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=gray ctermfg=NONE guibg=darkred guifg=white

" 开启实时搜索功能
set incsearch
" 高亮显示搜索结果
set hlsearch
" 不自动换行
" set nowrap
" 在特定字符换行
set linebreak
"终端滚动时时刻保留n行在界面中
" set scrolloff=25
" ====== 基本配置 ======

" ====== 插件管理 ======
" 使用vim-plug管理插件: https://github.com/junegunn/vim-plug
" vim-plug从github下载插件，可以从github.com获取插件的相关文档
call plug#begin('~/.vim/plugged')

" ------ 常用的默认配置 ------
" >>>>>> vim-sensible >>>>>>
Plug 'tpope/vim-sensible'
" <<<<<< vim-sensible <<<<<<

" ------ 目录树 ------
" >>>>>> nerdtree >>>>>>
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" nerdtree开关快捷键
map <F2> :NERDTreeToggle<CR>

" 启动vim时自动启动nerdtree
" autocmd vimenter * NERDTree

" 不指定文件启动vim时自动启动nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' "." | endif

" 指定目录启动vim时自动启动nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 只剩nerdtree窗口时关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" <<<<<< nerdtree <<<<<<

" ------ 状态栏/Tab栏 ------
" >>>>>> airline >>>>>>
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail' " 'default'
let g:airline_theme='luna'
" <<<<<< airline <<<<<<

" ------ 语法检查 ------
" >>>>>> ale >>>>>>
Plug 'dense-analysis/ale'
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" 设置检查工具
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
" 自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 设置状态栏显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
" 在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%][%linter%] %s'
" 普通模式下，错误或警告浏览快捷键
nmap <Leader>sp <Plug>(ale_previous_wrap)
nmap <Leader>sn <Plug>(ale_next_wrap)
" 触发/关闭语法检查快捷键
nmap <Leader>ss :ALEToggle<CR>
" 查看错误或警告的详细信息快捷键
nmap <Leader>sd :ALEDetail<CR>
" <<<<<< ale <<<<<<

" ------ 括号/引号成对插入/删除 ------
" >>>>>> auto-pairs >>>>>>
Plug 'jiangmiao/auto-pairs'
" <<<<<< auto-pairs <<<<<<

" ------ 显示buffers ------
" >>>>>> bufferline >>>>>>
Plug 'bling/vim-bufferline'
" <<<<<< bufferline <<<<<<

" ------ 文件/buffer模糊查找 ------
" >>>>>> ctrlp >>>>>>
Plug 'ctrlpvim/ctrlp.vim'
" <<<<<< ctrlp <<<<<<

" ------ 文件/buffer模糊查找 ------
" >>>>>> ctrlspace >>>>>>
" Plug 'vim-ctrlspace/vim-ctrlspace'
" set nocompatible
" set hidden
" let g:CtrlSpaceDefaultMappingKey = "<C-m> "
" <<<<<< ctrlspace <<<<<<

" ------ 文件模板 ------
" >>>>>> template >>>>>>
" Plug 'aperezdc/vim-template'
" let g:templates_directory = '~/.vim/templates'
" <<<<<< template <<<<<<

" 快速补全
" >>>>>> YouCompleteMe >>>>>>
Plug 'Valloric/YouCompleteMe'
" <<<<<< YouCompleteMe <<<<<<

" 代码快速对齐
Plug 'junegunn/vim-easy-align'

" 强化具体语言文件
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'

" 成员函数、成员变量列表
" >>>>>> tagbar >>>>>>
Plug 'majutsushi/tagbar'
" tagbar开关快捷键
nmap <F8> :TagbarToggle<CR>
" <<<<<< tagbar <<<<<<

" 高亮关键字
" >>>>>> Mark--Karkat >>>>>>
Plug 'vim-scripts/Mark--Karkat'
" 部分内置快捷键
" <Leader>m 高亮/取消选中的单词
" <Leader>n 取消高亮的所有单词
" <Leader>/ 查找高亮的所有单词
" <<<<<< Mark--Karkat <<<<<<

" vim列对齐线
" >>>>>> indentLine >>>>>>
Plug 'Yggdroot/indentLine'
" 对齐线开/关快捷键
nmap <leader>il :IndentLinesToggle<CR>
" 设置对齐线默认开1/关0状态
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1
" 设置对齐线样式
let g:indentLine_char_list = ['┊', '┆', '¦']
" 设置GUI对齐线颜色
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_bgcolor_gui = '#FF5F00'
" 设置终端对齐线颜色
" let g:indentLine_color_term = 239
" let g:indentLine_bgcolor_term = 202
" <<<<<< indentLine <<<<<<

" 前后空格显示告警色
" >>>>>> better-whitespace >>>>>>
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1
" <<<<<< better-whitespace <<<<<<

" 函数参数提示
" >>>>>> echodoc >>>>>>
Plug 'Shougo/echodoc.vim'
set noshowmode
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu
" <<<<<< echodoc <<<<<<

" 窗口最大化/还原
" >>>>>> ZoomWin >>>>>>
Plug 'vim-scripts/ZoomWin'
" 窗口最大化/还原快捷键
map <F3> :ZoomWin<CR>
nmap <Leader>wz :ZoomWin<CR>
" <<<<<< ZoomWin <<<<<<

" >>>>>> >>>>>>
" <<<<<< <<<<<<
" Initialize plugin system
call plug#end()
" ====== 插件管理 ======
