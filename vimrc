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
    Bundle 'vim-airline/vim-airline'
    Bundle 'vim-airline/vim-airline-themes'

    Bundle 'scrooloose/nerdtree'
    Bundle 'jeetsukumaran/vim-buffergator'
    Bundle 'justinmk/vim-gtfo'
    Bundle 'sjl/gundo.vim'
    Plugin 'myusuf3/numbers.vim'    
    Plugin 'rking/ag.vim'

    Bundle 'xolox/vim-session'
    Plugin 'xolox/vim-misc' 
    Plugin 'kkoenig/wimproved.vim'

    Bundle 'ctrlpvim/ctrlp.vim'
    Bundle 'tpope/vim-surround'  
    Bundle 'Raimondi/delimitMate'
    Plugin 'scrooloose/nerdcommenter'
    " Plugin 'ervandew/supertab'

    Bundle 'Yggdroot/indentLine'
    Bundle 'whatyouhide/vim-lengthmatters'
    Bundle 'luochen1990/rainbow' 

    " { Syntax completion/Snippet plugins
        Plugin 'Shougo/neocomplete.vim'

        Bundle 'SirVer/ultisnips'
        Plugin 'honza/vim-snippets'    
        Bundle 'scrooloose/syntastic'
        Bundle 'neomake/neomake'
    " }
    
    Bundle 'tpope/vim-fugitive'
    Bundle 'airblade/vim-gitgutter'
    Bundle 'elzr/vim-json'
    Bundle 'tpope/vim-projectionist'

    Bundle 'terryma/vim-expand-region'

    Bundle 'AndrewRadev/splitjoin.vim'  
    Plugin 'samsonw/vim-task'

    " {{{ EYECANDY
        Plugin 'Taverius/vim-colorscheme-manager'   " Managing color schemes
        Plugin 'xolox/vim-colorscheme-switcher'
        
        " { COLOR SCHEMES
            Bundle 'vim-scripts/mayansmoke'
            Bundle 'daylerees/colour-schemes', { 'rtp': 'vim-themes' }
            Bundle 'tomasr/molokai'
            Bundle 'Pychimp/vim-luna'
            Bundle 'chriskempson/base16-vim'
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'fmoralesc/vim-vitamins'
            Bundle 'morhetz/gruvbox'
            Bundle 'w0ng/vim-hybrid'
            Bundle 'nanotech/jellybeans.vim'
            Plugin 'flazz/vim-colorschemes'             " Colorschemes
            Bundle 'junegunn/seoul256.vim'
            Plugin 'whatyouhide/vim-gotham'
            Plugin 'rakr/vim-two-firewatch'
            Plugin 'jdkanani/vim-material-theme'
        " }
    " }}}

    " { LANGUAGE SUPPORT
        " { Web/js stuff 
            Bundle 'cakebaker/scss-syntax.vim'
            Bundle 'groenewege/vim-less'
            Bundle 'pangloss/vim-javascript'
            Bundle 'moll/vim-node'
            Bundle 'othree/html5-syntax.vim'
            Bundle 'othree/html5.vim'
            Bundle 'othree/javascript-libraries-syntax.vim'
            Bundle 'othree/es.next.syntax.vim'
            Bundle 'ternjs/tern_for_vim'
            " " Bundle 'elzr/vim-json'
            Bundle 'othree/jsdoc-syntax.vim'
            Bundle 'itspriddle/vim-jquery'
            Bundle '1995eaton/vim-better-javascript-completion'
            " Bundle 'marijnh/tern_for_vim', { 'do': 'npm install' }
            Bundle 'othree/jspc.vim'
            " Bundle 'moll/vim-node'
        " }
        
        " { Markup
            Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
            Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
            Plugin 'plasticboy/vim-markdown'            " Markdown support
        " }

        " { Python
            Bundle 'davidhalter/jedi-vim'
            Plugin 'jmcantrell/vim-virtualenv'
            Plugin 'hynek/vim-python-pep8-indent'
        " }

        " { LUA
            Bundle 'xolox/vim-lua-ftplugin'
            Plugin 'xolox/vim-lua-inspect'            
            Plugin 'lua.vim'
        " }
        "
        " { SQL
            Plugin 'shmup/vim-sql-syntax'
        " }
        "
        " { Haxe
            Plugin 'jdonaldson/vaxe'
        " }
    " }

" }

filetype plugin indent on     " file type detection

let macvim_skip_colorscheme=1

" { LOOK and FEEL
    set background=dark

    set showmode
    set relativenumber
    set numberwidth=5
    set ruler
    " set colorcolumn=80
    " {
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
    " }
    set guioptions-=m   " disable menubar
    set guioptions-=T   " disable toolbar
    if has("gui_win32")
        " set guifont=Fira\ Mono:h10
        " set guifont=Hack:h8
        set guifont=Ubuntu\ Mono:h10
        colorscheme gotham256
    else
        " set guifont=Droid\ Sans\ Mono:h11
        set guifont=Fira\ Mono:h10
        " set guifont=Monoid:h9
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
    set autowrite
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
    " { json
        au BufRead,BufNewFile *.conf set filetype=json
    " }
    " { haxe
        au BufRead,BufNewFile *.hx set filetype=haxe
    " }
    " { javascript
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
let g:neocomplete#sources#omni#functions.javascript = [
        \   'jspc#omni',
        \   'tern#Complete',
        \ ]    " }
" }

" { PLUGIN SETTINGS
    " { Airline
        let g:airline_powerline_fonts=1
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
        let g:ctrlp_working_pathe_mode = 'arw'
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
        let g:rainbow_active=1
    " }

    " { Colorscheme switcher
        let g:colorscheme_switcher_exclude = []
        let g:colorscheme_switcher_exclude_builtins = 1
        let g:colorscheme_switcher_keep_background = 1
    " }

    " { JEDI
        " disable 
        autocmd FileType python setlocal completeopt-=preview
        let g:jedi#auto_vim_configuration=0
        let g:jedi#force_py_version=3
        let g:jedi#auto_initialization=1
        let g:jedi#usages_command = "<leader>z"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = "<leader>d"
        let g:jedi#documentation_command = "K"
        let g:jedi#popup_on_dot=1
        let g:jedi#popup_select_first=0
        let g:jedi#use_tabs_not_buffers=0
        let g:jedi#show_call_signatures="1"
        let g:jedi#completions_enabled=1
    " }

    " { NEOCOMPLETE
        let g:acp_enableAtStartup = 0  " Disable AutoComplPop.
        let g:neocomplete#enable_at_startup = 1  " start neocomplete directly
        let g:neocomplete#enable_smart_case = 1  " Use smartcase.
        let g:neocomplete#sources#syntax#min_keyword_length = 3  " Set minimum syntax keyword length.
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'    
    " }

    " { Open-Terminal-Filemanager
        " let g:gtfo#terminals = { 'win' : 'powershell -NoLogo -NoExit -Command' }
        " nnoremap <silent> <M-e> :OpenFilemanager<CR><CR>
        " nnoremap <silent> <M-d> :OpenTerminal<CR>
    " }

    " { SYNTASTIC
       " let g:syntastic_python_checkers=['flake8', 'pep8']
       " let g:syntastic_enable_signs=1
       " let g:syntastic_auto_jump=0
       " let g:syntastic_always_populate_loc_list=1
       " let g:syntastic_auto_loc_list=1
       " let g:syntastic_check_on_wq=0
       " let g:syntastic_enable_balloons=0
    " }

    " { SessionManager
        set sessionoptions+=resize,winpos
        set sessionoptions-=help
        let g:session_autoload='no' 
        let g:session_autosave='no'
    " }

    " { supertab
        let g:SuperTabDefaultCompletionType = "<c-n>"
    " }
    
    " { lengthmatters
        " let g:lengthmatters_colors='ctermbg=244 guibg=234'
    " }
    "
    " { vim-virtualenv
        let g:virtualenv_directory = '~/.virtualenvs'
    " }

    " { vim-json
        let g:vim_json_syntax_conceal = 0
    " }
    
    " { expand-region
        vmap v <Plug>(expand_region_expand)
        vmap <C-v> <Plug>(expand_region_shrink)
    " }
" }
