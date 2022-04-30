"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2022 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'

let mapleader = '\'
"不适用vi的键盘模式，使用vim自己的
set nocompatible                             " required
filetype on                                  " required开启探测文件类型,on off
filetype plugin on           " 载入文件类型插件
filetype indent on           " 为特定文件类型载入相关缩进文件

" 打开文件类型检测, 加了这句才可以用智能补全
filetype plugin indent on

:set vb t_vb=        "可以关闭错误提示音
set secure   "会关闭项目中的 shell autocmd write 等命令。


" Prevent incorrect backgroung rendering
let &t_ut=''     " 防止vim背景颜色错误
set indentexpr=

set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
set virtualedit=block,onemore


"让补全行为与一般IDE一样
"set completeopt = preview,meun
set completeopt=longest,noinsert,menuone,noselect,preview


"开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 块选择快速跳转问题

set nostartofline

let python_highlight_all=1
" 允许有未保存的修改时切换缓冲区
set hidden

"显示行号
set number

"高亮显示匹配的括号
set showmatch
set viewoptions=folds,cursor,curdir,slash,unix
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=4

"为c语言自动缩进
"smartindent 在这种缩进模式中，每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出花括号，当遇到右花括号（}），则取消缩进形式。此外还增加了识别 C 语言关键字的功能。如果一行是以 #开头的，那么这种格式将会被特殊对待而不采用缩进格式
set smartindent

" 使用C样式的缩进
set cindent

"自动缩进, 继承前一行的缩进方式，适用于多行注释,
"autoindent 在这种缩进形式中，新增加的行和前一行使用相同的缩进形式。可以使用以下命令，
set autoindent

" 字符间插入的像素行数目
set linespace=0

" 设置 VIM 字体及大小
" Linux/Unix 命令格式：set guifont = 字体 +\\+ 空格 + 字体大小
"  Windows/Mac 命令格式：set guifont = 字体 + : + 字体大小
" 不同的是，关于字体大小的表述。Linux/Unix 字体大小直接写字号，Windows/Mac 字号需要加上 h 的高度名。
" Linux/Unix: set guifont=Monospace\空格14 注意这里需要对空格使用 \ 进行转意
" Windows: set guifont=Monospace:h14 注意这里的字体大小需要有 h 的标识
" set guifont=-misc-simsun-medium-r-normal-*-*-120-*-*-c-*-iso10646-1
" 在Gvim中我设置了英文用Hermit， 中文使用 YaHei Mono "

if has('gui_running')
    "colorscheme desert" 下面的滚动条开启
    " let g:netrw_winsize = 20
    "添加水平滚动条。如果你指定了不折行，那为窗口添加一个水平滚动条就非常有必要了
    :set guioptions+=b

    " " 隐藏/不隐藏工具栏
    set guioptions+=T
    " " 隐藏/不隐藏菜单栏
    set guioptions+=m

    set guioptions+=r
    set guioptions+=L
    " 设置为双字宽显示，否则无法完整显示如:☆
    set lines=60 columns=108 linespace=0
    if has('gui_win32')
        " set guifont=DejaVu_Sans_Mono:h10:cANSI
        " set guifont=Fira_Code:h10:cANSI
        " set guifont=JetBrains_Mono_Regular:h8:cANSI
        " set guifont=FiraCode_Nerd_Font_Mono:h8:cANSI
        """ set guifont=JetBrainsMono_Nerd_Font:h8:cANSI
        " set guifont=JetBrainsMono_NF:h8:cANSI
        " set guifont=JetBrainsMono_Nerd_Font_Mono:h8:cANSI
        " set guifont=SauceCodePro_Nerd_Font_Mono:h8:cANSI


        " set guifont=Monaco:h8:cANSI
        " set guifont=InconsolataGo_Nerd_Font:h8:cANSI
        " set guifont=InconsolataGo_Nerd_Font_Mono:h8:cANSI
        " set guifont=InconsolataLGC_Nerd_Font_Medium:h8:cANSI
        set guifont=YaHei_Consolas_Hybrid:h12:cANSI
        " set guifont=YaHei_Consolas_Hybrid_YaHei_Consolas_Hybrid_Regular:h8:cANSI
        set guifont=Cascadia_Code:h12:cANSI
        set guifont=CaskaydiaCove_Nerd_Font_Mono:h12:cANSI
    else
        " set guifont=DejaVu\ Sans\ Mono\ 12
        " set guifont=Fira\ Code\ 12
        " set guifont=JetBrains\ Mono\ Regular\ 9
        " set guifont=FiraCode\ Nerd\ Font\ Mono\ 9
        """ set guifont=JetBrainsMono\ Nerd\ Font\ 9
        " set guifont=JetBrainsMono\ NF:h8:cANSI
        " set guifont=JetBrainsMono\ Nerd\ Font\ Mono\ 9
        " set guifont=SauceCodePro\ Nerd\ Font\ Mono\ 9
        " set guifont=DejaVu\ Sans\ Mono\ 10

        " set guifont=Monaco:h8:cANSI
        " set guifont=InconsolataGo\ Nerd\ Font:h8:cANSI
        " set guifont=InconsolataGo\ Nerd\ Font\ Mono:h8:cANSI
        " set guifont=InconsolataLGC\ Nerd\ Font\ Medium:h8:cANSI
        set guifont=YaHei\ Consolas\ Hybrid:h12:cANSI
        " set guifont=YaHei\ Consolas\ Hybrid\ YaHei\ Consolas\ Hybrid\ Regular:h8:cANSI
        set guifont=Cascadia\ Code:h12:cANSI
        set guifont=CascadiaCove\ Nerd\ Font\ Mono:h12:cANSI
    endif
  endif


" ===
" === Window behaviors在普通模式下输入 :split 可以上下分屏，同时光标会在上面的屏幕，:vsplit 可以左右分屏，光标会停留在左边，使光标停在右边的指令是 :set splitright，然后再输入分屏指令，但是这样太麻烦了，可以修改键位：map sl :set splitright< CR >:vsplit< CR > ，设置完成后，在普通模式下按 sl 即可分屏并且使光标停留在右边屏幕。同理可设置其他几个方向：
" ===
set splitright
set splitbelow

" 设定默认解码
set bsdir=buffer
set modifiable
set langmenu=zh_CN.UTF-8
set fileencodings=utf-8,ucs-bom,latin1,gb2312,gb18030,cp936,gbk,big5
set encoding=utf-8  "支持UTF8编码
set fencs=utf-8,gbk,chinese,big5,cs-bom,shift-jis,gb18030,gb2312,cp936
set termencoding=utf-8

" 可以在 buffer 的任何地方使用鼠标（类似 office 中在工作区双击鼠标定位）
set mouse=a
" set selectmode=mouse,key
"指定在选择文本时，光标所在位置也属于被选中的范围。
set selection=inclusive


" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\
set fillchars=vert:\|


" 设置路径，多个路径用逗号分隔
set path+=**


" 显示 TAB 键-,空格-
set list
"set listchars=tab:▸\ ,trail:▫
" set listchars=tab:▸\ ,trail:▫,extends:>,precedes:<,eol:$
set listchars=tab:▸\ ,nbsp:+,trail:▫,extends:→,precedes:←
" set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

"折叠
"允许折叠,启动vim时关闭折叠
set nofoldenable

"更具每行的缩进开启折叠 ，manual为手动折叠
set foldmethod=indent
" set foldmethod=syntax

" 用空格代替za进行折叠代码
" nnoremap <space> za

" za :打开或者关闭折叠
" zm ：关闭所有折叠
" zM ：关闭所有折叠及其嵌套的折叠
" zr：打开所有折叠及其嵌套的折叠
" zR：打开所有折叠
" zc：折叠
" zC：对所在范围内所有嵌套进行折叠
" zo：展开折叠
" zO：对所在范围内所有嵌套的折叠垫展开
" zd：删除在光标下的折叠
" zD：删除循环光标下的折叠，即嵌套删除折叠


set foldlevel=100
set tw=0
set formatoptions-=tc

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize
"自动换行是每行超过 n 个字的时候 vim 自动加上换行符用
" set textwidth=70                   "来设置 n
"自动折行 是把长的一行用多行显示 , 不在文件里加换行符用
set  nowrap
"不自动折行
" set wrap

"只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
" set  linebreak
" 我们可以使用以下命令，取消自定义折行：
set nolinebreak


"指定折行处与编辑窗口的右边缘之间空出的字符数。"
set  wrapmargin=2
"水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用。"
set  sidescrolloff=15

" 默认设置 set sidescroll=0 之下，当光标到达屏幕边缘时，将自动扩展显示 1/2 屏幕的文本。
" 通过使用 set sidescroll=1 设置，可以实现更加平滑的逐个字符扩展显示。
set sidescroll=1

set  novisualbell
"出错时，不要闪烁 set novisualbell 。

"系统剪切板
" set clipboard+=unnamed
set clipboard^=unnamed,unnamedplus
" set clipboard=unnamedplus  "使得vim剪切板和系统剪切板一致，这样就可以使用ctrl c/v了
" 其中unnamed代表*寄存器，unnamedplus代表+寄存器。在mac系统中，两者都一样；一般在linux系统中+和*是不同的，+对应ctrl + c,ctrl + v的桌面系统剪贴板，*对应x桌面系统的剪贴板（用鼠标选择复制，用鼠标中键粘贴



"搜索逐字符高亮
set hlsearch
exec "nohlsearch"
" 开启增量搜索模式
set incsearch
"忽略大小写
set ignorecase
set smartcase
set infercase
set wrapscan

set ts=4
set ar
set updatetime=300
set shortmess+=c
set signcolumn=yes

set autoread

""可使切换文件时，修改的文件被自动保存
"set autowriteall

set autowrite
" 设置自动保存

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-



set laststatus=2
" 2为总显示最后一个窗口的状态行
" 设为1则窗口数多于一个的时候显示最后一个窗口的状态行；
" 0不显示最后一个窗口的状态行

"光标所在行一横线
set cursorline

set cursorcolumn
"光标所在行一竖线
" 设置中文帮助
set helplang=cn

autocmd InsertLeave * call ToggleCursor()
autocmd InsertEnter * call ToggleCursor()
function ToggleCursor() abort
	set cursorline!
	set cursorcolumn!
endfunction

" 输入的命令显示出来，看的清楚些
set showcmd


" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
"打开状态栏标尺
set showmode
set ruler

set backspace=2
set backspace=indent,eol,start
" indent: 如果用了:set indent,:set ai 等自动缩进，想用退格键将字段缩进的删掉，必须设置这个选项。否则不响应。
" eol: 如果插入模式下在行开头，想通过退格键合并两行，需要设置 eol。
" start：要想删除此次插入前的输入，需设置这个。

set confirm
"在处理未保存或只读文件的时候，弹出确认

" 不要生成 swap 文件，当 buffer 被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

"允许backspace和光标跨越行边界
set whichwrap+=<,>,b,s,[,]


" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.dll,*.exe,*.jpg,*.gif,*.png
set wildmenu                      " show a navigable menu for tab completion
" set wildmode=list:longest,full
set wildchar=<Tab> wildcharm=<C-Z>
set suffixes=.bak,~,.o,.h,.info,.swp,.obj

hi BadWhitespace  ctermfg=15 ctermbg=15  guifg= gray guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/          "表示不必要的空白字符

" 让 vim 把连续数量的空格视为一个制表符,使得按退格键时可以一次删除4个空格"
set softtabstop=4

" 设置编辑时制表符占用空格数,设置所有的Tab和缩进为4个空格
set tabstop=4

" 设置格式化时制表符占用空格数,设定<<和>>命令移动时的宽度为4
set shiftwidth=4

" 在行和段开始处使用制表符
set smarttab

" 将制表符扩展为空格,使用空格来替换Tab
set expandtab

""""""""""""""""""""""""""""""""快捷键定义"""""""""""""""""""""""""""""""""""""""""""''
" 实现按 \sa 全选当前文件所有文本的效果
map <leader>sa ggVG"
" Disable the default s key
noremap s <nop>

" 定义快捷键关闭当前分割窗口
" nmap ;q :q<CR>
" 定义快捷键保存当前窗口内容并离开
nmap ;wq :wq<CR>
nmap ;w :w<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
map Q :q<CR>
let g:wintabs_autoclose_vim = 1

map S :w!<CR>

if has('nvim')
    nnoremap pi  :PlugInstall<CR>
    nnoremap pcl  :PlugClean<CR>
    nnoremap ps  :PlugStatus<CR>
    nnoremap pu  :PlugUpdate<CR>
    nnoremap pU  :PlugUpgrade<CR>
else
    nnoremap pi  :PluginInstall<CR>
endif

" Call figlet
map ;x :r !figlet


" Search
map <LEADER><CR> :nohlsearch<CR>
nnoremap = nzz
nnoremap - Nzz



" 水平滚动
" 向左
map  `ll 20zh
" imap <F8> <ESC>10zhi
" 向右
map `rr 20zl
" imap <F9> <ESC>10zli
" 这个时候在 Normal 和 Insert 模式下都可以按 <F8><F9> 来水平滚动了。


" ===
" === Other useful stuff
" ===
" 打开新标签页并在新标签页打开终端
"nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>
" nnoremap \t :tabe<CR>:term sh -c 'st'<CR>

" 打开终端并切换到输入模式
map <leader>t :sp term://zsh<CR><c-w>J:res 10<CR>A
tnoremap <Esc> <C-\><C-n>


" 上下分屏并在下方打开终端
noremap ;t :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
" 左右分屏并在下方打开终端
noremap ;r :set splitright<CR>:vsplit<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <SPACE><SPACE> <Esc>/<++><CR>:nohlsearch<CR>c4l

" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" Open the vimrc file anytime

if has('nvim')
    " map <Leader>ev :e ~/.config/nvim/init.vim<CR>  "新缓冲去打开文件"
    map <Leader>e :tabe ~/.config/nvim/init.vim<CR>    "新标签页打开"
else
    " map <Leader>ev :e ~/.vimrc<CR>
    map <Leader>e :tabe ~/.vimrc<CR>
endif

if has('nvim')
    map <Leader>s :source  ~/.config/nvim/init.vim<cr>
else
    map <Leader>s :source  ~/.vimrc<cr>
endif

" 快速编辑 init.vim
map <leader>e :e! ~/.config/nvim/init.vim<CR>

" 自动命令，每次写入.vimrc后，都会执行这个自动命令，source一次~/.vimrc
" autocmd! bufwritepost $HOME/.vimrc source %
autocmd! BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
" 读文件时自动设定当前目录为刚读入文件所在的目录
" autocmd BufReadPost * cd %:p:h
" 进入当前编辑的文件的目录
autocmd BufEnter * exec "cd %:p:h"

" Indentation
nnoremap < <<
nnoremap > >>
" =====================================================
" === Insert Mode Cursor Movement
" =====================================================

inoremap <C-a> <ESC>A
inoremap <C-e> <ESC>I
" =======================
" === Command Mode Cursor Movement
" ==================================
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <M-a> <S-Left>
cnoremap <M-e> <S-Right>


" Space 转化为 Tab
nnoremap <LEADER>st :%s/    /\t/g
vnoremap <LEADER>st :s/    /\t/g
"===============================================================

""""""""""""""""""""""""""""""""""""""""""" 行号   """"""""""""""""""""""""""""""""""""""""""""
" <F3> 行号开关
nnoremap <F3> :call HideNumber()<CR>

function! HideNumber()
    if(&relativenumber == &number)
        set  relativenumber!  number!
    elseif(&number)
        set   number!
    else
        set relativenumber!
    endif
    set number?
endfunc


" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunction


" TN进行相对行号/绝对行号切换
nnoremap  TN :call NumberToggle()<cr>


let &t_SI = "\<Esc>]12;green\x7"
" let &t_SR = "\<Esc>]12;yellow\x7"
" let &t_EI = "\<Esc>]12;green\x7"


" 默认下，不管是插入状态还是非插入状态，都是小方块，但是我更希望能看到插入时光标变成小竖线。
" Mode Settings

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)


" ===
" === Terminal Behaviors
" ===
set termguicolors
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
let g:space_vim_transp_bg = 1
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

"###################################################
"当文件在外部被修改，自动更新该文件
"####################################################


"方法2:
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(2000,'CheckUpdate')
endfunction

" ======= 设置当文件被外部改变的时侯自动读入文件 ======= "



"重新打开已创建的文件时自动定位光标到上次关闭文件时的位置,包括具体的列，如果只需要定位到行，不需要列，则把g`(右撇)改为g'(左撇)
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"================================== 能够漂亮地显示.NFO文件===========================
" set encoding=utf-8
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

"=======================高亮显示普通txt文件（需要txt.vim脚本）=======================================
"au BufRead, BufNewFile  *   setfiletype txt
if has("autocmd")
       autocmd BufNewFile,Bufread *.txt set syntax=help
endif


"""""""""""""""""""""""""""""""""""""""""配置底部状态栏"""""""""""""""""""""""""""""""""""""""""

set statusline=%1*\%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例
hi User1 cterm=none ctermfg=25 ctermbg=0
hi User2 cterm=none ctermfg=208 ctermbg=0
hi User3 cterm=none ctermfg=169 ctermbg=0
hi User4 cterm=none ctermfg=100 ctermbg=0
hi User5 cterm=none ctermfg=green ctermbg=0
hi Normal ctermfg=252 ctermbg=none
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""新增配置""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"任何的 Python 文件中使用  % （向前）或  g% （向后）在这三个片断之间跳转
autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'

"始终使用n下一个，N上一个
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

"命令行模式用ctrl+p/n进行上下
" cnoremap <c-n> <down>
" cnoremap <c-p> <up>

" 智能 Ctrl-l
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>



"快速把当前行上衣或者下移一行
nnoremap [e :<c-u>execute 'move -1-'.v:count1<cr>
nnoremap ]e :<c-u>execute  'move +'.v:count1<cr>

" 速添加空行
nnoremap [s :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]s :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <space>i i<space><esc>
nnoremap <space>a a<space><esc>

"快速跳转到源/头文件
autocmd BufLeave *.{c,cpp} mark C
autocmd BufLeave *.h mark H

"在GUI中快速该表字体的大小
command! Bigger :let &guifont = substitude(&guifont, '\d\+$', '\=submatch(0)+1',")
command! Smaller :let &guifont = substitude(&guifont, '\d\+$', '\=submatch(0)-1',")

"根据模式改变光标模式
if empty($TMUX)
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

"防止水平滑动的时候失去选择
xnoremap < <gv
xnoremap > >gv

"选择当前行至末尾，排除换行符
nnoremap L g_

" 重新载入保存文件
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufWritePost ~/.Xdefaults call system('xrdb --merge ~/.Xdefaults')

" 更加智能的当前高亮
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set complete-=i " disable scanning included files
set complete-=t " disable searching tags

" 光标放到当前行末尾之后，默认情况下你是不可能做到的，但是可能通过设置virtualedit 选项达到目的
"set virtualedit=all


"删除行尾空格
nnoremap ;se  :%s/\s\+$//g<CR>
" 去除空白
nmap wb :%s/\s\+$//ge<CR>
autocmd BufWritePre *.lua,*.[hcm],*.cpp,*.c,*.mm,*.sh,*.py normal wb


"删除行首空格
nnoremap ;sh  :%s/^\s*//g<CR>

"删除所有空格行
nnoremap ;ss   :g/^$/d<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格。
if has("autocmd")
    autocmd BufRead,BufNewFile *.c,*.h set expandtab
endif
"autocmd FileType python noremp <buffer> <F8>:call Autopep8()<CR> "设置快捷键代替autopep8
"为python添加pep8的代码风格
au BufNewFile,BufRead *.py,*.php,*.c,*.sh,*.cpp,*.java,*.ruby,*.perl
            \ set tabstop=4 | "tab宽度"
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=500 | "行最大宽"
            \ set autoindent |  "自动缩进"
            \ set fileformat=unix "保存文件的格式"

au BufNewFile,BufRead *.js,*.html,*.css,*.xml
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2


autocmd FileType make setlocal noexpandtab

"为不同的文件类型设置不同的空格数替换TAB
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml set ai
autocmd FileType javascript,html,css,xml set sw=2
autocmd FileType javascript,html,css,xml set ts=2
autocmd FileType javascript,html,css,xml set sts=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""Ctrl+Up变大 Down变小 Home还原(假设你原来的字体是10)"""""""""""""""""""""""""""""""""""""""""""""""
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16

function! AdjustFontSize(amount)
   if has("gui_gtk2") && has("gui_running")
     let fontname = substitute(&guifont, s:pattern, '\1', '')
     let cursize = substitute(&guifont, s:pattern, '\2', '')
     if (cursize < s:minfontsize) || (cursize > s:maxfontsize)
       let cursize = 10
     endif
       let newsize = cursize + a:amount
      if (a:amount > 1)
        let newsize = a:amount
     endif
      if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
       let newfont = fontname . " " . newsize
       let &guifont = newfont
     endif
   else
     echoerr "You need to run the GTK2 version of Vim to use this function."
   endif
endfunction

map <C-;> :call AdjustFontSize(1) <CR>
map <C-.> :call AdjustFontSize(-1) <CR>
map <C-Home> :call AdjustFontSize(10) <CR>


"""""""""""""""""""""""""""""" 更改字体 """"""""""""""""""""""""""""""
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a


function! AdjustFontSize(amount)
    if !has("gui_running")
        return
    endif

    let l:min_font_size = 5
    let l:max_font_size = 23

    let l:font_info = GetFontInfo()
    if l:font_info.name == '' || l:font_info.size == ''
        return
    endif

    let l:font_name = l:font_info.name
    let l:font_size = l:font_info.size

    " Decrease font size.
    if a:amount == '-'
        let l:font_size = l:font_size - 1

    " Increase font size.
    elseif a:amount == '+'
        let l:font_size = l:font_size + 1

    " Use a specific font size.
    elseif str2nr(a:amount)
        let l:font_size = str2nr(a:amount)
    endif

    " Clamp font size.
    let l:font_size = max([l:min_font_size, min([l:max_font_size, l:font_size])])

    if matchstr(&guifont, ':') == '' " Linux guifont style.
        " \v           Very magical.
        " (\d+$)       Capture group:       Match [0-9] one-or-more times, at the end of the string.
        let l:font_size_pattern = '\v(\d+$)'
    else " Windows and macOS guifont style.
        " \v           Very magical.
        " (:h)@<=      Positive lookbehind: Match ':h'.
        " (\d+)        Capture group:       Match [0-9] one-or-more times.
        let l:font_size_pattern = '\v(:h)@<=(\d+)'
    endif

    " Update vim font size.
    let &guifont = substitute(&guifont, l:font_size_pattern, l:font_size, '')

    call DisplayFontInfo()
endfunction

function! DisplayFontSelector()
    if !has("gui_running")
        return
    endif

    " Display font selector.
    " NOTE: This only changes &guifont to '*' in terminal vim.
    set guifont=*

    call DisplayFontInfo()
endfunction

function! DisplayFontInfo()
    let l:font_info = GetFontInfo()
    if l:font_info.name == '' || l:font_info.size == ''
        return
    endif

    " Display font name and size.
    redraw | echomsg l:font_info.name . ' ' . l:font_info.size . '%'
endfunction

function! GetFontInfo()
    " Windows and macOS &guifont: Hack NF:h11:cANSI
    "                             3270Medium_NF:h10:W500:cANSI:qDRAFT
    " Linux &guifont: Hack Nerd Font Mono Regular 10

    if matchstr(&guifont, ':') == '' " Linux guifont style.
        " \v           Very magical.
        " (^.{-1,})    Capture group:       Anchored at the start of the string, match any character one-or-more times non-greedy.
        " ( \d+$)@=    Positive lookahead:  Match ' ' followed by [0-9] one-or-more times, at the end of the string.
        let l:font_name_pattern = '\v(^.{-1,})( \d+$)@='

        " \v           Very magical.
        " (\d+$)       Capture group:       Match [0-9] one-or-more times, at the end of the string.
        let l:font_size_pattern = '\v(\d+$)'
    else " Windows and macOS guifont style.
        " \v           Very magical.
        " (^.{-1,})    Capture group:       Anchored at the start of the string, match any character one-or-more times non-greedy.
        " (:)@=        Positive lookahead:  Match ':'.
        let l:font_name_pattern = '\v(^.{-1,})(:)@='

        " \v           Very magical.
        " (:h)@<=      Positive lookbehind: Match ':h'.
        " (\d+)        Capture group:       Match [0-9] one-or-more times.
        let l:font_size_pattern = '\v(:h)@<=(\d+)'
    endif

    let l:font_name = matchstr(&guifont, l:font_name_pattern)
    let l:font_size = matchstr(&guifont, l:font_size_pattern)

    return { 'name' : l:font_name, 'size' : l:font_size }
endfunction

" Bind Control + Mouse-wheel to zoom text.
" NOTE: This event only works in Linux and macOS. SEE: :h scroll-mouse-wheel
map <silent> <C-ScrollWheelDown> :call AdjustFontSize('-')<CR>
map <silent> <C-ScrollWheelUp> :call AdjustFontSize('+')<CR>

" Decrease font size.
nnoremap <silent> <F11> :call AdjustFontSize('-')<CR>
inoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>
vnoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>
cnoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>
onoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>

" Increase font size.
nnoremap <silent> <F12> :call AdjustFontSize('+')<CR>
inoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>
vnoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>
cnoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>
onoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>

" Set font size to my preferred size.
nnoremap <silent> <S-F11> :call AdjustFontSize(10)<CR>
inoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>
vnoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>
cnoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>
onoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>

" Display font selector.
nnoremap <silent> <S-F12> :call DisplayFontSelector()<CR>
inoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>
vnoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>
cnoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>
onoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>






""--------------------vim原本的快捷键映射变更-----------------------------
"###################################################
"复制粘贴快捷键
"###################################################
" noremap (no recursion)不递归的映射
" inoremap(insert)模式下生效
" vnoremap(visual)模式下生效
" nnoremap(normal)模式下生效


" alt+A全选，alt+C复制，alt+V粘贴
"  Ubuntu上安装的vim默认是不支持系统剪切板的，需要安装
"sudo apt-get install vim-gnome
" Ctrl+a全选
noremap <C-a> ggvG$
inoremap <C-a> <Esc>ggvG$
" Ctrl+A全选并复制，
" noremap <C-a> ggyG$
" inoremap <C-a> <Esc>ggyG$



" set clipboard=unnamedplus  "使得vim剪切板和系统剪切板一致，这样就可以使用ctrl c/v了
"sudo apt install xclip, vim-gtk
"sudo pacman -S xsel
nnoremap <C-c> "+y
vnoremap <C-c> "+y<Esc>

nnoremap <C-p> "*p  # 支持在normal模式下，通过C-p粘贴系统剪切板
nnoremap <C-s> "+p
inoremap <C-s> <Esc>"+pa
nnoremap <C-s> "+gp
" "+gp  粘贴并且移动光标到粘贴内容后

map <C-x> "+x
inoremap <C-x> <Esc>"+x

" map <C-z> "+u
" inoremap <C-z> <Esc>"+u

" v进入可视模式，V进入行可视模式，alt-v进入块可视模式
" nnoremap  <M-v>  <C-v>

"括号等的自动补全
:inoremap ( ()<ESC>i
:inoremap { {<CR>}<ESC>O
:inoremap [ []<ESC>i
:inoremap 《 《》<ESC>i
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap 》 <c-r>=ClosePair('》')<CR>
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction


" 解决写入只读文件
nnoremap tee :w !sudo tee %<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrl-f 下翻一页,f = forward
" ctrl-b 上翻一页,b = backward
" ctrl-u 上翻半页,u = up
" ctrl-d 下翻半页,d = down


" shift+up上翻半页，向上滚半个屏幕；
nmap <S-up>  <C-u>
vmap <S-up>  <C-u>

" shift+down下翻半页，向下滚半个屏幕
nmap <S-down>  <C-d>
vmap <S-down>  <C-d>

"vim原本 ctrl-f 下翻一页,f = forward
"vim原本 ctrl-b 上翻一页,b = backward
" shift+left上翻一页，向上滚一个屏幕
nmap <S-left>  <C-b>
vmap <S-left>  <C-b>
" shift+right下翻一页，向下滚一个屏幕
nmap <S-right>  <C-f>
vmap <S-right>  <C-f>

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-M-left> 5<C-y>
noremap <C-M-right> 5<C-e>
inoremap <C-M-left> <Esc>5<C-y>a
inoremap <C-M-right> <Esc>5<C-e>a
" ctrl+alt+left向上翻一行，向上滚一行屏幕，光标不动
nmap <C-M-up>  <C-y>
vmap <C-M-up>  <C-y>
inoremap <C-M-up> <Esc><C-y>a
" ctrl+alt+right向下翻一行，向下滚一行屏幕，光标不动
nmap <C-M-down>  <C-e>
vmap <C-M-down>  <C-e>
inoremap <C-M-down> <Esc><C-e>a
" 光标在当前行的基础上再跳 20 行：20+enter 键

" U/E keys for 5 times u/e (faster navigation)
nnoremap k 5k
nnoremap j 5j
nnoremap h 5h
nnoremap l 5l
nnoremap U 10k
nnoremap D 10j
nnoremap H 10h
nnoremap L 10l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" 向左分屏
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" 向下分屏
map sj :set splitbelow<CR>:split<CR>
" 向左分屏
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
" 向右分屏
map sl :set splitright<CR>:vsplit<CR>

" Place the two screens up and down
nnoremap sh <C-w>t<C-w>K
" Place the two screens side by side
nnoremap sv <C-w>t<C-w>H

" Rotate screens
nnoremap srh <C-w>b<C-w>K
nnoremap srv <C-w>b<C-w>H

"---------------- 窗口、标签页、缓冲区的切换--------------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"########################### 切换窗口####################################
" nnoremap <C-down> <C-W>j
" nnoremap <C-up> <C-W>k
" nnoremap <C-right> <C-W>l
" nnoremap <C-left> <C-W>h
"组合快捷键：
" Ctrl-down 切换到下方的分割窗口
" Ctrl-up 切换到上方的分割窗口
" Ctrl-right 切换到右侧的分割窗口
" Ctrl-left 切换到左侧的分割窗口

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
"组合快捷键：
" Ctrl-j 切换到下方的分割窗口
" Ctrl-k 切换到上方的分割窗口
" Ctrl-l 切换到右侧的分割窗口
" Ctrl-h 切换到左侧的分割窗口
" 注意，这里的ctrl+hjkl与WinManager的ctrl+上下左右是一样的左右，也就是切换窗口,这里的快捷键覆盖了winmanager的快捷键

" nnoremap <A-j> <C-W>j
" nnoremap <A-k> <C-W>k
" nnoremap <A-l> <C-W>l
" nnoremap <A-h> <C-W>h

nnoremap <C-w> <C-W>w
nnoremap <C-q> <C-W>q
nnoremap <C-t> <C-W>T
nnoremap <C-S-o> <C-W>o

" Ctrl-w 遍历切换窗口
" Ctrl-q 关闭当前窗口，如果只剩最后一个了，则退出 vim
" Ctrl-t 当前窗口移动到新标签页
" Ctrl-shift-o 关闭出当前窗口之外的所有窗口


" " 移动窗口
" alt+j当前窗口向上面移动
nnoremap <S-M-j> <C-w>J
" alt+k当前窗口向上方移动
nnoremap <S-M-k> <C-w>K
" alt+l 当前窗口向右边移动
nnoremap <S-M-l> <C-w>L
" alt+h当前窗口向左边移动
nnoremap <S-M-h> <C-w>H


" 多窗口分屏时改变窗口大小 +/- 3
" alt+left左右减小
nnoremap <M-left>  :vertical resize -2<cr>
" alt+down，上下减小
nnoremap <M-down>  :resize +2<cr>
" alt+up上下增大
nnoremap <M-up>    :resize -2<cr>
" alt+right 左右增大
nnoremap <M-right> :vertical resize +2<cr>
" 注：M 即 Alt 键

"分屏解决了之后还要考虑每个屏幕的大小，可以使用指令 :res +5 来增加当前屏幕的上下宽度 5，:vertical resize +5 增加当前屏幕的左右宽度 5，同样可以自定义快捷键,
"注意：设置完这些快捷键之后在普通模式下就不能使用方向键来移动光标了，只能使用 hjkl，读者可按照自己偏好来设置
" 方向键 上 使上下屏幕增加 5 个宽度
" map <Up> :res +5
" 方向键 下 使上下屏幕减少 5 个宽度
" map <Down> :res -5
" 方向键 右 使左右屏幕增加 5 个宽度
" map <Right> :vertical resize+5
" 方向键 左 使左右屏幕减少 5 个宽度
" map <Left> :vertical resize-5


nnoremap html :%TOhtml<cr>
"#################################### 多标签页配置####################################
" 不显示标签栏
" set showtabline=0
" 这是默认设置，意思是，在创建标签页后才显示标签栏。
set showtabline=1
" 总是显示标签栏
" set showtabline=2


" 若要在右上角启用关闭按钮，请将以下内容添加到 ~/.vimrc

let g:tablineclosebutton=1

"#################################### 多标签页切换####################################


" 新建标签页
noremap <silent><tab>t :tabnew<cr>
" 关闭标签页
noremap <silent><tab>c :tabclose<cr>
"下一个标签页
noremap <silent><tab><right> :tabnext<cr>
noremap <silent>]t :tabnext<cr>
noremap <silent>;n :tabnext<cr>
" nnoremap tn  :tabnext<CR>
" nnoremap <M-j>  :tabnext<CR>
" 上一个标签页
noremap <silent><tab><left> :tabprevious<cr>
noremap <silent>[t :tabprevious<cr>
noremap <silent>;p :tabprevious<cr>
" nnoremap tp  :tabprevious<CR>
" nnoremap <M-k>  :tabprevious<CR>

"下一个标签页,循环
noremap <silent><S-tab> :tabnext<CR>

"Vim默认最多只能打开10个标签页。你可以用set tabpagemax=15改变这个限制。
set tabpagemax=15


" Create a new tab with tu
nnoremap tu :tabe<CR>
nnoremap tU :tab split<CR>

" Move the tabs with tmn and tmp
nnoremap tmn :-tabmove<CR>
nnoremap tmp :+tabmove<CR>

" 正常模式下切换到确切的 tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
" noremap <C-t> :tabnew split<CR>


" 命令:tabs可以显示已打开标签页的列表，并用“>”标识出当前页面，用“+”标识出已更改的页面。
" :tabe <文件名> 在新标签页中打开指定的文件。
" 如果你打开了多个缓冲区，那么使用命令:tab ball将为每一个打开的缓冲区，分别新建单独的标签页。
" :tabnew <文件名> 在新标签页中编辑新的文件。
" :tabc       关闭当前的 tab
" :tabc i     关闭第i个的标签
" vim -p files: 打开多个文件，每个文件占用一个标签页。
" :tabe/tabnew -- 如果加文件名，就在新的标签中打开这个文件， 否则打开一个空缓冲区。
" ^w gf -- 在新的标签页里打开光标下路径指定的文件。
" tabn或gt -- 切换到下一个标签。Control + PageDown，也可以。
" :tabp或gT -- 切换到上一个标签。Control + PageUp，也可以。
" {i}gt       移动到第i个标签页
" :tab split -- 将当前缓冲区的内容在新页签中打开。
" :tabc[lose] -- 关闭当前的标签页。
" :tabo[nly] -- 关闭其它的标签页。
" :tabs -- 列出所有的标签页和它们包含的窗口。
" :tabm[ove] [N] -- 移动标签页，移动到第N个标签页之后。 如 tabm 0 当前标签页，就会变成第一个标签页。
" :tablast   切换到最后一个标签
" :tabfirst   切换到第一个标签

"######################################## 缓冲区#################################


" ctrl + tab下一个buffer
" map <C-tab> :bn<CR>
" nnoremap <C-tab> :bn<CR>
nnoremap  ]b :bn<CR>
nnoremap  ;e :bn<CR>
" nnoremap  `e :bn<CR>
" nnoremap  <M-l> :bn<CR>
" ctrl + shift + tab下一个buffer
" map <C-M-tab> :bp<CR>
" nnoremap <C-M-tab> :bp<CR>
nnoremap  [b :bp<CR>
nnoremap  ;a :bp<CR>
" nnoremap  `a :bp<CR>
" nnoremap  <M-h> :bp<CR>

" :buffers或:ls或:files 显示缓冲区列表。
" ctrl+^：在最近两个缓冲区间切换。
" :bn -- 下一个缓冲区。
" :bp -- 上一个缓冲区。
" :bl -- 最后一个缓冲区。
" :b[n]或:[n]b -- 切换到第n个缓冲区。
" :nbw(ipeout) -- 彻底删除第n个缓冲区。
" :nbd(elete) -- 删除第n个缓冲区，并未真正删除，还在unlisted列表中。
" :ba[ll] -- 把所有的缓冲区在当前页中打开，每个缓冲区占一个窗口。


" :e 文档名        这是在进入vim后，不离开 vim 的情形下打开其他文档。



""""""""""""""""""""""""""""""""""""""" Markdown 快捷键""""""""""""""""""""""""""""""""""""""""
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>


"############################### 美化标签栏方法1 #######################################
" TabLine (普通标签样式)／TabLineSel (选中状态标签的样式)。
highlight TabLine        term=underline    cterm=bold    ctermfg=9   ctermbg=4
highlight TabLineSel     term=bold         cterm=bold   ctermbg=Red  ctermfg=yellow


" 定义颜色
hi SelectTabLine     term=Bold     cterm=Bold         ctermfg=196  guifg=#FF0000     ctermbg=black  guibg=#000000
hi SelectPageNum     term=Bold     cterm=Bold         ctermfg=red   guifg=#FF0000    ctermbg=black  guibg=#000000
hi Selectkuohao      term=Bold     cterm=Bold         ctermfg=10   guifg=#00FF00     ctermbg=black  guibg=#000000


hi NormalTabLine     term=Bold     cterm=Bold        ctermfg=blue   guifg=#0000FF       ctermbg=246  guibg=#696969
hi NormalPageNum     term=Bold     cterm=Bold        ctermfg=93     guifg=#9400D3       ctermbg=246   guibg=#696969
hi Normalkuohao      term=Bold     cterm=Bold        ctermfg=16     guifg=#000000       ctermbg=246     guibg=#696969



" " (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            " let s .= '%#TabNum#'
            let s .= (i == t ? '%#Selectkuohao#' : '%#Normalkuohao#')
            let s .=  '['
            let s .= (i == t ? '%#SelectPageNum#' : '%#NormalPageNum#')
            let s .=  i
            " let s .= '%*'
            let s .= (i == t ? '%#SelectTabLine#' : '%#NormalTabLine#')

            for bufnr in buflist
                if getbufvar(bufnr, "&modified")
                    let s .= '+'
                    break
                endif
            endfor

            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[新建文件]'
            endif
            let s .= ' ' . file .''
            let s .= (i == t ? '%#Selectkuohao#' : '%#Normalkuohao#')
            let s .=  ']'
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif



"设置鼠标运行模式为 WINDOWS 模式
" behave mswin

" 平台判断
function! GetSystem()
    if (has("win32") || has("win95") || has("win64") || has("win16"))
        return "windows"
    elseif has("unix")
        return "linux"
    else has("mac")
        return "mac"
    endif
endfunction


" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================


" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif


" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" -----------------------------------------------------------------------------
"  < Windows Gvim 默认配置> 做了一点修改
" -----------------------------------------------------------------------------
if (g:iswindows && g:isGUI)
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

"######################################################################################


""""""""""""""""""""""""""""""""""""""""C语言的编译运行"""""""""""""""""""""""""""""""""""""""""
" "一键执行python代码
" map <F5> :call RunPython()<CR> "一键执行python代码
"
" func! RunPython()
"     exec "W"
"     if &filetype=='python'
"         exec"!time ipython %"
"     endif
" endfunc                       "或者把python3.6改为python解释器的位置：/home/jack/anaconda3/bin/python3


"C,C++的调试
map <F7> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


" <F5>编译C/C++/java/，<F6>运行C/C++/java
" <F5>解释运行python/sh
augroup ccompile
    autocmd Filetype c map <F5> <Esc>:w<CR>:!time gcc % -std=c99 -g -o %< -lm <CR>
    autocmd Filetype cpp map <F5> <Esc>:w<CR>:!time g++ % -std=c++11 -g -o %< -lm <CR>
    "autocmd Filetype python map <F5> <Esc>:w<CR>:!python2 % <CR>
    "autocmd Filetype python map <F5> <Esc>:w<CR>:!time python3.6 % <CR>
    autocmd Filetype python map <F5> <Esc>:w<CR>:!time ipython  % <CR>
    autocmd Filetype java map <F5> <Esc>:w<CR>:!time javac % <CR>
    autocmd Filetype sh map <F5> <Esc>:w<CR>:!./% <CR>
augroup END

augroup crun
    autocmd Filetype c map <F6> <Esc>:!time ./%< <CR>
    autocmd Filetype cpp map <F6> <Esc>:!time ./%< <CR>
    autocmd Filetype java map <F6> <ESC>:!time java %< <CR>
augroup END

" 整行注释
augroup comment
    autocmd Filetype c noremap <buffer> <localleader>/ I//<Esc>
    autocmd Filetype cpp noremap <buffer> <localleader>/ I//<Esc>
    autocmd Filetype h noremap <buffer> <localleader>/ I//<Esc>
augroup END

augroup nocomment
    autocmd Filetype c noremap <buffer> <localleader>. ^xx
    autocmd Filetype cpp noremap <buffer> <localleader>. ^xx
    autocmd Filetype h noremap <buffer> <localleader>. ^xx
augroup END


" 大括号补全
autocmd Filetype c,cpp,h inoremap {<CR> {<CR>}<Esc>O


" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  if &filetype == 'vim'
    " exec "source ~/.config/nvim/init.vim"
  endif
endfunc

"这里嘛。。是用来一键编译代码的
noremap <M-r> :call CompileRunGcc_girl()<CR>
func! CompileRunGcc_girl()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -10
    :term ./%<
    exec "!rm -rf ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!" google-chrome-stable " % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device
    CocCommand flutter.dev.openDevLog
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  endif
endfunc



""""""""""""""""""""""""""""""""""""""""C语言的编译运行"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"====================================30s,自动保存文件========================================="
let autosave=10
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头，比如预处理命令，和编码设置。并且可以在每次修改后记录修改时间
autocmd BufNewFile *.py,*.cpp,*.v,*.sv,*.[ch],*.sh,*.java  exec ":call SetTitle()"
"上面一行中*.py之间*.v除了逗号不能有空格
"autocmd BufWrite *.[ch] call SetLastModifiedTime(-1)
""定义函数SetTitle，自动插入文件头
function! SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#! /usr/bin/env bash")
        call append(line("."),"\#########################################################################")
        call append(line(".")+1, "\# File Name: ".expand("%"))
        call append(line(".")+2, "\# Author:陈俊杰")
        call append(line(".")+3, "\# mail: 2716705056@qq.com")
        " call append(line(".")+4, "\# Created Time: ".strftime("%Y.%m.%d"))
        call append(line(".")+4, "\# Created Time: ".strftime("%c"))
        call append(line(".")+5, " ")
        call append(line(".")+6, "\# 此程序的功能是：")
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")
        call append(line(".")+9, "")
        call append(line(".")+10, "")
    elseif &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python3")
        call append(line("."), "\#!-*-coding=utf-8-*-")
        call append(line(".")+1, "\#########################################################################")
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author: 陈俊杰")
        call append(line(".")+4, "\# Created Time: ".strftime("%c"))
        call append(line(".")+5, "")
        " call append(line(".")+5, "\# Created Time: ".strftime("%Y.%m.%d"))
        call append(line(".")+6, "\# mail: 2716705056@qq.com")
        call append(line(".")+7, "\#此程序的功能是：")
        call append(line(".")+8, "")
        call append(line(".")+9, "\#########################################################################")
        call append(line(".")+10, "import pandas as pd")
        call append(line(".")+11, "import numpy as np")
	call append(line(".")+12, "import scipy as scp")
        call append(line(".")+13, "import matplotlib.pyplot as plt")
	call append(line(".")+14, "import os, time")
        call append(line(".")+15, "")
    elseif &filetype == 'java'
        call setline(1, "//coding=utf8")
        call setline(2, "/**")
        call setline(3, "\ *\ @Author: 陈俊杰")
        call setline(4, "\ *\ @mail: 2716705056@qq.com ")
        call setline(5, "\ *\ @File Name: ".expand("%"))
        call setline(6, "\ *\ @Created Time : ".strftime("%c"))
        call setline(7, "\ *\  ")
        call setline(8, "\ *\ @此程序的功能是:")
        call setline(9, "\ */")
        call setline(10,"")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), ">> File Name: ".expand("%"))
        "call append(line(".")+1, ">> Author: chenjunjie")
        call append(line(".")+1, ">> Author: 陈俊杰")
        call append(line(".")+2, ">> Mail: 2716705056qq.com")
        call append(line(".")+3, " ")
        call append(line(".")+4, ">> Created Time: ".strftime("%c"))
        call append(line(".")+5, "")
        call append(line(".")+6, ">> 此程序的功能是：")
        call append(line(".")+7, "************************************************************************/")
        call append(line(".")+8, "")

        if &filetype == 'cpp'
            call append(line(".")+9, "#include<bits/stdc++.h>")
            call append(line(".")+10, "using namespace std;")
            call append(line(".")+11, "")
            call append(line(".")+12, "")
            call append(line(".")+13, "int main(int argc, char *argv[])")
            call append(line(".")+14, "{")
            call append(line(".")+15, "}")
        elseif &filetype == 'c'
            call append(line(".")+9, "#include<stdio.h>")
            call append(line(".")+10, "#include<stdlib.h>")
            call append(line(".")+11, "#include<float.h>")
            call append(line(".")+12, "#include<limits.h>")
            call append(line(".")+13, "#include<math.h>")
            call append(line(".")+14, "#include<string.h>")
            call append(line(".")+15, "#include<sys/socket.h>")
            call append(line(".")+16, "#include<stddef.h>")
            call append(line(".")+17, "#include<locale.h>")
            call append(line(".")+18, "#include<time.h>")
            call append(line(".")+19, "#include<complex.h>")
            call append(line(".")+20, "#include<stdbool.h>")
            call append(line(".")+21, "")
            call append(line(".")+22, "")
            call append(line(".")+23, "int main(int argc, char *argv[])")
            call append(line(".")+24, "{")
            call append(line(".")+25, "}")
        else
            call append(line(".")+9, " ")

        endif
    endif
endfunction

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

function! SetLastModifiedTime(lineno)
    let modif_time = strftime( '%c', getftime(bufname('%')) )
    if a:lineno == "-1"
        let line = getline(7)
    else
        let line = getline(a:lineno)
    endif

    if line =~ '^sLast Modified'
        let line = '>> Last Modified : '.modif_time
    else
        let line = '>> Last Modified : '.modif_time
    endif

    if a:lineno == "-1"
        call setline(7, line)
    else
        call append(a:lineno, line)
    endif
endfunc
""""""""""""""""""""""""""""""""""""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""


" <SPC> c l 注释选择的行。一般我会V然后选择多行，然后按<SPC> c l注释掉选择的行。取消注释也是这样。c l就是comment lines的意思。
" 如果觉得SPC c l稍微麻烦（不同字母嘛），添加下面的代码到init.vim。
call SpaceVim#custom#SPC('nmap', ['c', 'c'], '<Plug>NERDCommenterInvert', 'comment or uncomment lines', 0)




let g:spacevim_colorscheme = 'onedark'
let g:spacevim_guifont='CascadiaCove\ Nerd\ Font:h12'














