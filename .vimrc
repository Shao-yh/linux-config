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
set tabstop=4
set autoindent             	"自动对齐
set smartindent             "智能对齐, 没感觉有用

"Vim自动把默认剪贴板和系统剪贴板的内容同步
"+y, "+p, "+d 或者 "*y, "*d, "*p 指定使用系统剪贴板操作
set clipboard+=unnamed

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
