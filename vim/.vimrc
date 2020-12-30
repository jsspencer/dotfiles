" Enable modern vim features
set nocompatible

" 1. Basic options

" Automatically change the workinh path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" use » to mark tabs and ° to mark trailing whitespace.
set list listchars=tab:»\ ,trail:°

" By default, shift-k opens up man pages. This isn't super useful for instead remap it.
noremap <s-k> <CR>

" Explicitly set the leader to comma
let mapleader = ','
" Show when leader is active
set showcmd
" Reload vimrc
noremap <leader>RR :source ~/.vimrc<CR>

" search
set ignorecase smartcase hlsearch

" more colours!
set t_Co=256

" line numbering
set number
set relativenumber

" 2. Plugins

call plug#begin('~/.vim/plugged')
  " sane defaults
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-commentary'
  " status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " VCS status
  Plug 'mhinz/vim-signify'
  " Undo tree
  Plug 'sjl/gundo.vim'
  " Focused writing
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  " themes
  Plug 'NLKNguyen/papercolor-theme'
  "  better syntax highlighting
  Plug 'vim-python/python-syntax'
  " lanaguage analysis, checking
  "Plug 'dense-analysis/ale'
  Plug 'natebosch/vim-lsc'
  " note taking
  Plug 'vimwiki/vimwiki'
call plug#end()

" 3. Plugin configuration

" Dfeault update time of 40000ms for vim-signify is not great for async
" updates...
set updatetime=25

" gundo: use python3 instead of python2. F5 keybinding.
let g:gundo_prefer_python3=1
noremap <F5> :GundoToggle<CR>

" focus
let g:goyo_width=90
" see help cterm-colors
let g:limelight_conceal_ctermfg = 'gray'
" see help gui-colors
let g:limelight_conceal_guifg = 'DarkGray'
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

let g:airline#extensions#ale#enabled = 1

" themes
" From https://github.com/NLKNguyen/papercolor-theme/blob/master/README.md
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
set background=light
colorscheme PaperColor

" LSC
let g:lsc_auto_map = v:true
let g:lsc_server_commands = {
  \   'fortran': 'fortls',
  \   'python': 'pyls',
  \   }

" vimwiki
let wiki_1 = {}
let wiki_1.path = '~/vimwiki'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = 'md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" 4. file-specific settings

" mutt
" remove signatures when replying...
autocmd BufRead */tmp/mutt* normal :g/^> -- $/,/^$/-1d^M/^$^M^L

" fortran specific
" formatoptions to match debian settings...
autocmd FileType fortran setlocal fo+=cq
autocmd FileType fortran let b:fortran_do_enddo=1
autocmd FileType fortran let fortran_free_source=1

" TODO: still needed?
" set textwidth=90
" " unless PEP8 is in force.
" autocmd FileType python set textwidth=80
" " or making git commits
" autocmd FileType gitcommit set textwidth=72
" autocmd FileType gitcommit set wrap
" if exists('+colorcolumn')
"     set colorcolumn=+1,+2
" endif

" 5. fin

" Plugins must be added and configured before the following lines.
filetype plugin indent on
syntax on
