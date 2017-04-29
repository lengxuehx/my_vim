" 定义快捷键的前缀，即<Leader>
let mapleader=";"

set encoding=utf-8

" 定义快捷键到行首和行尾
nmap <Leader>lb 0
nmap <Leader>le $
" 到行的第一个和最后一个非空白字符
nmap <leader>lf ^
nmap <leader>ll g_
" 最后修改的地方
nmap <leader>lc ''
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <leader>d "+d
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
"Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
"Plugin 'junegunn/fzf'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'szw/vim-maximizer'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-repeat' 
" 插件列表结束
call vundle#end()
filetype plugin indent on

set rtp+=~/.vim/bundle/ctrlp.vim

" 配色方案
set background=dark
colorscheme molokai
"colorscheme solarized
let g:molokai_original = 1


" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 设置 gvim 显示字体
set guifont=YaHei_Consolas_Hybrid:h18

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" " 启动 vim 时关闭折叠代码
 set nofoldenable
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>tl :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"" 显示/隐藏 MiniBufExplorer 窗口
"map <Leader>bl :MBEToggle<cr>
"" buffer 切换快捷键
"map <Leader>bj :MBEbn<cr>
"map <Leader>bk :MBEbp<cr>
"map <Leader>bc :close<cr>

" YCM 补全菜单配色
" 设置python解释器，不要设置为绝对路径
"let g:ycm_python_binary_path="/opt/py_virtualenvs/progress_management/bin/python"
let g:ycm_python_binary_path="python"
let g:ycm_server_python_interpreter = 'python'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全          
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gm :YcmCompleter GetDoc<CR>

"" Override go-to.definition key shortcut to Ctrl-]
"let g:pymode_rope_goto_definition_bind = "<leader>gd"
"" Override run current python file key shortcut to Ctrl-Shift-e
"let g:pymode_run_bind =  "<leader>rp"
"" Override view python doc key shortcut to Ctrl-Shift-d
"let g:pymode_doc_bind =  "<leader>vd" 

"fugitive指令映射
map <leader>gb  :Gblame<CR>
map <leader>gs :Gstatus<CR>
"map <leader>gd :Gdiff<CR>
map <leader>gl :Glog<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Git push<CR>

" 配对符号
vnoremap ( s()<Esc>P<Esc>
vnoremap [ s[]<Esc>P<Esc>
vnoremap { s{}<Esc>P<Esc>
vnoremap <leader>' s''<Esc>P<Esc>
vnoremap <leader>" s""<Esc>P<Esc>
vnoremap <leader>c s<Esc>pl2x

" map select all
map ,a ggvg

" 编辑vimrc 
command!VIMRC tabedit $MYVIMRC

" 新的tab页
map <C-t><C-t> :tabnew<CR>

"tab切换
map ,0 <Esc>:tabedit .<CR>
map ,1 <Esc>:tabn 1<CR>
map ,2 <Esc>:tabn 2<CR>
map ,3 <Esc>:tabn 3<CR>
map ,4 <Esc>:tabn 4<CR>
map ,5 <Esc>:tabn 5<CR>
map ,6 <Esc>:tabn 6<CR>
map ,7 <Esc>:tabn 7<CR>
map ,8 <Esc>:tabn 8<CR>
nnoremap <tab> gt
nnoremap <Leader><tab> gT
nnoremap <S-tab> gT
" buffer map
map <C-H> <Esc>:bnext<CR>
map <C-L> <Esc>:bprevious<CR>

" 自动切换当前工作目录至打开的文件
autocmd BufEnter * silent! lcd %:p:h

" 设置自动探测文件编码类型
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 把每一行添加引号，并用逗号分隔
map <S-L> :%s/^.*$/'&',/g<CR>gg:s/^/\[/g<CR>G:s/,$/\]/g<CR>gg<S-V>G<S-j>

" 把每一行按空格分隔并把每一项转成字符串，然后整体转成列表
map <S-S><S-L> :%s/\(\s\+\)\(\S\+\)/', '\2/g<CR>:%s/^/('/g<CR>:%s/\s\+$/'),/g<CR>gg:s/^/\[/g<CR>G:s/,$/\]/g<CR>

" 搜索选中的部分
vnoremap // y/<C-R>"<CR>

"删除空行
map <S-D><S-E> :%s/^\s*\n//g<CR>

" 最大化
nnoremap <Leader>m :MaximizerToggle<CR>
vnoremap <Leader>m :MaximizerToggle<CR>gv
inoremap <Leader>m <C-o>:MaximizerToggle<CR>

" 搜索时下一个总是太慢，就是因为有这个映射和N键冲突
unmap nw

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"syntastic插件设置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 设置语法检查参数
let g:syntastic_python_checker='flake8'
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225,E265,E231,E272,E301,W,E222,E302,W391,E101,E221,E206,E226,E202,E228,E123,E303,E126 --max-line-length=200'

set tw=200
