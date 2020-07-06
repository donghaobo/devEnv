let &termencoding=&encoding
set fileencodings=gb2312,utf-8,gbk,big5
set hlsearch
nmap <F9> <C-W>-
nmap <F10> <C-W>+
nmap <F11> <C-W><
nmap <F12> <C-W>>
set nu
set tabstop=4
set shiftwidth=4
set expandtab
" %retab!
set splitright
nmap <F5> :!if [ -x gen_tags.sh ];then ./gen_tags.sh;else cscope -Rbc;fi <CR><CR>:cscope reset <CR><CR>
if &diff
    colorscheme evening
endif
colorscheme desert
syntax on
nmap <C-a>o :TlistOpen<CR>
nmap <C-a><C-a>o :TlistClose<CR>

