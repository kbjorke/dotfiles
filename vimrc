" Vim configuration file
"
" Made by: Kristian Bjørke

""" General settings:

" Pathogen:
execute pathogen#infect()
execute pathogen#helptags()

" Activating syntax highlighting and filetype detected
syntax on
filetype on

" Canges tab-character to insert a given number of white spaces,
" so that tab can be used as indent:
set tabstop=4
set shiftwidth=4
set expandtab

" Settings to enable automated indentation:
set smartindent
set autoindent

" Use ctrl-[inkl] to toggle between split windows.
nmap <silent> <c-i> :wincmd k<CR>
nmap <silent> <c-n> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Disable encryption:
set key=

" Wrap text at end of editor:
set wrap

" Command to turn of wrapping, sometime usefull to read column data
command Now set nowrap


""" Settings for vim Latex-Suite:

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


""" Filetype specific standard templates for new files:

autocmd BufNewFile *.py silent! 0r  ~/.vim/templates/kb_standard.py
autocmd BufNewFile *.tex TTemplate kb_standard


""" Settings for tagbar:

" Set toggle key for tagbar
nmap <F8> :TagbarToggle<CR>

""" Settings for MiniBufferExplorer:

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""" Settings for Solarized color scheme:

syntax on
set background=dark
colorscheme solarized




""" Functions for resizing termininal window when using vim:

" Function to size up.
function SizeUpFunc()
    if exists("g:oldColumns")
        return
    endif
    " Save the current width.
    let g:oldColumns = &columns
    let g:oldLines = &lines
    " Reset column size when Vim quits.
    au VimLeave * SizeDown
    " Bigger width to make room for line numbers and the sign markers.
    set columns=158 lines=50
endfunction
command SizeUp call SizeUpFunc()

" Function to size down.
function SizeDownFunc()
    if !exists("g:oldColumns")
        return
    endif
    " Restore the original size.
    let &columns = g:oldColumns
    let &lines = g:oldLines
    " Remove the variable.
    unlet g:oldColumns
    unlet g:oldLines
endfunction
command SizeDown call SizeDownFunc()

" Mappings for SizeUp and SizeDown.
map <C-Up> :SizeUp<CR>
map <1b>Oa :SizeUp<CR>
map <C-Down> :SizeDown<CR>
map <1b>Ob :SizeDown<CR>



""" IDE functions:

" Function and command to start up IDE
function IDEFunc()
    SizeUp
    set number " Turn on line numbers.
    NERDTree
    Tagbar
    wincmd l " Move cursor to main tab
endfunction

command IDE call IDEFunc()

" Function and command to end IDE
function NormalFunc()
    SizeDown
    set nonumber
    NERDTreeClose
    TagbarClose
endfunction

command Normal call NormalFunc()


" Automatically quit NERDTree
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        SizeDown
        q
      endif
    endif
  endif
endfunction


""" Tagbar key bindings
"nmap <leader>l <ESC>:TagbarToggle<cr>
"imap <leader>l <ESC>:TagbarToggle<cr>i
