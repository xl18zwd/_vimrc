"python系统配置
"set pythonthreedll=c:\\python39\\python39.dll
"set pythonthreehome=c:\\python39

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF'
Plug 'mattn/emmet-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'leafgarland/typescript-vim', { 'for': 'clojure' }
Plug 'aperezdc/vim-template'
Plug 'jiangmiao/auto-pairs'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Optional:
Plug 'honza/vim-snippets'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set nu
set hls
set tabstop=4
set laststatus=2
filetype on
syntax on

colorscheme lucius
LuciusDarkLowContrast
"colorscheme simplifysimplify-dark

"设置编码格式
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_cn.utf-8

"关闭兼容模式
set nocompatible

"设置取消备份
set noundofile
set nobackup
set noswapfile

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"显示光标行列数
set ruler

"映射设置
"文件切换
map , <C-^>
"当前文件路径拷贝到系统剪切板
nnoremap <silent> <F8> : call GetCurFilePath()<CR>
"打开配置文件
map <F9> :e E:\Program Files\Vim\_vimrc<CR>

"trunk
"cd E:\project

"保存文件
map <Space> :w<CR>
"上一个缓存文件
nnoremap <silent> [b :bprev<CR>
"下一个缓存文件
nnoremap <silent> ]b :bnext<CR>
"第一个缓存文件
nnoremap <silent> [B :bfirst<CR>
"最后一个缓存文件
nnoremap <silent> ]B :blast<CR>

"上一个参数列表文件
nnoremap <silent> [a :prev<CR>:ar<CR>
"下一个参数列表文件
nnoremap <silent> ]a :next<CR>:ar<CR>
"第一个参数列表文件
nnoremap <silent> [A :first<CR>:ar<CR>
"最后一个参数列表文件
nnoremap <silent> ]A :last<CR>:ar<CR>
nnoremap <silent> <Left> :prev<CR>:ar<CR>
nnoremap <silent> <Right> :next<CR>:ar<CR>

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"单个文件编译
map <F5> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
    "if expand("%:p:h")!=getcwd()
    "    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    "    return
    "endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="lua"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
	let fullname=expand("%:p")
	let cmd="!lua ".fullname
	execute cmd
endfunction

"单个python文件编译
map <F6> :call Do_OneFileMake_py()<CR>
function Do_OneFileMake_py()
    "if expand("%:p:h")!=getcwd()
    "    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    "    return
    "endif
    let sourcefileename=expand("%:t")
    "if (sourcefileename=="" || (&filetype!="py"))
    "    echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
    "    return
    "endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
	let fullname=expand("%:p")
	let cmd="!python ".fullname
	execute cmd
endfunction

"单个文件编译
map <F4> :call Do_Test()<CR>
function Do_Test()
	execute "ls"
endfunction

"把当前文件路径拷贝到系统剪切板
function GetCurFilePath()
    call setreg('+',expand("%:h"))
endfunction

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T

map <F7> :call Do_Test1()<CR>
function Do_Test1()
	":execute "normal! /\\d\<cr>\<C-A>"
	:execute "normal! :%s/\\d//gn\<cr>"
	:echo a
endfunction
