"----------------------------------------------
" element self config 
"----------------------------------------------
"----------------------------------------------
"----------------------------------------------
set nu
set hlsearch
set incsearch        "实时搜索

"syntax on					"语法高亮 语法高亮默认已打开

set mouse=a
"set cursorline            	"当前行有底线，不是很喜欢
"hi Cursorline cterm=bold ctermbg=black ctermfg=green guibg=green "粗体显示选中行，用黑色框，字体标绿

"————————————————————————————————————————————————
"文本对齐相关的配置
"可以在vim中用:help tabstop命令查看详细内容
"tabstop  Tab字符显示的长度
"softtabstop 按Tab输出的长度，不影响tab字符显示的长度
"如tabstop=8, softtabstop=4,
"按一次tab输出4个空格，按两次tab输出8个空格，8个空格会自动替换为tab字符显示
"expandtab 将插入的tab字符替换为特定数目的空格，空格数目与tabstop选项有关
set tabstop=2
set softtabstop=2
set expandtab               "expandtab 把tab替换成空格
"autocmd FileType c,cpp set shiftwidth=2 | set expandtab
set shiftwidth=2            "自动缩进的长度
set autoindent             	"自动对齐
set smartindent             "智能对齐, 没感觉有用
"————————————————————————————————————————————————

"Vim自动把默认剪贴板和系统剪贴板的内容同步
"+y, "+p, "+d 或者 "*y, "*d, "*p 指定使用系统剪贴板操作
set clipboard+=unnamed

" 选择其他的窗口
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
" CTRL-W t 到顶部窗口
" CTRL-W b 到底部窗口

" 移动当前的窗口至最左最右
nnoremap <a-up> <c-w>K
nnoremap <a-down> <c-w>J
nnoremap <a-left> <c-w>H
nnoremap <a-right> <c-w>L

" 调整窗口大小
nnoremap <c-s-up> <c-w>+
nnoremap <c-s-down> <c-w>-
nnoremap <c-s-left> <c-w><
nnoremap <c-s-right> <c-w>>

":set autochdir            	"设置当前目录自动跟随当前文件,不喜欢这个功能，只是为了记录关闭的命令
":set acd
":set noacd

"tags version: universal-ctags 
set tags=./tags;,tags
map <c-]> g<c-]>
map <c-LeftMouse> g<c-]>
"map <button 1> g

"————————————————————————————————————————————————
"快捷键F4切换函数列表, F4相当于输入":TlistToggle回车"命令
"原文链接：https://blog.csdn.net/ballack_linux/article/details/52456944
let   Tlist_Inc_Winwidth=0                         " //  配置打开函数列表的时候不改变窗口大小
let   Tlist_Use_Right_Window=1                "//  配置函数列表挂靠在屏幕右手边
let   Tlist_File_Fold_Auto_Close=1            "//  配置自动关闭非活动的文件
let   Tlist_Exit_OnlyWindow=1                  " //  配置当前只有函数列表窗口的时候退出vim
map <F4> :TlistToggle<cr>                      
"————————————————————————————————————————————————
" toggle between terminal and vim mouse
"map <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
"imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
"function ShowMouseMode()
"   if (&mouse == 'a')
"        echo "mouse-vim"
"    else
"        echo "mouse-xterm"
"    endif
"endfunction

"---变量 函数 映射 静默的应用-----------------------
"mapF2 开关行号显示
"<silent>表示静默映射,不会显示Vim在处理rhs过程中对界面产生的变化
"不加<silent>，会显示call SwitchNum()
let nu=1
map <silent><F2> :call SwitchNum()<cr>
function SwitchNum()
	if (&nu == 1)
		let nu=0
		:set nonu
	else
		let nu=1
		:set nu
	endif
endfunction
"--------------------------------------------------
map <F3> :NERDTreeToggle<cr>

call plug#begin()
"Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
call plug#end()

" cscope设置
if has("cscope")
  set csprg=/usr/bin/cscope              "指定用来执行 cscope 的命令
  set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
  set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
  set nocsverb                           "不显示添加数据库是否成功
  "add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out                    "添加cscope数据库
  endif
  set csverb                             "显示添加成功与否
endif

"解决可视模式 输入:会显示:'<,'>的问题
vnoremap : <Esc>:
