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
" Save current state of vim files (necessary for restoring tmux sessions):
Plug 'tpope/vim-obsession'
" Sensible vim settings:
Plug 'tpope/vim-sensible'
" Statusline for vim:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Programming language support for vim:
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Pencil color scheme for vim
Plug 'preservim/vim-colors-pencil'
call plug#end()

" Coc-nvim extensions
let g:coc_global_extensions = ['coc-clangd', 'coc-yaml', 'coc-texlab', 'coc-sh', 'coc-pyright']

" Enable Pencil light color scheme
set background=light
colorscheme pencil

" Pencil color scheme configurations
let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
let g:pencil_neutral_headings = 0   " 0=blue (def), 1=normal
let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
let g:pencil_terminal_italics = 1

" Enable pencil airline theme
let g:airline_theme = 'pencil'
