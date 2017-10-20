" =============================================================================
" ================================= Vundle Setting ============================
" =============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required

    " examples
    " Plugin 'tpope/vim-fugitive'  " plugin on GitHub repo
    " Plugin 'L9'  " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'git://git.wincent.com/command-t.git'  " Git plugin not hosted on GitHub
    " Plugin 'file:///home/gmarik/path/to/plugin'  " git repos on your local machine 
    " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " custom runtime path
    " Plugin 'ascenator/L9', {'name': 'newL9'}  " avoid a Naming conflict

    Plugin 'Valloric/YouCompleteMe'
    Plugin 'tomasr/molokai'
    Plugin 'vim-airline/vim-airline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'fholgado/minibufexpl.vim'
    " Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'scrooloose/syntastic'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'SirVer/ultisnips'  " snippets plugin
    Plugin 'honza/vim-snippets'  " Snippets are separated from the plugin.

    Plugin 'hynek/vim-python-pep8-indent'
    Plugin 'kshenoy/vim-signature'

    Plugin 'wannesm/wmgraphviz.vim'
    Plugin 'tpope/vim-fugitive'

    Plugin 'jiangmiao/auto-pairs'

    " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" =============================================================================
" ================================= Setting options ===========================
" =============================================================================
" Use :help 'option' (with quotes) to see the documentation for the given option.

" ------------ some options ------------
syntax enable
set number
scriptencoding utf-8
set encoding=utf-8              " internal vim encoding
set autoread                    " update file if it has been canged outside
                                " but not inside vim
set backspace=indent,eol,start  " use backspace as usual

set ttimeoutlen=50

" ------------ indentation -------------
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent		" always set autoindenting on
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
set ruler  " show position

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
" Commands                        Mode
" --------                        ----
" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode

map <Tab> >>
map <S-Tab> <<

" fast jump to next or prev error in llist
map <C-E>n :lnext<CR>
map <C-E>p :lprev<CR>

nnoremap <Leader><space> :nohlsearch<CR>

map <Leader>w :set wrap!<CR>
map <Leader>p :set paste!<CR>

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
map <Leader>t :call ExecuteWithNormalizeSplits("NERDTreeToggle")<CR>
map <Leader>e :MBEToggle<CR>

" ----------- Syntastic ----------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

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

" ================================= End =======================================
"
" ----------- notes --------------------
" :help internal-variables  " about variable types
"

" To future

" set complete-=i  " ctrl-P, ctrl-N
" set nrformats-=octal
" look up info about tags
" look up info about 'viminfo'
" set formatoptions+=j " Delete comment character when joining commented lines
" set ttimeout
" set ttimeoutlen=100
"
" Plugin 'plugin/fugitive-vim'
" backup ------------------
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set backupskip=/tmp/*,/private/tmp/*
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup
