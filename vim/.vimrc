execute pathogen#infect()

let mapleader = "\<space>"

" environment
set title number
set tabstop=4 expandtab shiftwidth=4
set ignorecase smartcase hlsearch
set shortmess+=I

" default colorscheme is useless for diffs
if &diff
    colorscheme evening
    set diffopt+=iwhite
    set diffexpr=""
endif

" folding
set foldenable "foldmethod=syntax foldlevel=1

" fortran specific
" formatoptions to match debian settings...
autocmd FileType fortran setlocal fo+=cq
autocmd FileType fortran let b:fortran_do_enddo=1
autocmd FileType fortran let fortran_free_source=1

set textwidth=90
" unless PEP8 is in force.
autocmd FileType python set textwidth=80
" or making git commits
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set wrap
if has('colorcolumn')
    set colorcolumn=90
    autocmd FileType python set colorcolumn=80
    autocmd FileType gitcommit set colorcolumn=72
endif

" Visual word wrap
set formatoptions=1
set lbr

" search for tag files in parent directory in addition to the current
" directory.
set tags=tags;

" plugin config
nnoremap <F5> :GundoToggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0

let g:syntastic_python_checkers = ['python']
" not finding fortran modules is just too bloody annoying 
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['fortran', 'tex'] }
let g:syntastic_cpp_compiler_options = '-std=c++11'

" clear signcolumn
highlight clear SignColumn
" vim-gitgutter used SignColumn to set its colours; reload it
call gitgutter#highlight#define_highlights()
