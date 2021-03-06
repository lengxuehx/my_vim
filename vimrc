" 定义快捷键的前缀，即<Leader>
let mapleader=";"

set encoding=utf-8

if has('win32') || has ('win64')
  vnoremap <C-c> "*y 
  vnoremap <C-v> "*p 
endif

" 定义快捷键到行首和行尾
nmap <Leader>lb 0
nmap <Leader>le $
" 到行的第一个和最后一个非空白字符
nmap <leader>lf ^
nmap <leader>ll g_
" 最后修改的地方
nmap <leader>lc ''
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "*y
map <Leader>p "*p
nmap <leader>d "*d
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
"nmap <Leader>WQ :wa<CR>:q<CR>
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

"设置PYTHONPATH
python << endpython
import vim, os
def walk(top, topdown=True, onerror=None, followlinks=False, maxdepth=None):
    islink, join, isdir = os.path.islink, os.path.join, os.path.isdir

    try:
        names = os.listdir(top)
    except OSError, err:
        if onerror is not None:
            onerror(err)
        return

    dirs, nondirs = [], []
    for name in names:
        if isdir(join(top, name)):
            dirs.append(name)
        else:
            nondirs.append(name)

    if topdown:
        yield top, dirs, nondirs

    if maxdepth is None or maxdepth > 1:
        for name in dirs:
            new_path = join(top, name)
            if followlinks or not islink(new_path):
                for x in walk(new_path, topdown, onerror, followlinks, None if maxdepth is None else maxdepth-1):
                    yield x
    if not topdown:
        yield top, dirs, nondirs

import sys
package_path_list = []
for dirpath, dirnames, filenames in walk(os.getcwd(), 2):
    if '__init__.py' in filenames:
        sys.path.append(os.path.dirname(dirpath))
endpython

" plug 环境设置
filetype off
" plug 管理的插件列表必须位于 plug#begin() 和 plug#end() 之间
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'Lokaltog/vim-powerline'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DrawIt'
Plug 'SirVer/ultisnips'
"Plug 'Valloric/YouCompleteMe'
Plug 'derekwyatt/vim-protodef'
Plug 'scrooloose/nerdtree'
"Plug 'fholgado/minibufexpl.vim'
Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'suan/vim-instant-markdown'
Plug 'lilydjwg/fcitx.vim'
"Plug 'python-mode/python-mode'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'szw/vim-maximizer'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-repeat' 
Plug 'maralla/completor.vim'
"Plug  'webdesus/polymer-ide.vim', { 'do': 'npm install' }
Plug 'davidhalter/jedi-vim' 
Plug 'mileszs/ack.vim' 
Plug 'pangloss/vim-javascript'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
" 插件列表结束
call plug#end()
filetype plugin indent on

"set rtp+=~/.vim/bundle/ctrlp.vim

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
" 打开后鼠标跳转到标签栏
let g:tagbar_autofocus=1
" 全部折叠
let g:tagbar_foldlevel=0

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
nnoremap <Leader>st :CtrlSFToggle<CR>

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
" 忽略某些文件
let NERDTreeIgnore = ['\.pyc$']

"" 显示/隐藏 MiniBufExplorer 窗口
"map <Leader>bl :MBEToggle<cr>
"" buffer 切换快捷键
"map <Leader>bj :MBEbn<cr>
"map <Leader>bk :MBEbp<cr>
"map <Leader>bc :close<cr>

" YCM 补全菜单配色
" 设置python解释器，不要设置为绝对路径
"let g:ycm_python_binary_path="/opt/py_virtualenvs/progress_management/bin/python"
"let g:ycm_python_binary_path="python"
"let g:ycm_server_python_interpreter = 'python'
"" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
"" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
"" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
"" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
"" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
"" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
"" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 语法关键字补全          
"let g:ycm_seed_identifiers_with_syntax=1
"nnoremap <leader>gd :YcmCompleter GoTo<CR>
"nnoremap <leader>gm :YcmCompleter GetDoc<CR>

"" Override go-to.definition key shortcut to Ctrl-]
"let g:pymode_rope_goto_definition_bind = "<leader>gd"
"" Override run current python file key shortcut to Ctrl-Shift-e
"let g:pymode_run_bind =  "<leader>rp"
"" Override view python doc key shortcut to Ctrl-Shift-d
"let g:pymode_doc_bind =  "<leader>vd" 

" set jedi-vim
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"

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
"autocmd BufEnter * silent! lcd %:p:h

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

"全选
nmap <C-a> gg<S-v>G

"以python脚本运行
nmap <F5> !python %<CR>

"命令模式快捷键
nnoremap <F2> <Esc><S-:>


" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee > /dev/null %

"syntastic插件设置
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" 设置语法检查参数
let g:syntastic_python_checkers=[ 'flake8' ]
let g:syntastic_python_flake8_post_args='--ignore=E127,E121,E116,F401,E201,E203,E241,F405,E501,E128,E225,E265,E231,E272,E301,W,E222,E302,W391,E101,E221,E206,E226,E202,E228,E123,E303,E126 --max-line-length=200'
"快捷打开关闭错误检测窗口
noremap <leader>eo :SyntasticCheck<CR>:lopen<CR>
noremap <leader>ec :lclose<CR>

" 最大宽度
set tw=200

" 搜索到结尾不自动重头开始搜索 
set nowrapscan
let g:ctrlp_use_caching = 1

"fzf.vim
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"不要自动切换pwd
set noautochdir
let NERDTreeChDirMode=0

