set nocp
source $HOME/.vim/autoload/pathogen.vim
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'itchyny/lightline.vim'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-pathogen'
Bundle 'altercation/vim-colors-solarized'
Bundle 'css_color'
Bundle 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}
Bundle 'neocomplcache.vim'
execute pathogen#infect()

filetype plugin indent on    " required!"

set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-t> :tabnew .<cr>

" Format the status line
set laststatus=2 " always show the status line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

set number

set showtabline=2 " file tabs always visible

function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction

imap <C-a> <ESC>:call SmartHome()<CR>i
map <C-a> :call SmartHome()<CR>

imap <C-e> <ESC>$i<right>
map <C-e> $

map <C-l> :tabnext<cr>
map <C-h> :tabprev<cr>
imap <C-t> <ESC>:tabnew<cr>i
imap <C-l> <ESC>:tabnext<cr>i
imap <C-h> <ESC>:tabprev<cr>i
map <C-S-o> :e .<cr>
map <C-S-d> :!bash<cr>
map <C-S-j> :JSHint<cr>
"Colors
set t_Co=256 " we can use 256 colors
set background=dark " indicate bg color
colorscheme molokai
cnoremap sudow w !sudo tee % >/dev/null

" Autocomplete crap.
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
let g:neocomplcache_enable_at_startup = 1
" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

let g:syntastic_php_phpcs_args="--report=csv --standard=Drupal"

cnoremap sudow w !sudo tee % >/dev/null
