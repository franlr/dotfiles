"
" General
"
set nocompatible             " not compatible with the old-fashion vi mode

"
" User Interface
"
set showmode                 " display the current mode
set ruler                    " always show current position
set scrolloff=7              " set scroll offset to 7 lines above/below cursor
set autoread                 " auto read when file is changed from outside
set number                   " show line numbers
set numberwidth=6            " make the number gutter 6 characters wide
set clipboard=unnamed        " yank to the system register (*) by default
set hid                      " hide abandon buffers in order to not lose undo history
set showmatch                " cursor shows matching ) and }
set incsearch                " incremental search
set ignorecase               " ignore case when searching
set smartcase                " ignore case if search pattern is all lowercase, case-sensitive otherwise
set wildchar=<TAB>           " start wild expansion in the command line using <TAB>
set wildmenu                 " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,b,s,h,l,[,]

filetype on                  " enable filetype detection
filetype indent on           " enable filetype-specific indenting
filetype plugin on           " enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! BufWritePost .vimrc source ~/.vimrc

" disable annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" vimtip#80 restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"
" Formatting
"
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
autocmd FileType Makefile set noexpandtab
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

"
" Colours
"
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme molokai       " set colorscheme

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

"
" Formatting
"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>         " toggle paste mode
set ffs=unix,dos,mac         " use unix as standard file format

"
" Files
"
set nobackup                 " no *~ backup files

"
" Statusline
"
set laststatus=2

"
" Encoding
"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,latin1

fun! ViewUTF8()
  set encoding=utf-8
  set termencoding=big5
endfun

fun! UTF8()
  set encoding=utf-8
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

