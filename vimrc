filetype off            " required!
set modelines=0         " disable modelines support
syntax on

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier. 
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$VIMHOME/.vim/after
endif

" Setting up Vundle - the vim plugin bundler
" to let it also install itself when missing (git is prereq)
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    if has('win32') || has('win64')
        silent cd ~
        silent !mkdir .vim\bundle
        silent !git clone https://github.com/gmarik/vundle .vim/bundle/vundle
    else
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    endif
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" { BUNDLES
    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'
    Bundle 'bling/vim-airline'

    Bundle 'scrooloose/nerdtree'
    Bundle 'jeetsukumaran/vim-buffergator'
    Bundle 'justinmk/vim-gtfo'
    Bundle 'sjl/gundo.vim'
    Plugin 'myusuf3/numbers.vim'    
    Plugin 'rking/ag.vim'

    Bundle 'xolox/vim-session'
    Plugin 'xolox/vim-misc' 
    
    Bundle 'ctrlpvim/ctrlp.vim'
    Bundle 'tpope/vim-surround'  
    Bundle 'Raimondi/delimitMate'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'ervandew/supertab'

    Bundle 'Yggdroot/indentLine'
    Bundle 'whatyouhide/vim-lengthmatters'
    Bundle 'luochen1990/rainbow' 
    Bundle 'reedes/vim-thematic'

    " Plugin 'Shougo/neocomplete.vim'
    Bundle 'scrooloose/syntastic'

    Bundle 'tpope/vim-fugitive'
    Bundle 'airblade/vim-gitgutter'

    Bundle 'SirVer/ultisnips'


    " { COLOR SCHEMES
        Bundle 'vim-scripts/mayansmoke'
        Bundle 'daylerees/colour-schemes', { 'rtp': 'vim-themes' }
        Bundle 'tomasr/molokai'
        Bundle 'Pychimp/vim-luna'
        Bundle 'chriskempson/base16-vim'
        Bundle 'altercation/vim-colors-solarized'
    " }

    " { LANGUAGE SUPPORT
        " { Web stuff 
            Bundle 'cakebaker/scss-syntax.vim'
            Bundle 'groenewege/vim-less'
        " }
        
        " { Markdown
            Bundle 'plasticboy/vim-markdown'
        " }

        " { Python
            Bundle 'davidhalter/jedi-vim'
            Plugin 'jmcantrell/vim-virtualenv'
            Plugin 'hynek/vim-python-pep8-indent'
        " }

        " { SQL
            Plugin 'shmup/vim-sql-syntax'
        " }
    " }
" }

filetype plugin indent on     " file type detection

let macvim_skip_colorscheme=1

" { LOOK and FEEL
    set background=dark
    " colorscheme solarized

    set showmode
    set relativenumber
    set numberwidth=5
    set ruler
    "set colorcolumn=80
    " {
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
    " }
    set guioptions-=m   " disable menubar
    set guioptions-=T   " disable toolbar
    if has("gui_win32")
        set guifont=Ubuntu\ Mono:h9
        colorscheme base16-flat
    else
        set guifont=Ubuntu\ Mono:h12
        colorscheme base16-ashes
    endif

    " absolute line numbers in insert mode, relative otherwise for easy movement
    au InsertEnter * :set nu
    au InsertLeave * :set rnu

    " Resize splits when the window is resized
    au VimResized * :wincmd =

" }

set list
if has('win32') || has('win64')
    set backspace=indent,eol,start
else
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
endif

" { FORMATTING
    set autoindent
    set expandtab
    set nowrap
    set shiftwidth=4
    set smartindent
    set smarttab
    set softtabstop=4
    set tabstop=4
" }

" { CLIPBOARD HANDLING
    set pastetoggle=<F2>
    set clipboard=unnamed
" }

" { CODE FOLDING
    set foldlevel=1
    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
" }

" { MISC SETTINGS
    set autoread  " reload outside vim changes files
    set encoding=utf-8
    set hlsearch  " highlight search results
    " case insensitive search
    set incsearch
    set ignorecase
    set smartcase
" }

" { KEY MAPPINGS
    let mapleader=","  " set leader to a more common key

    " { WINDOW SPLITTING
        map <c-down> <c-w>j
        map <c-up> <c-w>k
        map <c-right> <c-w>l
        map <c-left> <c-w>h
        map <c-j> <c-w>j
        map <c-k> <c-w>k
        map <c-l> <c-w>l
        map <c-h> <c-w>h
    " }

    " Toggle hlsearch with <leader>hs
    nmap <leader>hs :set hlsearch! hlsearch?<CR>

    " block movement for indention
    vnoremap < <gv
    vnoremap > >gv

" }

" { STATUS BAR
  set laststatus=2  " always show the status bar
" }



" { Quick editing
    nnoremap <leader>ev :e $MYVIMRC<cr>
    " quick resourcing of vimrc
    map <leader>vs :source $MYVIMRC<cr>
    nnoremap <leader>evc :vsplit $HOME/.vim/vim_cheatsheet.txt<cr>
" }

if has('mac')
    if isdirectory($HOME . '/.vim/swap') == 0
      :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
    endif
    set directory=~/.vim/swap// " default swap to home dir

    if isdirectory($HOME . '/.vim/backup') == 0
      :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
    endif
    set backupdir=~/.vim/backup//
endif

" { LANGUAGE SPECIFIC SETTINGS
    " { SCSS & CSS 
        au BufRead,BufNewFile *.scss set filetype=scss
    " }
    " { Python
    "   all things in here should be only used when python file
    "   is edited
        autocmd BufWritePre *.py :%s/\s\+$//e
        map <Leader>br Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>
    " }
    " { Markdown
        au BufRead,BufNewFile *.md set filetype=markdown
    " }
" }

" { PLUGIN SETTINGS
    " { Airline
        let g:airline_powerline_fonts=0
        let g:airline_left_sep=''
        let g:airline_right_sep=''
    " }
    
    " { Buffergator
        let g:buffergator_viewport_split_policy="T"
        let g:buffergator_hsplit_size=10
        let g:buffergator_sort_regime="mru"
        map <silent> <C-b> :BuffergatorOpen<CR>
    " }
    
    " { CtrlP
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_working_pathe_mode = 'rw'
    " }

    " { NERDTree SETTINGS
        let NERDTreeIgnore=['\.py[oc]', '\.swp', '\.pj'] ", '\.~$']
        map <silent> <C-s> :NERDTree<CR><C-w>p:NERDTreeFind<CR>
        map <silent> <C-e> :NERDTreeToggle<CR>
        let NERDTreeShowHidden=1
        let NERDTreeQuitOnOpen=1
    " }

    " { NERDCommenter
        let g:NERDSpaceDelims=1
    " }
    
    " { Rainbow parenthesis
        let g:rainbow_active = 1
    " }

    " { JEDI
        " disable 
        autocmd FileType python setlocal completeopt-=preview
        let g:jedi#auto_vim_configuration=0
        let g:jedi#force_py_version=3
        let g:jedi#auto_initialization=1
        let g:jedi#usages_command = "<leader>z"
        let g:jedi#popup_on_dot=1
        let g:jedi#popup_select_first=0
        let g:jedi#use_tabs_not_buffers=0
        let g:jedi#show_call_signatures="1"
        let g:jedi#completions_enabled=1
    " }

    " { Open-Terminal-Filemanager
        let g:gtfo#terminals = { 'win' : 'powershell -NoLogo -NoExit -Command' }
        " nnoremap <silent> <M-e> :OpenFilemanager<CR><CR>
        " nnoremap <silent> <M-d> :OpenTerminal<CR>
    " }

    " { SYNTASTIC
       let g:syntastic_python_checkers=['flake8', 'pep8']
       let g:syntastic_enable_signs=1
       let g:syntastic_auto_jump=0
       let g:syntastic_always_populate_loc_list=1
       let g:syntastic_auto_loc_list=1
       let g:syntastic_check_on_wq=0
       let g:syntastic_enable_balloons=0
    " }

    " { SessionManager
        let g:session_autoload='no' 
        let g:session_autosave='no'
    " }
    
    " { lengthmatters
        let g:lengthmatters_colors='ctermbg=244 guibg=234'
    " }
    "
    " { vim-virtualenv
        let g:virtualenv_directory = '~/.virtualenvs'
    " }

" }
