" Ctrl + '\' + <n> to hilight current word, 1-9 for different colors, 0 clear
nmap <C-\>1 :Highlight 1 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>2 :Highlight 2 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>3 :Highlight 3 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>4 :Highlight 4 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>5 :Highlight 5 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>6 :Highlight 6 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>7 :Highlight 7 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>8 :Highlight 8 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>9 :Highlight 9 \<<C-R>=expand("<cword>")<CR>\><CR>
nmap <C-\>0 :Hclear \<<C-R>=expand("<cword>")<CR>\><CR>
