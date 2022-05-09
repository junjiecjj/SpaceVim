

" 载入用户配置
function! myspacevim#before() abort
    let g:neomake_enabled_c_makers = ['clang']
    nnoremap jk <esc>
    "有时候在windows下编写的python脚本在linux下不能运行，因为^M的原因,设置格式为unix能够自动清除多余的^M
    set fileformat=unix
    set showmatch       " 高亮显示匹配的括号
    "设置标记，三个{定义为标记，可用za折叠展开
    set foldenable
    set foldmethod=marker
    autocmd FileType c,cpp,python set foldmethod=indent nofoldenable
    "解决乱码问题
    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=utf-8,gbk,latin1
    set langmenu=zh_CN.UTF-8
    set helplang=cn
    set ttyfast        "a fast terminal connection.
    "设置数字为十进制，防止<C-a><C-x>修改时出现不希望的结果
    set nrformats=
    "依文件类型设置自动缩进
    filetype plugin on
    filetype indent on
    "显示当前的行号(普通模式为相对)：
    set ruler
    set number
    set relativenumber
    augroup relative_numbser
        autocmd!
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set relativenumber
    augroup END
    "显示行尾多余空格与tab符号
    set listchars=tab:»-,trail:■
    set list
    "将制表符扩展为空格
    set expandtab
    "设置编辑时制表符占用空格数
    set tabstop=4
    "设置格式化时制表符占用空格数
    set shiftwidth=4
    " 关闭softtabstop 永远不要将空格和tab混合输入
    set softtabstop=0
    "开启自动缩进
    set autoindent   " Indent at the same level of the previous line
    "开启智能对齐
    set smartindent
    "设置使用 C/C++ 语言的自动缩进方式
    set cindent
    "设置命令行的高度
    set cmdheight=1
    "设置大小写不敏感/当前为大写字母时调整为敏感/自动改动字母大小写
    set ignorecase
    set smartcase
    set infercase
    set smarttab        " insert tabs on the start of a line according to context
    set magic
    "单词自动补全功能,写博客时用,自定义词典可参考网上教程
    ""set dictionary+=/usr/share/dict/american-english
    set dictionary+=/usr/share/dict/engspchk-dict
    set completeopt+=noinsert


    ".Md文件也能被识别为markdown
    autocmd BufNewFile,BufRead *.Md set filetype=markdown
    "ejs识别为html
    autocmd BufNewFile,BufRead *.ejs set filetype=html
    "Scons相关脚本识别为python
    autocmd BufNewFile,BufRead SConstruct set filetype=python
    autocmd BufNewFile,BufRead SConscript set filetype=python

    " 焦点消失的时候自动保存
    au FocusLost * :wa
    au FocusGained,BufEnter * :checktime
    " 当文件被其他编辑器修改时，自动加载
    set autowrite
    set autoread
    " 重新映射 leader 键
    " let g:mapleader = ','

    " 让 leaderf 可以搜索 git 的 submodule，否则 submodule 的文件会被自动忽略
    let g:Lf_RecurseSubmodules = 1
    let g:table_mode_corner='|'

    " 调节 window 大小
    let g:winresizer_start_key = '<space>wa'
    " If you cancel and quit window resize mode by `q` (keycode 113)
    let g:winresizer_keycode_cancel = 113

    " 让file tree 显示文件图标，需要 terminal 安装 nerd font
    let g:spacevim_enable_vimfiler_filetypeicon = 1
    " 让 filetree 显示 git 的状态
    " let g:spacevim_enable_vimfiler_gitstatus = 1

    " 默认 markdown preview 在切换到其他的 buffer 或者 vim
    " 失去焦点的时候会自动关闭 preview
    let g:mkdp_auto_close = 0
    " 书签选中之后自动关闭 quickfix window
    let g:bookmark_auto_close = 1

    " vim-lsp-cxx-highlight 和这个选项存在冲突
    " let g:rainbow_active = 1


    " 让光标自动进入到popup window 中间
    let g:git_messenger_always_into_popup = v:true
    " 设置映射规则，和 spacevim 保持一致
    " lazygit，利用 floaterm，在vim 中间运行 lazygit。
    "  GitMessenger可以显示所在行的 git blame 信息。
    call SpaceVim#custom#SPC('nnoremap', ['g', 'm'], 'GitMessenger', 'show commit message in popup window', 1)
    call SpaceVim#custom#SPC('nnoremap', ['g', 'l'], 'FloatermNew lazygit', 'open lazygit in floaterm', 1)

    " 和 sourcetrail 配合使用
    "call SpaceVim#custom#SPC('nnoremap', ['a', 'a'], 'SourcetrailStartServer', 'start sourcetrail server', 1)
    "call SpaceVim#custom#SPC('nnoremap', ['a', 'b'], 'SourcetrailActivateToken', 'sync sourcetrail with neovim', 1)
    "call SpaceVim#custom#SPC('nnoremap', ['a', 'f'], 'SourcetrailRefresh', 'sourcetrail server', 1)

    " 设置默认的pdf阅览工具
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_syntax_conceal_default = 0
    " 关闭所有隐藏设置
        let g:tex_conceal = ""

    " 实现一键运行各种文件，适合非交互式的，少量的代码，比如 leetcode {{{
    func! QuickRun()
        exec "w"
        let ext = expand("%:e")
        let file = expand("%")
        if ext ==# "sh"
            exec "!bash %"
        elseif ext ==# "cpp"
            exec "!clang++ % -Wall -g -std=c++17 -o %<.out && ./%<.out"
        elseif ext ==# "c"
            exec "!clang % -Wall -g -std=c11 -o %<.out && ./%<.out"
        elseif ext ==# "java"
            let classPath = expand('%:h')
            let className = expand('%:p:t:r')
            " echo classPath
            " echo className
            exec "!javac %"
            exec "!java -classpath " . classPath . " " . className
        elseif ext ==# "go"
            exec "!go run %"
        elseif ext ==# "js"
            exec "!node %"
        elseif ext ==# "bin"
            exec "!readelf -h %"
        elseif ext ==# "py"
            exec "!python3 %"
        elseif ext ==# "vim"
            exec "so %"
        elseif ext ==# "html"
            exec "!microsoft-edge %"
        elseif ext ==# "rs"
            call CargoRun()
        else
            echo "Check file type !"
        endif
        echo 'done'
    endf
    "===============================插件配置======================================"
    " floaterm - 浮动终端窗口
    let g:floaterm_keymap_prev   = '<C-p>'
    let g:floaterm_keymap_new    = '<C-n>'
    let g:floaterm_keymap_toggle = '<F5>'

    "gutentags配置，由于依靠compile_command.json总是跳转到安装目录，不方便编辑源文件，还是用ctags吧
    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_modules = ['ctags']
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    let g:gutentags_ctags_exclude=['.ccls-cache','build','install']
    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    " 检测 ~/.cache/tags 不存在就新建 "
    if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
    endif
    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " airline代替statusline，部分配置在bootsrap_after
    call SpaceVim#layers#disable('core#statusline')
    call SpaceVim#layers#disable('core#tabline')
    " 关闭最右边栏
    let g:airline#extensions#whitespace#enabled = 0
    " 不显示git分支
    let g:airline#extensions#branch#enabled = 0
    " 去掉section B和X
    let g:airline_section_b = ''
    "let g:airline_section_x = ''
    let g:airline_section_x = '%-0.25{getcwd()}'

endf



" 启动函数 VimEnter autocmd后执行
func! myspacevim#after() abort
  "-----------------------------------------------------------------------------
  " 自动动作配置
    " 设置 启动vim时的工作目录
    let g:Source="~"   " 用户目录
    "set autochdir     " 自动切换到当前编辑的文件所在路径 会与NERDTree冲突
    " 手动切换到当前选中文件所在目录路径 :cd %:p:h
    nnoremap <leader>. :cd %:p:h<cr>
    " 打开自动定位到最后编辑的位置, 需要确认.viminfo当前用户可写
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    "关闭最后一个文件编辑buffer窗口时，自动退出其余所有NERDTree、Quickfix窗口
    "autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

    "关闭最后一个文件编辑buffer窗口时，打开 vim-project 面板(需要安装amiorin/vim-project插件)
    "autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | Welcome | endif

    "关闭最后一个文件编辑buffer窗口时，打开 Startify 面板(需要安装mhinz/vim-startify插件)
    autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | Startify | endif
" -----------------------------------------------------------------------------
    "一般关闭paste模式，该模式下有的map会出问题
    set nopaste
    "不自动分行(但可以分行显示）
    set wrap
    set textwidth=0
    " Search mappings: These will make it so that going to the next one in a
    " search will center on the line it's found in.
    nnoremap n nzzzv
    nnoremap N Nzzzv
    "Ctrl+Space单词补全"
    "WSL系统中此快捷键不管用，故换成下面一条
    "inoremap <C-@> <C-x><C-k>
    inoremap <C-f> <C-x><C-k>
    "保存文件
    nnoremap <Leader>w  :w<CR>
    "选择全文
    noremap <M-a> <Esc>ggVG<CR>
    "退出
    nnoremap  qw    :wq<CR>
    nnoremap  qq    :q!<CR>
    "插入模式下移动光标
    inoremap <C-k> <Up>
    inoremap <C-h> <Left>
    inoremap <C-l> <Right>
    inoremap <C-j> <Down>
    "向后删除 *为向前删除，shell通用
    inoremap <C-d> <Delete>
    "超级用户权限编辑，出现权限不够无法保存时命令模式输入sw即可
    cnoremap sw w !sudo tee >/dev/null %
    "可视模式下用*和#查找选中文本
    xnoremap * :<C-u>call <SID>VsetSearch()<CR>/<C-R>=@/<CR><CR>
    xnoremap # :<C-u>call <SID>VsetSearch()<CR>?<C-R>=@/<CR><CR>
    function! s:VsetSearch()
        let temp=@s
        norm! gv"sy
        let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n','g')
        let @s= temp
    endfunction
    "" Switching windows
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
    noremap <C-h> <C-w>h
    "" Move visual block
    vnoremap K :m '<-2<CR>gv=gv
    vnoremap J :m '>+1<CR>gv=gv
    "关闭高亮直到下一次查找
    cnoremap hl  nohlsearch<CR>

    nnoremap  <F4>  :call QuickRun()<CR>
    " <F5> floaterm toggle
    " <F7> 打开历史记录
    tnoremap  <Esc>  <C-\><C-n>

    " 窗口间切换
    "map <Tab> :wincmd w<CR>

    " coc-smartf配置，press <esc> to cancel.
    nmap f <Plug>(coc-smartf-forward)
    nmap F <Plug>(coc-smartf-backward)
    nmap ; <Plug>(coc-smartf-repeat)
    nmap , <Plug>(coc-smartf-repeat-opposite)
    augroup Smartf
      autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=pink
      autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
    augroup end

    "目录栏设置相对行号
    autocmd FileType defx setlocal relativenumber

    "同时显示git信息和line number
    set signcolumn=yes

    "===============================插件配置======================================"
    " vim-beanCount
    "path to your root beancount file
    let b:beancount_root= '~/Desktop/repositories/beanCount_zcp/zcp.bean'
    " default or chunks
    let g:beancount_account_completion= 'default'
    let g:beancount_separator_col= 10
    " If non-zero, accounts higher down the hierarchy will be listed first as completions.
    let g:beancount_detailed_first = 1
    autocmd Filetype beancount inoremap . .<C-\><C-O>:AlignCommodity<CR>
    autocmd Filetype beancount inoremap <C-o> <C-x><C-O>

    " vim-airline
    " 去掉LN显示
    let g:airline_symbols.linenr= ''
    " 加入Window编号
    function! WindowNumber(...)
        let builder = a:1
        let context = a:2
        call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
        return 0
    endfunction
    call airline#add_statusline_func('WindowNumber')
    call airline#add_inactive_statusline_func('WindowNumber')
    " 用airline时`SPC num`跳转窗口失效，重新映射
    noremap <Space>1 1<C-w>w
    noremap <Space>2 2<C-w>w
    noremap <Space>3 3<C-w>w
    noremap <Space>4 4<C-w>w
    "===============================插件配置======================================"
    " 快捷菜单插件 skywind3000/quickmenu.vim 配置

    " 使用说明

    " 配置
    " 允许显示命令行帮助（ H ），以及 cursorline （ L ）
    let g:quickmenu_options = "LH"

    " 清除当前目录中所有内容
    call g:quickmenu#reset()

    " 设置 打开：显示 /隐藏 该菜单面板快捷键
    noremap <silent><F12> :call quickmenu#toggle(0)<cr>  " <F12> 键打开
    "noremap <silent><space> :call quickmenu#toggle(0)<cr> " 空格键打开
    " 由井号开始的字符串表示一个分组
    " 分组1 : UI
    call g:quickmenu#append('# UI', '')
    call g:quickmenu#append('打开首页',               ':Startify',               '执行:Startify')
    call g:quickmenu#append('自动换行',               ':set wrap!',              '执行:set wrap! 快捷键 <leader>sw')
    call g:quickmenu#append('制表符换行符显隐',       ':set list!',              '执行:set list! 快捷键 <leader>sl')
    call g:quickmenu#append('目录树NERDTree',         ':NERDTReeToggle',         '执行:NERDTReeToggle')
    call g:quickmenu#append('撤销树Undotree',         ':UndotreeToggle',         '执行:UndotreeToggle')
    call g:quickmenu#append('标签列表Tlist',          ':TlistToggle',            '执行:TlistToggle')
    call g:quickmenu#append('任务标签列表Tasklist',   ':TaslistToggle',          '执行:TaslistToggle')
    call g:quickmenu#append('缩进指示线indentLine',   ':IndentLinesToggle',      '执行:IndentLinesToggle')

    " 分组2 : Git
    call g:quickmenu#append('# Git', '')
    call g:quickmenu#append('查看git日志',   ':Glog',   '执行:Glog')
    call g:quickmenu#append('查看git blame', ':Gblame', ':执行:Gblame')

    " 第三方软件打开
    call g:quickmenu#append('# 第三方软件预览', '')
    call g:quickmenu#append('chrome预览',   ':Chrome', '执行:Chrome')
    call g:quickmenu#append('PowerShell',   'call OpenFolderWithApp("PowerShell")', ':执行:call OpenFolderWithApp("PowerShell")')
    "call g:quickmenu#append('Git-bash',     'call OpenFolderWithApp("Git-Bash")', ':执行:call OpenFolderWithApp("Git-Bash")')
    "call g:quickmenu#append('Git-gui',      'call OpenFolderWithApp("Git-Gui")', ':执行:call OpenFolderWithApp("Git-Gui")')

" 自定义函数
    call g:quickmenu#append('# 自定义函数', '')
    call g:quickmenu#append('复制当前文件目录地址到剪贴板',   ':call GetCurFilePath()', '执行: call GetCurFilePath()')

" 帮助/助记
    call g:quickmenu#append('# 帮助/助记','')
    call g:quickmenu#append('底部打开命令窗口 快捷键Alt+=',':Term','执行快捷键，或用相关插件的配置Alt+=')
    call g:quickmenu#append('关闭Buff',':bd', '执行:bd')
" > 参考资料
    " + [漂亮的 Vim 弹出菜单插件](https://www.v2ex.com/amp/t/376762)
    " + [skywind3000/quickmenu.vim](https://github.com/skywind3000/quickmenu.vim)

" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------
" 代码注释插件 preservim/nerdcommenter
" SpaceVim有内置的代码注释 该插件会与之冲突或被禁用了
" SpaceVim 有内置代码注释 <space>+c+l 、<sapce>+c+u <space>+c+L
    " " 使用方法：
    "     " # <leader>cc // 注释
    "     " # <leader>cm 只用一组符号注释
    "     " # <leader>cA 在行尾添加注释
    "     " # <leader>c$ /* 注释 */
    "     " # <leader>cs /* 块注释 */
    "     " # <leader>cy 注释并复制
    "     " # <leader>c<space> 注释/取消注释
    "     " # <leader>ca 切换　// 和 /* */
    "     " # <leader>cu 取消注释
    "
    " " 配置
    "     " let g:NERDSpaceDelims = 1
    "     " let g:NERDDefaultAlign = 'left'
    "     " let g:NERDCustomDelimiters = {
    "     "             \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
    "     "             \ 'less': { 'left': '/**', 'right': '*/' }
    "     "         \ }
    "
    "     " Add spaces after comment delimiters by default （默认情况下，在注释分隔符后添加空格）
    "     let g:NERDSpaceDelims = 1
    "
    "     " Use compact syntax for prettified multi-line comments （对经过修饰的多行注释使用紧凑语法）
    "     let g:NERDCompactSexyComs = 1
    "
    "     " Align line-wise comment delimiters flush left instead of following code indentation （按行对齐注释分隔符左对齐，而不是按代码缩进）
    "     let g:NERDDefaultAlign = 'left'
    "
    "     " Set a language to use its alternate delimiters by default （将语言设置为默认情况下使用其备用分隔符）
    "     let g:NERDAltDelims_java = 1
    "
    "     " Add your own custom formats or override the defaults（添加您自己的自定义格式或覆盖默认格式）
    "     let g:NERDCustomDelimiters = {
    "             \ 'c': { 'left': '/**','right': '*/' },
    "             \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
    "             \ 'less': { 'left': '/**', 'right': '*/' },
    "        \ }
    "
    "     " Allow commenting and inverting empty lines (useful when commenting a region)(允许注释和反转空行（在注释区域时有用）)
    "     let g:NERDCommentEmptyLines = 1
    "
    "     " Enable trimming of trailing whitespace when uncommenting (取消注释时启用尾随空白的修剪)
    "     let g:NERDTrimTrailingWhitespace = 1
    "
    "     " Enable NERDCommenterToggle to check all selected lines is commented or not (启用NerdCommentToggle以检查所有选定行是否已注释)
    "     let g:NERDToggleCheckAllLines = 1
" -----------------------------------------------------------------------------
""""""""""""  自定义函数: 快速输入时间
""""""""""""

    " --实现方案一, 然后在编辑文件时，在输入模式下，输入 xdate 或 xdatetime 后按回车，便可输入以下格式的时间：
        iab xdate <c-r>=strftime("20%y.%m.%d")<cr>
        iab xdatetime <c-r>=strftime("20%y/%m/%d %H:%M:%S")<cr>
        iab xdatetime1 <c-r>=strftime("20%y/%m/%d %H:%M:%S %p (%A) %z")<cr>

    " --实现方案二, linux系统的命令模式下 :r !date

    " > 参考资料
    " + [Vim技能修炼教程(15) - 时间和日期相关函数](https://www.jianshu.com/p/172982c0a5f4)

""""""""""""  自定义函数: 获取当前目录路径
""""""""""""

    " 将当前编辑的文件完全路径拷贝到系统剪贴板 --实现方案一
        " function GetCurFilePath()
        "     let cur_dir=getcwd()
        "     let dir_filename=cur_dir."\\"
        "     echo dir_filename.expand("%:r")."         done"
        "     call setreg('+',dir_filename)
        " endfunction

    " 将当前编辑的文件完全路径拷贝到系统剪贴板  --实现方案二
        function GetCurFilePath()
            let cur_dir=getcwd()
            let cur_file_name=getreg('%')
            let dir_filename=cur_dir."\\".cur_file_name
            echo dir_filename."         done"
            call setreg('+',dir_filename)
        endfunction

    " 使用说明
        " 命令模式下输入 ：call GetCurFilePath() 快速获取当前路径

    "" 快捷键设置
    "nnoremap <silent> <F9> : call GetCurFilePath()<cr>


""""""""""""  自定义函数:设置只有在是PHP文件时，才启用PHP补全 函数
""""""""""""

    " 前提
        " 1、 配置步骤：首先下载PHP函数列表文件，将该文件保存在目录 /etc/vim/下:
        " 2、 设置php函数列表文件地址（前提将php_funclist.txt文件放在 ~/php_funclist.txt ）

    " 设置在针对所有文件都启用了PHP补全
    " 将函数列表文件引入补全配置中
    " set dictionary-=/etc/vim/php_funclist.txt  dictionary+=/etc/vim/php_funclist.txt
    " set dictionary-='C:/Program Files (x86)/Vim/vimfiles/php_funclist.txt'  dictionary+='C:/Program Files (x86)/Vim/vimfiles/php_funclist.txt'

    " 设置只有在是PHP文件时，才启用PHP补全
    au FileType php call PHPFuncList()

    function PHPFuncList()
        set dictionary-=~/.vim/completion_dictionary/php_funclist.txt dictionary+=~/.vim/completion_dictionary/php_funclist.txt
        set complete-=k complete+=k
    endfunction

    " 使用方法
        " 进入vim编辑的时候，按下 (control+p)或者 ，就可以出现php的自动补全。

  """"""""""""  自定义函数:打开当前文件所在位置的文件管理器窗口
  """"""""""""

    "功能：当前文件所在位置，同时不阻塞当前窗口。


    function OpenFileLocation()
        if ( expand("%") != "" )
            execute "!start explorer /select, %"
        else
            execute "!start explorer /select, %:p:h"
        endif
    endfunction

    function OpenFolderWithApp(name)
    "function ViewInBrowser(name)
        let path = expand("%:p:h")
        echo "当前位置：" . path
        if has('win32') || has('win64') || has('win16') || has('win95')
            let l:browsers = {
                \"explorer":"explorer \/select, %:p:h",
                \"PowerShell":"powershell.exe -noexit -command Set-Location -literalPath  %:p:h",
                \"Git-Gui":"C:\\Program Files\\Git\\cmd\\git-gui.exe  --working-dir ",
                \"Git-Bash":"C:\\Program Files\\Git\\git-bash.exe --cd=%:p:h",
            \}

            "C:\Program Files\Git\cmd\git-gui.exe" "--working-dir" "%1"
            "powershell.exe -noexit -command Set-Location -literalPath '%V'
            "C:\Users\CodeRooster\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%V"
            "C:\Program Files\Git\git-bash.exe" "--cd=%1"

            " 执行命令用相应程序打开文件
            execute "!start "l:browsers[a:name]
        else
            let l:browsers = {
                \"ranger":"source ranger",
            \}
            execute "silent !"  l:browsers[a:name] file
        endif
    endfunction
    " 快捷方式映射
    map gb <ESC>:call OpenFileLocation()<CR>

    " 使用说明
        " 命令模式下 输入 gb 打开当前所在文件夹

    " 自定命令
    :command Open       :call OpenFolderWithApp("explorer")<cr>          " 用文件管理器打开
    :command PowerShell :call OpenFolderWithApp("PowerShell")<cr>        " 在PowerShell打开
    ":command Gitbash    :call OpenFolderWithApp("Git-Bash")<cr>          " 用Git-Bash打开
    ":command Gitgui     :call OpenFolderWithApp("Git-Gui")<cr>           " 用Git-Gui打开


endf


augroup MySpaceVim
  au!
  autocmd FileType markdown setlocal nowrap
augroup END
