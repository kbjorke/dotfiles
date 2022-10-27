"function! BackupDir()
"   let l:backupdir=$HOME.'/.vim/backup/'.expand('%:p:h')
"               "\substitute(expand('%:p:h'), '^'.$HOME, 'HOME', '')
"   if !isdirectory(l:backupdir)
"      call mkdir(l:backupdir, 'p', 0700)
"   endif
"endfunction
"
"autocmd! BufWritePre * :call BackupDir()
"autocmd! BufWritePost * silent! execute "w" $HOME . "/.vim/backup" . expand("%:p:h") . "/" . expand("%") . strftime("~%Y-%m-%d_%H-%M-%S~")

set clipboard^=unnamed,unnamedplus

set laststatus=2

call plug#begin()
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
call plug#end()

"syntax on
"filetype plugin indent on
"
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
