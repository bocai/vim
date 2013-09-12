">>  增加缩进,"n>>"表示增加以下n行的缩进
"<<  减少缩进,"x<<"表示减少以下n行的缩进 
runtime! debian.vim

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if has("syntax")
	syntax enable                " 打开语法高亮
	syntax on           	 " 语法高亮
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showcmd		" Show (partial) command in status line.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set autowrite		" Automatically save before commands like :next and :make
setlocal noswapfile
set hidden             " Hide buffers when they are abandoned
set number               " 显示行号
"colorscheme elflord   " 着色模式/usr/share/vim/vim73/colors
colorscheme ron     " 设置配色方案
set guifont=Monaco:h10   " 字体 && 字号
set nocp 		 " 使用不兼容 vi 的模式（vi模式一些操作很不方便）
set autoindent "设置自动对齐(缩进)：即每行的缩进值与上一行相等
set smartindent        	 " 智能对齐方式
set cul				 " 显示当前行下划线
"set cursorcolumn       " 高亮光标所在的列
set tabstop=4 		 	" 设置制表符(tab键)的宽度
"set softtabstop=4     	 " 设置软制表符的宽度    
set cindent shiftwidth=4     " 自动缩进4空格
"set linebreak           " 整词换行
" 带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#,-
set cindent              " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s   " 设置C/C++语言的具体缩进方式
set backspace=2          " 设置退格键可用
set showmatch                " 显示括号配对情况
set matchtime=1  "匹配括号高亮的时间（单位是十分之一秒）
set mouse=v   "a             " 使用鼠标
""set selection=exclusive
set selectmode=mouse,key 
"set magic                   " 设置魔术
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 查找book时，当输入/b时会自动找到
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set clipboard+=unnamed    "共享粘贴版
set wildmenu  " 增强模式中的命令行自动完成操作

""低版本，实现使用鼠标复制粘贴
""if has('mouse')
""	set mouse=
""endif

set cscopequickfix=s-,c-,d-,i-,t-,e-
"折叠快捷键:normal模式下常用命令
"za --> 打开/关闭当前折叠
"zo --> 打开当前折叠
"zc --> 关闭当前折叠
set foldmethod=syntax  	" 设置语法折叠
set foldlevel=100 		" 启动vim时不要自动折叠代码
"set foldcolumn=4          " 设置折叠区域的宽度
"set foldopen=all
"set foldclose=all       " 设置为自动关闭叠                           
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                             " 用空格键来开关折叠
" https://github.com/tpope/vim-pathogen/blob/master/README.markdown
call pathogen#infect() " pathogen插件管理-插件
call pathogen#helptags()

set fileformats=unix,dos     " 连同识别dos下的文本
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
"set writebackup 
set nobackup              " 设置无备份文件

set autochdir                " 设定文件浏览器目录为当前目录
"set nowrap                  " 设置不自动换行
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2

" 修改Zen Coding(WEB) 默认的快捷键映射
""imap <C-e> <C-y>,

" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/

" 设置编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1,GB2312
set langmenu=zh_CN.UTF-8
" For Haskell
:let hs_highlight_delimiters=1            " 高亮定界符
:let hs_highlight_boolean=1               " 把True和False识别为关键字
:let hs_highlight_types=1                 " 把基本类型的名字识别为关键字
:let hs_highlight_more_types=1            " 把更多常用类型识别为关键字
:let hs_highlight_debug=1                 " 高亮调试函数的名字
:let hs_allow_hash_operator=1             " 阻止把#高亮为错误

" -- MiniBufferExplorer -- 
let g:miniBufExplMapWindowNavVim = 1 	" 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 	" Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开
let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口
let g:miniBufExplModSelTarget = 1    	" 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer

" 设置分屏浏览
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:persistentBehaviour=0       "只剩一个窗口时, 退出vim.
" normal模式wm打开
nmap wm :WMToggle<cr>

""autocmd vimenter * NERDTree "启动vim自动启用NERDTree
"F12 open NERDTree文件管理视图
nnoremap <silent><F12> :NERDTreeToggle<CR>

" powerline 状态栏 
""highlight StatusLine guifg=SlateBlue guibg=Yellow " 状态行颜色
""highlight StatusLineNC guifg=Gray guibg=White " 状态行颜色
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P> 
""if version >= 700 " 进入插入模式时改变状态栏颜色（仅限于Vim 7）
"	au InsertEnter * hi StatusLine guibg=#818D29 guifg=#FCFCFC gui=none	
""	au InsertLeave * hi StatusLine guibg=Yellow guifg=SlateBlue gui=none
""endif

let Powerline_symbols = 'compatible' "兼容模式，避免乱码
"let g:Powerline_stl_path_style = 'full' " 状态显示全路径
""let g:Powerline_mode_V="V·LINE"
""let g:Powerline_mode_cv="V·BLOCK"
""let g:Powerline_mode_S="S·LINE"
""let g:Powerline_mode_cs="S·BLOCK"

set t_Co=256
let g:Powerline_symbols = 'fancy'  "显示不正常则换unicode 
"set guifont=Consolas\ for\ Powerline\ FixedD:h10
"set guifont=PowerlineSymbols\ for\ Powerline
""highlight VertSplit ctermbg=234 ctermfg=234

" Tempalte file 模板文件类型
let g:C_Styles = { '*.c,*.h' : 'C', '*.cc,*.cpp,*.hh' : 'CPP', '*.txt,*.py,*.pl': 'default', }

"时间格式, man strftime 查看其格式项
let g:C_FormatDate  = '%F'
let g:C_FormatTime  = '%H:%M:%S'
"let g:C_FormatYear= 'year %Y'

" 括号智能匹配
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

" :Tlist  调用TagList
let Tlist_Show_One_File=0           "只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1          "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1          "在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1       "自动折叠当前非编辑文件的方法列表

" TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt

let g:vimrc_email='huangbocai2008@126.com'

" Ctrl + H     将光标移到当前行的行首
imap <c-h> <ESC>I

" Ctrl + J     将光标移到下一行的行首
"imap <c-j> <ESC>jI

" Ctrl + K     将光标移到上一行的末尾
"imap <c-k> <ESC>kA

" Ctrl + L     将光标移到当前行的行尾
imap <c-l> <ESC>A

" Ctrl + E    不保存exit
map <c-e> <ESC>:q!<CR>
imap <c-e> <ESC>:q!<CR>
vmap <c-e> <ESC>:q!<CR>

" jj      保存文件并留在插入模式 [插入模式]
imap jj <ESC>:w<CR>li

" kk      返回Normal模式 [插入模式]
imap kk <ESC>l

" nt (或者F12)  打开NERDTree [非插入模式]
map nt :NERDTree<CR>

" tl    打开Taglist [非插入模式]
map tl :Tlist<CR><c-l>

" ======= 编译 && 运行 ======= "

" 编译源文件函数( ctrl+c )
func! CompileCode()
        exec "w"
        if &filetype == "c"
            exec "!gcc -Wall -std=gnu99 %<.c -o %< -lpthread -lm"
        elseif &filetype == "cpp"
            exec "!g++ -Wall -std=c++0x %<.cpp -o %<"
        elseif &filetype == "java"
            exec "!javac %<.java"
        elseif &filetype == "haskell"
            exec "!ghc --make %<.hs -o %<"
        elseif &filetype == "lua"
            exec "!lua %<.lua"
        elseif &filetype == "perl"
            exec "!perl %<.pl"
        elseif &filetype == "python"
            exec "!python3 %<.py"
        elseif &filetype == "ruby"
            exec "!ruby %<.rb"
        endif
endfunc

" 运行可执行文件
func! RunCode()
        exec "w"
        if &filetype == "c" || &filetype == "cpp" || &filetype == "haskell"
            exec "! ./%<"
        elseif &filetype == "java"
            exec "!java %<"
        elseif &filetype == "lua"
            exec "!lua %<.lua"
        elseif &filetype == "perl"
            exec "!perl %<.pl"
        elseif &filetype == "python"
            exec "!python %<.py"
        elseif &filetype == "ruby"
            exec "!ruby %<.rb"
        endif
endfunc

" Ctrl + C 一键保存、编译
map <c-c> :call CompileCode()<CR>
imap <c-c> <ESC>:call CompileCode()<CR>
"vmap <c-c> <ESC>:call CompileCode()<CR>

" Ctrl + R 一键保存、运行
map <c-r> :call RunCode()<CR>
imap <c-r> <ESC>:call RunCode()<CR>
vmap <c-r> <ESC>:call RunCode()<CR>

if has("cscope")
            set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
            " check cscope for definition of a symbol before checking ctags:
            " set to 1 if you want the reverse search order.
             set csto=1

             " add any cscope database in current directory
             if filereadable("cscope.out")
                 cs add cscope.out
             " else add the database pointed to by environment variable
             elseif $CSCOPE_DB !=""
                 cs add $CSCOPE_DB
             endif

             " show msg when any other cscope db added
             set cscopeverbose

             nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
             nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
             nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
         endif

" 按下F2使用vim自带的补全功能(原tab键也可以)
imap <F2> <C-n>

"-- omnicppcomplete setting --
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=longest,menu,menuone,preview	"关掉智能补全时的预览窗口
""set completeopt=menu,menuone
let OmniCpp_NamespaceSearch = 2 "查找当前文件缓冲区和包含文件中的命名空间
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_SelectFirstItem = 2 "是否自动选择第一个匹配项。仅当completeopt为longest时有效
let OmniCpp_DisplayMode = 1 "是否(0/1)显示所有成员
let OmniCpp_ShowScopeInAbbr = 1

"k" 按下F3根据头文件内关键字补全
imap <F3> <C-X><C-I>

" 设置超级TAB的补全(记住之前的补全)
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-n>"

" 自动补全列表的颜色设置
highlight Pmenu ctermfg=black 
highlight PmenuSel ctermfg=white ctermbg=black

set pastetoggle=<F4> "F4转到插入+粘贴模式，这样粘贴代码段不会变形

"--ctags setting--（需要安装taglist）
" 按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
set tags+=/usr/include/tags
set tags+=/usr/include/c++/tags
set tags+=/usr/include/c++/stltags
set tags+=/usr/include/qt4/tags
set tags+=/usr/include/gtk-2.0/tags
set tags+=/usr/include/gtk-3.0/tags

" -- QuickFix setting --
" 按下F6，执行make(命令)编译程序，并打开quickfix窗口，显示编译信息
map <F6> :make<CR><CR><CR> :copen<CR><CR>
" 按下F7，光标移到上一个错误所在的
map <F7> :cp<CR>
" 按下F8，光标移到下一个错误所在的行
map <F8> :cn<CR>
" 按下F9，执行make clean
map <F9> :make clean<CR><CR><CR>
" 以下的映射是使上面的快捷键在插入模式下也能用
imap <F6> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <F7> <ESC>:cp<CR><CR><CR>
imap <F8> <ESC>:cn<CR>
imap <F9> <ESC>:make clean<CR>

"定义源代码格式化(需要安装astyle)
func FormartSrc()
	exec "w"
		"C程序,Perl程序,Python程序
	if &filetype == 'c'
		exec "!astyle --suffix=none -A3 %"
		exec "e! %"
	elseif &filetype == 'cpp'
		exec "!astyle --style=gnu --suffix=none -A3 %"
		exec "e! %"
	elseif &filetype == 'perl'
		exec "!astyle --style=gnu --suffix=none %"
		exec "e! %"
	elseif &filetype == 'py'
		exec "!astyle --style=gnu --suffix=none %"
		exec "e! %"
	"Java程序
	elseif &filetype == 'java'
		exec "!astyle --style=java --suffix=none %"
		exec "e! %"
	elseif &filetype == 'jsp'
		exec "!astyle --style=gnu --suffix=none %"
		exec "e! %"
	elseif &filetype == 'xml'
		exec "!astyle --style=gnu --suffix=none %"
		exec "e! %"
	elseif &filetype == 'html'
		exec "!astyle --style=gnu --suffix=none %"
		exec "e! %"
	elseif &filetype == 'htm'
		exec "!astyle --style=gnu --suffix=none %"
		exec "e! %"
	endif
endfunc "结束定义FormartSrc
" fm 格式化代码
map fm <Esc>:call FormartSrc() <CR>i
imap fm <Esc>:call FormartSrc() <CR>i
vmap fm <Esc>:call FormartSrc() <CR>i

" ctrl + o 隐藏/显示行号
map <c-o> <ESC> :set number! <Bar> set number?<CR>
imap <c-o> <ESC> :set number! <Bar> set number?<CR>
vmap <c-o> <ESC> :set number! <Bar> set number?<CR>

"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

" Java 自动补全设置
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd Filetype java set completefunc=javacomplete#CompleteParamsInfo
" python 自动补全
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:pydiction_location='~/.vim//bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

