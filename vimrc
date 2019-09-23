"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" 安装插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" IDE 界面配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" 目录进退
Plug 'justinmk/vim-dirvish'

" 底层状态条
Plug 'itchyny/lightline.vim'

" 前后空格显示告警色
Plug 'bronson/vim-trailing-whitespace'

" Git命令行
Plug 'tpope/vim-fugitive'

" vim列对齐线
Plug 'Yggdroot/indentLine'

"切换当前terminal和vim的鼠标焦点，F12
Plug 'nvie/vim-togglemouse'

"unimpaired 插件定义括号开头的快捷键，官方 Vim 中丢失的快捷键
Plug 'tpope/vim-unimpaired'

"控制VIM复制粘贴不带tab
Plug 'ConradIrwin/vim-bracketed-paste'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码搜索配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
"模糊查找leaderf
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" 自动后台更新ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"搜索栏预览
Plug 'skywind3000/vim-preview'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码格式配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""

" 代码快速对齐
Plug 'junegunn/vim-easy-align'

" 自动进行tab2space转换
Plug 'vim-scripts/Smart-Tabs'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码编辑配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" 语法检查
Plug 'dense-analysis/ale'

" 代码格式化
Plug 'Chiel92/vim-autoformat'

" 强化具体语言文件
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" 撤销记录列表
Plug 'mbbill/undotree'

" 括号补全
Plug 'tpope/vim-surround'

" 为buff自动创建不存在的目录
Plug 'pbrisbin/vim-mkdir'

" 快速补全
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer'}

"函数参数提示
Plug 'Shougo/echodoc.vim'


" 异步执行插件
Plug 'skywind3000/asyncrun.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码染色配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""
"https://en.wikipedia.org/wiki/List_of_Unicode_characters

" ----------a.vim插件配置-----------------------------------------------
" :A 跳到与当前.c同名的.h文件
nmap ha A
" :IH 跳到光标所在的单词对应的文件
nmap hi IH

" ----------gutentags.vim插件配置-----------------------------------------------
"yum install -y global-ctags
set tags=./.tags;,.tags
let $GTAGSLABEL = 'pygments'
let $GTAGSCONF = '/etc/gtags.conf'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.git','.root','MAINTAINERS', 'COPYING','.project']

"let g:gutentags_trace = 1

let g:gutentags_file_list_command = {
  \'markers': {
    \'cscope.lst': 'taglslist',
    \'.git': 'taglslist',
    \'MAINTAINERS': 'taglslist',
    \'COPYING': 'taglslist',
    \},
\}

" gtags外部参数配置文件
let g:gutentags_gtags_options_file = '.gtags.optconf.log'

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目数据库相互干扰,使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0

"let g:gutentags_define_advanced_commands = 1

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" default keymap
"<leader>cs	Find symbol (reference) under cursor
"<leader>cg	Find symbol definition under cursor
"<leader>cd	Functions called by this function
"<leader>cc	Functions calling this function
"<leader>ct	Find text string under cursor
"<leader>ce	Find egrep pattern under cursor
"<leader>cf	Find file name under cursor
"<leader>ci	Find files #including the file name under cursor
"<leader>ca	Find places where current symbol is assigned

"----------vim-preview配置-------------------------------------------------
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"-----------ale 静态检查插件-----------------------------------------------
" 对应语言需要安装相应的检查工具
" yum install ShellCheck
let g:ale_enabled = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'bash': ['shellcheck'],
  \   'go': ['gofmt', 'golint'],
  \   'python': ['pylint'],
  \   'c': ['gcc', 'cppcheck'],
  \   'cpp': ['gcc', 'cppcheck'],
  \   'text': [],
  \}

let g:ale_sign_column_always = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1"打开quitfix对话框

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = ">>"
let g:ale_sign_warning = "--"
map <F7> ::ALEToggle<CR>

"----------autoformat格式化工具配置---------------------------
" 需要安装astyle，yapf和shfmt
noremap <F3> :Autoformat<CR>

" 选择下一个格式化工具 :NextFormatter and :PreviousFormatter
" 查看当前的格式化工具 :CurrentFormatter

let g:autoformat_autoindent = 1
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

" 自定义格式化命令
let g:formatters_c = "'astyle --mode=c --style=allman '"
let g:formatters_h = '"astyle --mode=c --style=allman" '

let g:formatters_cpp = "'astyle --style=google' "
let g:formatters_hpp = "'astyle --style=google' "

"-----------YCM自动补全配置-----------------------------------
"关闭自动弹出的窗口
"set completeopt=menu,menuone
let g:ycm_global_ycm_extra_conf= '~/.vim/config/ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-y>'
set completeopt=menu,menuone
" 使用 Ctrl+y 主动触发语义补全
noremap <c-y> <NOP>
" 修改补全列表配色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "go":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

let g:ycm_filetype_blacklist = {
        \ 'markdown' : 1,
        \ 'text' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \}

"----------------echodoc.vim 配置--------------------------
set noshowmode

" -----------LeaderF 模糊文件查找-------------------------------
" Ctrl + p 打开文件搜索
let g:Lf_ShortcutF = '<c-p>'
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

"---------------------Dirvish 目录查找配置-----------------------------
" Don't need netrw
let g:loaded_netrwPlugin = 1

function! s:dirvish_toggle_hidden()
  if get(b:, 'dirvish_show_dot_files')
    keeppatterns g@\v/\.[^\/]+/?$@d
    let b:dirvish_show_dot_files = 0
  else
    let b:dirvish_show_dot_files = 1
    call dirvish#open(@%)
  endif
endfunction

function! s:escaped(first, last) abort
  let l:files = getline(a:first, a:last)
  call filter(l:files, 'v:val !~# "^\" "')
  call map(l:files, 'substitute(v:val, "[/*|@=]\\=\\%(\\t.*\\)\\=$", "", "")')
  return join(l:files, ' ')
endfunction

let s:escape_pattern = 'substitute(escape(v:val, ".$~"), "*", ".*", "g")'

function! s:setup_dirvish()
  let b:dirvish_show_dot_files = 1

  " Make fugitive work
  call fugitive#detect(@%)

  " Hide ignored files
  for pattern in map(split(&wildignore, ','), s:escape_pattern)
    execute 'silent keeppatterns g/^' . pattern . '$/d'
  endfor

  " Toggle display of hidden files with `gh`
  nnoremap <buffer> <silent> gh :<c-u>call <SID>dirvish_toggle_hidden()<cr>

  " ~ displays the $HOME directory
  nnoremap <buffer> ~ :<c-u>Dirvish ~<cr>

  " . populates the file under the cursor on the command line
  nnoremap <buffer> . :<c-u> <c-r>=<SID>escaped(line('.'), line('.') - 1 + v:count1)<cr><Home>
  nmap <buffer> ! .!

  " open the file under cursor in a horizontal split
  nmap <buffer> s .sp<cr>
endfunction

augroup dirvish_events
  autocmd!
  autocmd FileType dirvish call s:setup_dirvish()
augroup END

"----------asyncrun.vim插件配置--------------------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"----------undo插件配置-------------------------------------------------
" u命令取消最近一次的操作，可以使用多次来恢复原有的操作
" U取消所有操作
" Ctrl+R可以恢复对使用u命令的操作
nnoremap <Leader>ud :GundoToggle<CR>

" 开启保存 undo 历史功能
set undofile

" undo 历史保存路径
set undodir=~/.undo_history/

" -------------------indent_guides列对齐线---------------------------------
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
let g:indent_guides_indent_levels = 10
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"-------vim-trailing-whitespace显示告警颜色------------------------------
cnoreabbrev fixws FixWhitespace

"--------------------light.vim配置-----------------------------------
" hide mode
set noshowmode
" showtabline always
set showtabline=2

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \   'mode_map': { 'c': 'NORMAL' },
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'branch' ],
      \               [ 'readonly', 'filename', 'modified' ] ],
      \     'right': [ [ 'percent', 'lineinfo' ],
      \                [ 'filetype', 'fileencoding', 'denitepath' ],
      \                [ 'gtags' ]],
      \   },
      \   'component_function': {
      \     'mode': 'LightlineMode',
      \     'branch': 'LightlineBranch',
      \     'filename': 'LightlineFilename',
      \     'modified': 'LightlineModified',
      \     'gtags': 'LightlineCurrentGtags',
      \     'filetype': 'LightlineFiletype',
      \     'fileencoding': 'LightlineFileencoding',
      \     'denitepath': 'LightlineDenitepath',
      \     'percent': 'LightlinePercent',
      \     'lineinfo': 'LightlineLineinfo'
      \   },
      \   'component_expand': {
      \     'readonly': 'LightlineReadonly',
      \   },
      \   'component_type': {
      \     'readonly': 'warning',
      \   },
      \   'subseparator': {
      \     'left': '',
      \     'right': ''
      \   },
      \ }

" functions
function! LightlineMode() abort
  if &filetype ==? 'denite'
    call lightline#link(tolower(denite#get_status('raw_mode')[0]))
    return 'Denite'
  endif
  if winwidth(0) <= 60
    return ''
  endif
  return lightline#mode()
endfunction

function! LightlineBranch() abort
  if winwidth(0) <= 75 || !exists('*fugitive#head')
    return ''
  endif
  return fugitive#head()
endfunction

function! LightlineReadonly() abort
  return &filetype !~? 'help\|man\|denite' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename() abort
  return (&filetype ==? 'denite' ? denite#get_status('sources') :
        \  &filetype =~? 'tagbar\|nerdtree' ? '' :
        \  &filetype =~? 'help\|man' ? expand('%:t') :
        \  winwidth(0) > 150 ? expand('%') :
        \  winwidth(0) > 110 ? pathshorten(expand('%')) :
        \ '' !=# expand('%:t') ? expand('%:t') :'[No Name]')
endfunction

function! LightlineModified() abort
  return &filetype =~? 'help\|man\|denite' ? '' :
        \ &modified ? '+' :
        \ &modifiable ? '' : '-'
endfunction

function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') >= 0 || index(a:mods, 'gtags_cscope') >= 0
       let l:msg .= '♻'
     endif
     return l:msg
endfunction

function! LightlineCurrentGtags() abort
  if winwidth(0) <= 90
        \ || !get(g:, 'loaded_gutentags', 0)
    return ''
  endif
  let msg = gutentags#statusline_cb(function('<SID>get_gutentags_status'))
"  let msg = gutentags#statusline('[', ']')
  return empty(msg) ? '' :  msg
endfunction

function! LightlineFiletype() abort
  if winwidth(0) <= 70 || &filetype ==? 'denite'
    return ''
  endif
  return &filetype
endfunction

function! LightlineFileencoding() abort
  if winwidth(0) <= 70 || &filetype ==? 'denite'
    return ''
  endif
  return (&fileencoding !=# '' ? &fileencoding : &encoding) .
        \ '[' . &fileformat . ']'
endfunction

function! LightlineDenitepath() abort
  if &filetype !=? 'denite'
    return ''
  endif
  return substitute(denite#get_status('path'), '^[' . $HOME, '[~', '')
endfunction

function! LightlinePercent() abort
  if &filetype ==? 'denite'
    let l:line_total = denite#get_status('line_total')
    if l:line_total[1] == 0
      return printf('%3d%%', 100)
    endif
    let l:line_cursor = denite#get_status('line_cursor')
    return printf('%3d%%', 100 * l:line_cursor / l:line_total)
  else
    return printf('%3d%%', 100 * line('.') / line('$'))
  endif
endfunction

function! LightlineLineinfo() abort
  return &filetype ==? 'denite' ? denite#get_status('linenr') :
        \ printf('%3d:%-2d', line('.'), col('.'))
endfunction

"tags状态更新后自动刷新statusline
"augroup GutentagsStatusLineRefresher
""    autocmd!
""    autocmd User GutentagsUpdating call lightline#update()
""    autocmd User GutentagsUpdated call lightline#update()
"augroup END

" -------------------Tab与空格之间进行转换-------------------------------------
" Convert all leading spaces to tabs (default range is whole file):
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction

" Space2Tab, Convert lines 11 to 15 only (inclusive):
" 11,15Space2Tab
" Convert last visually-selected lines:
" '<,'>Space2Tab
" Same, converting leading tabs to spaces:
" '<,'>Tab2Space
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

"------------------vim-cpp-enhanced-highlight---------------------"
let c_no_curly_error = 1

"""""""""""""""""""""""""""""""""""""""""
" 基本配置
"""""""""""""""""""""""""""""""""""""""""
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 解码
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" 关闭兼容模式
set nocompatible
" 历史记录控制
set history=1000

"""""""""""""""""""""""""""""""""""""""""
" vim控制配置
"""""""""""""""""""""""""""""""""""""""""
" 使用鼠标模式
set mouse=a
" 在title bar显示文件名
set title
" 总是显示状态栏
set laststatus=2
" 在状态栏显示命令行
set showcmd

" 显示光标当前位置
set ruler
" 禁止光标闪烁
set gcr=a:block-blinkon0

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
"set t_ti= t_te=

"""""""""""""""""""""""""""""""""""""""""
" 内容显示配置
"""""""""""""""""""""""""""""""""""""""""
" 开启代码颜色高亮
syntax on
syntax enable

" 告诉vim terminal支持 256 colors
set t_Co=256

" color scheme
set background=dark
color solarized

"color monokai
"colors Tomorrow-Night-Eighties

"""""""""""""""""""""""""""""""""""""""""
" 代码查看配置
"""""""""""""""""""""""""""""""""""""""""
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase

" vim 自身命令行模式智能补全
set wildmenu
set smartcase
set showmatch
set matchtime=2

" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 不自动换行
set nowrap
" 终端滚动时时刻保留n行在界面中
set scrolloff=25

" 高亮特殊符
"set backspace=indent,eol,start
"set list
"if has('multi_byte') && &encoding ==# 'utf-8'
"  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
"else
"  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
"endif

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 默认收缩设置
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

" 根据侦测到的不同文件类型处理不同的插件和缩放
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 wrap
autocmd FileType make setlocal noexpandtab
autocmd FileType c,h,cpp,c++ setlocal noexpandtab
autocmd FileType sh setlocal textwidth=0 wrap

"""""""""""""""""""""""""""""""""""""""""
" 代码修改配置
"""""""""""""""""""""""""""""""""""""""""
" 让配置变更立即生效
autocmd! BufWritePost $HOME/.vimrc source %
" 在另外一个vim中加载被修改过的vimrc
cnoreabbrev vimreload so $HOME/.vimrc

" 文件修改之后自动载入
set autoread
" 提醒退出时保存文件
set confirm

"""""""""""""""""""""""""""""""""""""""""
" GUI配置
"""""""""""""""""""""""""""""""""""""""""
if has('gui_running')

set guifont=Tsentsiu\ Mono\ HG\ 16

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
" yum install wmctrl
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

endif

"""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""
" 定义前缀键
let mapleader=";"

"定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 定义git grep 快捷键
cnoreabbrev grep !git grep

" vim文本选择
" v : 按照字符选择
" V : 按行选择
" Ctrl+v : 按列选择

" 剪切到剪切板
nmap <Leader>d "+d
" 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" 水平窗口:sp
nmap wsp :sp<cr>
" 垂直窗口:vsp
nmap wvsp :vsp<cr>
" 遍历子窗口
nnoremap wn <C-W><C-W>

" 返回上一层
" Ctrl+o
" 返回下一层
" Ctrl+i

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cnoremap w!! call SudoSaveFile()
function! SudoSaveFile() abort
	execute (has('gui_running') ? '' : 'silent') 'write !env SUDO_EDITOR=tee sudo -e % >/dev/null'
	let &modified = v:shell_error
endfunction

" eggcache vim
:command! W w
:command! WQ wq
:command! Q q
:command! QA qa
:command! WQA wqa

