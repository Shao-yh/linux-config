"----------------------------------------------
" element self config 
"----------------------------------------------
"----------------------------------------------
"----------------------------------------------
set nu
set hlsearch
"syntax on "语法高亮
set mouse=a

"tags version: universal-ctags 
set tags=./tags;,tags
map <c-]> g<c-]>
map <c-LeftMouse> g<c-]>
"map <button 1> g

"————————————————————————————————————————————————
"原文链接：https://blog.csdn.net/ballack_linux/article/details/52456944
let   Tlist_Inc_Winwidth=0                         " //  配置打开函数列表的时候不改变窗口大小

let   Tlist_Use_Right_Window=1                "//  配置函数列表挂靠在屏幕右手边

let   Tlist_File_Fold_Auto_Close=1            "//  配置自动关闭非活动的文件

let   Tlist_Exit_OnlyWindow=1                  " //  配置当前只有函数列表窗口的时候退出vim

map <F4> :TlistToggle<cr>                      
"快捷键F4切换函数列表
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
"Vim自动把默认剪贴板和系统剪贴板的内容同步
"+y, "+p, "+d 或者 "*y, "*d, "*p 指定使用系统剪贴板操作
set clipboard+=unnamed
