"pythonϵͳ����
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

"���ñ����ʽ
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_cn.utf-8

"�رռ���ģʽ
set nocompatible

"����ȡ������
set noundofile
set nobackup
set noswapfile

"��״̬����ʾ�������������
set showcmd

"������ʷ��¼����
set history=1000

"��ʾ���������
set ruler

"ӳ������
"�ļ��л�
map , <C-^>
"��ǰ�ļ�·��������ϵͳ���а�
nnoremap <silent> <F8> : call GetCurFilePath()<CR>
"�������ļ�
map <F9> :e E:\Program Files\Vim\_vimrc<CR>

"trunk
"cd E:\project

"�����ļ�
map <Space> :w<CR>
"��һ�������ļ�
nnoremap <silent> [b :bprev<CR>
"��һ�������ļ�
nnoremap <silent> ]b :bnext<CR>
"��һ�������ļ�
nnoremap <silent> [B :bfirst<CR>
"���һ�������ļ�
nnoremap <silent> ]B :blast<CR>

"��һ�������б��ļ�
nnoremap <silent> [a :prev<CR>:ar<CR>
"��һ�������б��ļ�
nnoremap <silent> ]a :next<CR>:ar<CR>
"��һ�������б��ļ�
nnoremap <silent> [A :first<CR>:ar<CR>
"���һ�������б��ļ�
nnoremap <silent> ]A :last<CR>:ar<CR>
nnoremap <silent> <Left> :prev<CR>:ar<CR>
nnoremap <silent> <Right> :next<CR>:ar<CR>

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"�����ļ�����
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

"����python�ļ�����
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

"�����ļ�����
map <F4> :call Do_Test()<CR>
function Do_Test()
	execute "ls"
endfunction

"�ѵ�ǰ�ļ�·��������ϵͳ���а�
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
