" ====== 基本配置 ======
" 行号开关快捷键Ctrl+n
map <C-n> :set number!<CR>
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" 高亮显示搜索结果
set hlsearch
" 不自动换行
set nowrap
" 终端滚动时时刻保留n行在界面中
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
" <<<<<< airline <<<<<<

" ------ 语法检查 ------
" >>>>>> syntastic >>>>>>
" Plug 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" <<<<<< syntastic <<<<<<

" ------ 语法检查 ------
" >>>>>> ale >>>>>>
Plug 'dense-analysis/ale'
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
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
Plug 'vim-ctrlspace/vim-ctrlspace'
set nocompatible
set hidden
let g:CtrlSpaceDefaultMappingKey = "<C-m> "
" <<<<<< ctrlspace <<<<<<

" ------ 文件模板 ------
" >>>>>> template >>>>>>
" Plug 'aperezdc/vim-template'
" let g:templates_directory = '~/.vim/templates'
" <<<<<< template <<<<<<

" Initialize plugin system
call plug#end()
" ====== 插件管理 ======

