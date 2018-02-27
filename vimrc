if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein.
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add plugins.
  call dein#add('kien/ctrlp.vim')
  call dein#add('Raimondi/delimitMate')
  call dein#add('scrooloose/syntastic')
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('tpope/vim-commentary')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('digitaltoad/vim-jade')
  call dein#add('tpope/vim-surround')

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
set showmode
set smarttab
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:░░,trail:▓
set list
set relativenumber
set number
set hlsearch
set ignorecase
set smartcase

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" C-U in insert mode deletes a lot. Use CTRL-G u to first break undo, so that
" you can undo C-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Do not history when leavy buffer.
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview

" Basic shortcuts definitions, most in visual mode / selection (v or ⇧ v)

" Indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <

" Comment / decomment & normal comment behavior
vmap <C-m> gc

" Tabs
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

" Lazy ':'
map \ :

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>

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

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
