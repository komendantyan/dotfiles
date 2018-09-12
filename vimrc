" =============================================================================
" ================================= Vundle Setting ============================
" =============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required

    Plugin 'tomasr/molokai'  " colorcheme

    " IDE like viewing
    Plugin 'scrooloose/nerdtree'  " file browser
    Plugin 'fholgado/minibufexpl.vim'  " buffer manager
    Plugin 'majutsushi/tagbar'  " class browser
    Plugin 'vim-airline/vim-airline'  " status line

    " Work with code
    Plugin 'scrooloose/syntastic'  " syntax checker
    Plugin 'Valloric/YouCompleteMe'  " autocompleter
    Plugin 'jiangmiao/auto-pairs'  " comfortale work with parentesis
    Plugin 'scrooloose/nerdcommenter'  " simple comment code
    Plugin 'SirVer/ultisnips'  " snippets plugin
    Plugin 'honza/vim-snippets'  " Snippets are separated from the plugin.

    " Python-specific
    Plugin 'tmhedberg/SimpylFold'  " folding python code
    Plugin 'hynek/vim-python-pep8-indent'  " some fix for autoident in python

    "Work with Git
    Plugin 'tpope/vim-fugitive'  " integration with git

call vundle#end()            " required
filetype plugin indent on    " required


" ------------ some options ------------
syntax enable
set number
scriptencoding utf-8
set encoding=utf-8              " internal vim encoding
set autoread                    " update file if it has been canged outside
                                " but not inside vim
set backspace=indent,eol,start  " use backspace as usual

set ttimeoutlen=10

" ------------ indentation -------------
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent  " always set autoindenting on
set smarttab
set expandtab
set autoindent  " Copy indent from current line when starting a new line

" ------------ undo -------------------
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" ------------ colorscheme ------------
set t_Co=256            " add native colors for terminals except tty
colorscheme molokai     " set my colorscheme
hi Folded ctermfg=240 ctermbg=232

hi DiffAdd                     ctermbg=17
hi DiffChange      ctermfg=181 ctermbg=239
hi DiffDelete      ctermfg=89  ctermbg=53
hi DiffText                    ctermbg=244 cterm=NONE

" ----------- folding -----------------
set foldenable
set foldmethod=indent

" ----------- Wild --------------------
set wildignore=*/.git/*
set wildignore+=*.pyc
set wildmode=longest:full
set wildmenu

" ----------- search ------------------
set incsearch       " show what found while typing search pattern
set hlsearch        " highlight what found
set ignorecase      " when searching pattern
set nowrapscan      " do not loop search
set smartcase       " smart case when searching (a=[aA], [A]=[A])

" ----------- others :set -------------
set laststatus=2  " always show statusbar
"set ruler  " show position  (why it shows even if commented?)

set history=1000  " commands and searches history

set scrolloff=3  " minimal lines above and bellow cursor
set sidescrolloff=0  " minimal columns to the left and right of cursor
set list
set listchars=tab:»·,trail:·,extends:…,precedes:…,nbsp:~
set display=uhex  " Show unprintable characters hexadecimal as <xx>

set cursorline
set colorcolumn=80,100

" =============================================================================
" ================================= functions =================================
" =============================================================================

function! ExecuteWithNormalizeSplits(command)
    " e.g. after show/hide NERDTree window
    " a:… - function argument "…" (see :help internal-variables)
    execute a:command
    execute "wincmd ="
endfunction

" =============================================================================
" ================================= autocmd ===================================
" =============================================================================

autocmd VimResized * wincmd =  " resize all splits if vim resized

" =============================================================================
" ================================= Key mappings ==============================
" =============================================================================

map <Tab> >>
map <S-Tab> <<

nnoremap <Leader><space> :nohlsearch<CR>

map <Leader>w :set wrap!<CR>
map <Leader>n :set number!<CR>
map <Leader>p :set paste!<CR>

map <Leader>t :call ExecuteWithNormalizeSplits("NERDTreeToggle")<CR>
map <Leader>e :call ExecuteWithNormalizeSplits("MBEToggle")<CR>
map <Leader>o :call ExecuteWithNormalizeSplits("TagbarToggle")<CR>


" =============================================================================
" ================================= Plugin specific settings ==================
" =============================================================================

" ------------ YCM ---------------------
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = "~/.dot_files/vim/ycm_global.py"
let g:ycm_goto_buffer_command = 'vertical-split'

let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

let g:ycm_complete_in_comments = 1

map gdf :YcmCompleter GoTo<CR>

" ----------- Syntastic ----------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map ={"mode": "passive"}
map <Leader>s :SyntasticCheck<CR>

" do not forget to pip intall flake8, pylint, pep8
let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8']
let g:syntastic_python_flake8_post_args='--disable=E501'
let g:syntastic_python_pylint_post_args='--disable=missing-docstring,too-few-public-methods'
" let g:syntastic_python_pylint_post_args='--disable=C0103,C0111'

" ------------ MiniBuferExplorer -------

let g:did_minibufexplorer_syntax_inits = 1
hi def link MBENormal                Comment
hi def link MBEChanged               String
hi def link MBEVisibleNormal         Type
hi def link MBEVisibleChanged        PreProc
hi def link MBEVisibleActiveNormal   Identifier
hi def link MBEVisibleActiveChanged  Statement

" ----------- Ultisnips ----------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ----------- NERDTree -----------------
let NERDTreeIgnore = ['\~$', '\.pyc$']

" ----------- airline ------------------
let g:airline_symbols_ascii = 1  " unicode symbols dont displayed properly


" ================================= End =======================================
" ----------- notes --------------------
" :help internal-variables  " about variable types
"
" Commands                        Mode
" --------                        ----
" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode
