filetype off            " required!
set modelines=0         " disable modelines support
syntax on

" Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier. 
    if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
" }

" Setting up Vundle - the vim plugin bundler
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
    Bundle 'vim-scripts/bufexplorer.zip'
    Bundle 'vim-scripts/open-terminal-filemanager'
    Bundle 'xolox/vim-misc'
    Bundle 'xolox/vim-session'
    Bundle 'xolox/vim-shell'
    Bundle 'kien/rainbow_parentheses.vim'
    Bundle 'tpope/vim-surround'
    Bundle 'tomtom/tcomment_vim'

    " Bundle 'vim-scripts/Auto-Pairs'
    " Bundle 'ervandew/supertab'
    " Bundle 'vim-scripts/taglist.vim'
    " Bundle 'scrooloose/nerdcommenter'
    " Bundle 'scrooloose/syntastic'
    " Bundle 'tpope/vim-fugitive'
    " Bundle 'vim-scripts/TaskList.vim'
    " Bundle 'vim-scripts/bufkill.vim'
    " Bundle 'Raimondi/delimitMate'
    " Bundle 'majutsushi/tagbar'
    " Bundle 'terryma/vim-multiple-cursors'
    " Bundle 'kien/ctrlp.vim'
    " Bundle 'vimwiki/vimwiki'
    
    " Bundle "MarcWeber/vim-addon-mw-utils"
    " Bundle "tomtom/tlib_vim"
    " Bundle "garbas/vim-snipmate"
    " Bundle "honza/vim-snippets"

    " { COLOR SCHEMES
        " Bundle 'vim-scripts/mayansmoke'
        Bundle 'daylerees/colour-schemes', { 'rtp': 'vim-themes' }
        " Bundle 'vim-scripts/peaksea'
        Bundle 'wombat256.vim'
        Bundle 'xoria256.vim'
        " }

    " { WEB DEV STUFF 
        " Bundle 'Rykka/colorv.vim'
        " Bundle 'mattn/webapi-vim'
    " }
    " { LANGUAGE SUPPORT
        " { CSS/SCSS
            Bundle 'cakebaker/scss-syntax.vim'
        " }
        
        " { Python
            Bundle 'nvie/vim-flake8'
            Bundle 'rkulla/pydiction'
            Bundle 'sontek/rope-vim'
            Bundle 'davidhalter/jedi-vim'
        " }
    " }
" }

filetype plugin indent on     " file type detection

let macvim_skip_colorscheme=1

" { LOOK and FEEL
    set background=dark
    colorscheme xoria256

    set showmode
    set relativenumber
    set numberwidth=5
    set ruler
    set colorcolumn=80
    " {
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
    " }
    set guioptions-=T   " disable toolbar
    set guifont=Source\ Code\ Pro\ For\ Powerline:h12
    if has("gui_win32")
        set guifont=Source\ Code\ Pro\ For\ Powerline:h10
    endif
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

    
    " }
" }

" { STATUS BAR
  set laststatus=2  " always show the status bar
" }

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set nu
au InsertLeave * :set rnu
   
" Resize splits when the window is resized
au VimResized * :wincmd =

" { Quick editing
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
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
        autocmd BufWritePost *.py call Flake8()
    " }
" }

" { PLUGIN SETTINGS
    " { Airline
        let g:airline_powerline_fonts=1
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
    " { TaskList
        map <leader>td <Plug>TaskList
    " }
    " { vim-session
        let g:session_autosave='no'  
    " }
    " { vim-shell
        let g:shell_fullscreen_always_on_top=0
    "
    " }
    " { Rope
        let ropevim_vim_completion = 1
        let ropevim_extended_complete = 1
        let g:ropevim_autoimport_modules = ["os.*","traceback","django.*", "xml.etree"]
        imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>
    " }
    " {
        let g:multi_cursor_use_default_mapping=0
        " Default mapping
        let g:multi_cursor_next_key='<C-n>'
        let g:multi_cursor_prev_key='<C-p>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
    " }
    " { Rainbow paranthesis
        function! Config_Rainbow()
            call rainbow_parentheses#load(0)
            call rainbow_parentheses#load(1)
            call rainbow_parentheses#load(2)
        endfunction

        function! Load_Rainbow()
            call rainbow_parentheses#activate()
        endfunction

        augroup TastetheRainbow
            autocmd!
            autocmd Syntax * call Config_Rainbow()
            autocmd VimEnter,BufRead,BufWinEnter,BufNewFile * call Load_Rainbow()
        augroup END
    " }
    " { JEDI
        let g:jedi#popup_on_dot=0
        let g:jedi#use_tabs_not_buffers=0
        let g:jedi#show_call_signatures=0
    " }
    " { SYNTASTIC
       let g:syntastic_python_checkers=['pylint', 'flake8', 'pep8']
       let g:syntastic_enable_signs=1
       let g:syntastic_auto_jump=1
    " }
" }
