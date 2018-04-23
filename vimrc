if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein.
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add gui plugins.
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('flazz/vim-colorschemes')

  " Add navigation plugins.
  call dein#add('kien/ctrlp.vim')

  " Add syntax plugins.
  call dein#add('scrooloose/syntastic')
  call dein#add('PProvost/vim-ps1')

  " Add text manipulation plugins.
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')

  " Add version control plugins.
  call dein#add('airblade/vim-gitgutter')

  " Add snippet plugins.
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('Valloric/YouCompleteMe')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Color themes.
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
set background=dark

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch

set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=50

set encoding=utf-8
set shiftround
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:░░,trail:▓
set list

set incsearch
set ignorecase
set smartcase
set hlsearch

set number
set ruler
set relativenumber

set showcmd
set showmode
set laststatus=2
set wildmenu

set autoread
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Lazy ':'
map \ :

let mapleader = ','

" Plugin configurations

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" vim-airline
let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" vim-gitgutter
noremap  <Leader>g :GitGutterToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
