" ====== 基本配置 ======
" 设置<Leader>键，默认为\
let mapleader = "\\"
" 编码格式
set encoding=UTF-8
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
" buffer快捷键
nmap <Leader>bn :bn<cr>
nmap <Leader>bp :bp<cr>
nmap <Leader>bf :bf<cr>
nmap <Leader>bl :bl<cr>
nmap <Leader>bd :bd<cr>
" 高亮显示当前行/列
set cursorline
hi CursorLine cterm=NONE ctermbg=brown ctermfg=white guibg=brown guifg=white
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

" 字体和图标
" >>>>>> vim-devicon >>>>>>
" Plug 'ryanoasis/vim-devicons'
" set encoding=UTF-8
" <<<<<< vim-devicons <<<<<<

" ------ 目录树 ------
" >>>>>> nerdtree >>>>>>
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'jistr/vim-nerdtree-tabs'
" 内置在NERDTree操作区的一些基本操作
" ?: 快速帮助文档
" o: 打开一个目录或者打开文件，创建的是buffer，也可以用来打开书签
" go: 打开一个文件，但是光标仍然留在NERDTree，创建的是buffer
" t: 打开一个文件，创建的是Tab，对书签同样生效
" T: 打开一个文件，但是光标仍然留在NERDTree，创建的是Tab，对书签同样生效
" i: 水平分割创建文件的窗口，创建的是buffer
" gi: 水平分割创建文件的窗口，但是光标仍然留在NERDTree
" s: 垂直分割创建文件的窗口，创建的是buffer
" gs: 和gi，go类似
" x: 收起当前打开的目录
" X: 收起所有打开的目录
" e: 以文件管理的方式打开选中的目录
" D: 删除书签
" P: 大写，跳转到当前根路径
" p: 小写，跳转到光标所在的上一级路径
" K: 跳转到第一个子路径
" J: 跳转到最后一个子路径
" <C-j>和<C-k>: 在同级目录和文件间移动，忽略子目录和子文件
" C: 将根路径设置为光标所在的目录
" u: 设置上级目录为根路径
" U: 设置上级目录为跟路径，但是维持原来目录打开的状态
" r: 刷新光标所在的目录
" R: 刷新当前根路径
" I: 显示或者不显示隐藏文件
" f: 打开和关闭文件过滤器
" q: 关闭NERDTree
" A: 全屏显示NERDTree，或者关闭全屏

" nerdtree开关快捷键
map <F2> :NERDTreeToggle<CR>
nmap <Leader>ft :NERDTreeToggle<cr>

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
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=32
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 在NERDTree显示git信息
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" 在终端启动vim时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1
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
let g:AutoPairs={'<':'>', '(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" <<<<<< auto-pairs <<<<<<

" ------ 显示buffers ------
" >>>>>> bufferline >>>>>>
Plug 'bling/vim-bufferline'
" <<<<<< bufferline <<<<<<

" ------ 文件/buffer模糊查找 ------
" >>>>>> ctrlp >>>>>>
" Plug 'ctrlpvim/ctrlp.vim'
" 部分命令和内置快捷键
" 按Ctrl+p打开CtrlP
" Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
" Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
" Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
" <<<<<< ctrlp <<<<<<

" ------ 文件/buffer模糊查找 ------
" >>>>>> LeaderF >>>>>>
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 运行:Leaderf -h命令查看帮助
" Ctrl + p 打开文件搜索
let g:Lf_ShortcutF = '<C-p>'
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap = {
\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
\ }
" <<<<<< LeaderF <<<<<<

" ------ 文件/buffer模糊查找 ------
" >>>>>> ctrlspace >>>>>>
" Plug 'vim-ctrlspace/vim-ctrlspace'
" set nocompatible
" set hidden
" let g:CtrlSpaceDefaultMappingKey = "<C-m> "
" <<<<<< ctrlspace <<<<<<

" 搜索工具
" vim自带命令vimgrep
" >>>>>> ack >>>>>>
Plug 'mileszs/ack.vim'
" 用法:Ack [options] {pattern} [{directories}]
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" <<<<<< ack <<<<<<

" ------ 文件模板 ------
" >>>>>> template >>>>>>
" Plug 'aperezdc/vim-template'
" let g:templates_directory = '~/.vim/templates'
" <<<<<< template <<<<<<

" 快速补全
" >>>>>> YouCompleteMe >>>>>>
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" <<<<<< YouCompleteMe <<<<<<

" 代码快速对齐
" >>>>>> vim-easy-align >>>>>>
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" <<<<<< vim-easy-align <<<<<<

" 强化具体语言文件
" Plug 'vim-scripts/c.vim'
" Plug 'vim-scripts/a.vim'
" Plug 'fatih/vim-go'
" Plug 'elzr/vim-json'

" cpp高亮增强
" >>>>>> vim-cpp-enhanced-highlight >>>>>>
 Plug 'octol/vim-cpp-enhanced-highlight'
 " 高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
" 文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1
" <<<<<< vim-cpp-enhanced-highlight <<<<<<

" 高亮关键字
" >>>>>> Mark--Karkat >>>>>>
Plug 'vim-scripts/Mark--Karkat'
" 部分内置快捷键
" <Leader>m 高亮/取消选中的单词
" <Leader>n 取消高亮的所有单词
" <Leader>/ 查找高亮的所有单词
" <<<<<< Mark--Karkat <<<<<<

" 自动后台更新ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" 成员函数、成员变量列表
" >>>>>> tagbar >>>>>>
Plug 'majutsushi/tagbar'
" tagbar开关快捷键
nmap <F8> :TagbarToggle<CR>
" <<<<<< tagbar <<<<<<

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
set cmdheight=2
set noshowmode
let g:echodoc_enable_at_startup = 1
" let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu
" <<<<<< echodoc <<<<<<

" 函数参数提示
" >>>>>> echofunc >>>>>>
Plug 'mbbill/echofunc'
" <<<<<< echofunc <<<<<<

" 窗口最大化/还原
" >>>>>> ZoomWin >>>>>>
" Plug 'vim-scripts/ZoomWin'
Plug 'regedarek/ZoomWin'
" 窗口最大化/还原快捷键
map <F3> :ZoomWin<CR>
nmap <Leader>wz :ZoomWin<CR>
" <<<<<< ZoomWin <<<<<<

" 撤销记录列表
" >>>>>> undotree >>>>>>
Plug 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<cr>
" <<<<<< undotree <<<<<<

" Initialize plugin system
call plug#end()
" ====== 插件管理 ======
