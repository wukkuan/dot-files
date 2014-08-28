syntax on

set t_Co=256

if has("gui_running")
  if has("gui_macvim")
    set guifont=Input\ Mono
  endif
endif

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set ignorecase smartcase
set colorcolumn=80
set ruler
set hlsearch
set incsearch
set visualbell                  " don't beep
set noerrorbells                " don't beep
set switchbuf=useopen
set backspace=indent,eol,start
filetype plugin indent on
set showcmd " show last command used in 
set scrolloff=3 " Start scrolling three lines before the horizontal window border.
set mat=5  " Bracket blinking." (doesn't work?)
set laststatus=2 " Always show status line

map <F11> :tabprevious<CR>
map <F12> :tabnext<CR>

set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=longest:full,full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class

"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:\ \ ,trail:·,eol:\ ,nbsp:_
set list

" Clear the search register using <CR>
nnoremap <CR> :nohlsearch<CR>
nnoremap <Space> :w<CR>

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" UTF-8 Support
scriptencoding utf-8
set encoding=utf-8
set enc=utf-8

" Use relative numbers, but show the current line number
set relativenumber
set number

let mapleader = ","

set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.DS_Store' ]

Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/gundo.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'rking/ag.vim'
Plugin 'manuel-colmenero/vim-simple-session'

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ,ig enters indent guide mode
Plugin 'nathanaelkane/vim-indent-guides'

" Syntaxes
Plugin 'wavded/vim-stylus'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.json set ft=javascript

" Color Schemes
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/habiLight'
Plugin 'jonathanfilip/vim-lucius'
set background=light
colorscheme molokai

filetype plugin indent on
set mouse=a

" Run `checktime` when the user has stopped moving the cursor for 4s
" `checktime` looks to see if the current file has been changed on disk
" Useful for when switching git branches and such
:au CursorHold * checktime

" Only show cursorline in the current window.
" This works by waiting for VimEnter,WinEnter,BufWinEnter
" events and setting the cursorline for that particular
" buffer locally, while removing it from the window you
" leave.
" It's not perfect, but it does a decent job.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
