if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein.
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Utility
  call dein#add('ctrlpvim/ctrlp.vim')

  " Generic Programming
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')

  " Snippets
  call dein#add('ervandew/supertab')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('Valloric/YouCompleteMe')

  " C# / dotnet
  call dein#add('OmniSharp/omnisharp-vim')

  " Syntax
  call dein#add('scrooloose/syntastic')
  call dein#add('PProvost/vim-ps1')

  " Version Control
  call dein#add('airblade/vim-gitgutter')

  " Interface
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('flazz/vim-colorschemes')

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
set completeopt=longest,menuone

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

" YCM and supertab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit = "vertical"

" OmniSharp
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_path = '~/src/omnisharp.http-osx/omnisharp/OmniSharp.exe'
let g:OmniSharp_selector_ui = 'ctrlp'
let g:syntastic_cs_checkers = ['code_checker']

augroup omnisharp_commands
    autocmd!

    " Synchronous build (blocks Vim)
    autocmd FileType cs nnoremap <buffer> <Leader>ab :wa!<CR>:OmniSharpBuild<CR>

    " Automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>ft :OmniSharpFindType<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    " Cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <buffer> <Leader>x  :OmniSharpFixIssue<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" Load the current .cs file to the nearest project
nnoremap <Leader>tp :OmniSharpAddToProject<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet = 1

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
