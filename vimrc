filetype off            " required!
set modelines=0         " disable modelines support
syntax on

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier. 
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Setting up Vundle - the vim plugin bundler
" to let it also install itself when missing (git is prereq)
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    if has('win32') || has('win64')
        echo "Win32"
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
    " Bundle 'tpope/vim-vinegar'
    Bundle 'jeetsukumaran/vim-buffergator'
    Bundle 'vim-scripts/open-terminal-filemanager'
    Bundle 'luochen1990/rainbow'
    Bundle 'tomtom/tcomment_vim'
    Bundle 'kien/ctrlp.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'sheerun/vim-polyglot'

    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-obsession'
    Bundle 'tpope/vim-surround'
    Bundle 'plasticboy/vim-markdown'
    Bundle 'sjl/gundo.vim'
    Bundle 'zhaocai/GoldenView.Vim'

    " { COLOR SCHEMES
        Bundle 'vim-scripts/mayansmoke'
        Bundle 'daylerees/colour-schemes', { 'rtp': 'vim-themes' }
        Bundle 'tomasr/molokai'
        Bundle 'Pychimp/vim-luna'
        Bundle 'chriskempson/base16-vim'
    " }

    " { LANGUAGE SUPPORT
        " { CSS/SCSS
            Bundle 'cakebaker/scss-syntax.vim'
        " }
        
        " { Python
            Bundle 'davidhalter/jedi-vim'
        " }
    " }
" }

filetype plugin indent on     " file type detection

let macvim_skip_colorscheme=1

" { LOOK and FEEL
    set background=dark
    colorscheme base16-flat

    set showmode
    set relativenumber
    set numberwidth=5
    set ruler
    set colorcolumn=80
    " {
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
    " }
    set guioptions-=m   " disable menubar
    set guioptions-=T   " disable toolbar
    " set guifont=Source\ Code\ Pro\ For\ Powerline:h12
    if has("gui_win32")
        " set guifont=Source\ Code\ Pro\ For\ Powerline:h9
        " set guifont=Ubuntu\ Mono\ For\ Powerline:h10
        " set guifont=Droid\ Sans\ Mono\ For\ Powerline:h8
        set guifont=DejaVu\ Sans\ Mono\ For\ Powerline:h8
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
   
    map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
    " }
" }

" { STATUS BAR
  set laststatus=2  " always show the status bar
" }

" automatically reload vimrc when it's saved
autocmd BufWritePost .vimrc source ~/.vimrc

   
" { Quick editing
    nnoremap <leader>ev :e $MYVIMRC<cr>
    nnoremap <leader>eb :vsplit $HOME/.bash_profile<cr>
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
        let python_highlight_all=1
        autocmd BufRead,BufNewFile *.py let python_highlight_all=1
        autocmd BufWritePre *.py :%s/\s\+$//e
        au FileType python set omnifunc=pythoncomplete#Complete
    " }
    " { Markdown
        au BufRead,BufNewFile *.md set filetype=markdown
    " }
" }

" { PLUGIN SETTINGS
    " { Airline
        let g:airline_powerline_fonts=1
        let g:airline_theme="base16"
    " }
    " { Goldenview
        let g:goldenview__enable_default_mapping = 0

        nmap <silent> <M-l> <Plug>GoldenViewSplit
        nmap <silent> <M-n> <Plug>GoldenViewNext
        nmap <silent> <M-p> <Plug>GoldenViewPrevious
    " }
    " { NERDTree SETTINGS
        let NERDTreeIgnore=['\.py[oc]', '\.swp', '\.pj'] ", '\.~$']
        map <silent> <C-s> :NERDTree<CR><C-w>p:NERDTreeFind<CR>
        map <silent> <C-e> :NERDTreeToggle<CR>
        let NERDTreeShowHidden=1
        let NERDTreeQuitOnOpen=1
    " }
    " { SuperTab
        let g:SuperTabDefaultCompletionType = "context"
    " }
    " { PyDiction
        let g:pydiction_location = '~/bundle/pydiction/complete-dict'
    " }
    " { TagList
        nnoremap <silent> <F8> :TlistToggle<CR>
        let Tlist_Use_Right_Window = 1
    " }
    " { Rainbow paranthesis
        let g:rainbow_active = 1
    " }
    " { JEDI
        let g:jedi#usages_command = "<leader>z"
        let g:jedi#popup_on_dot=0
        let g:jedi#popup_select_first=0
        let g:jedi#use_tabs_not_buffers=0
    "    let g:jedi#show_call_signatures=0
    " }
    " { SYNTASTIC
       let g:syntastic_python_checkers=['pylint', 'flake8', 'pep8']
       let g:syntastic_enable_signs=1
       let g:syntastic_auto_jump=0
       let g:syntastic_always_populate_loc_list=1
       let g:syntastic_auto_loc_list=1
    " }
    " { TCOMMENT
       map <leader>c <c-_><c-_> 
    " }
" }
