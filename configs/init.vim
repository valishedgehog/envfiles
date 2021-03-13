" @@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Perfect Neovim configuration
" @@@@@@@@@@@@@@@@@@@@@@@@@@@@



"""""""""""""""""
" Usefull links "
"""""""""""""""""
" Some code took from here
" https://github.com/victorvoid/vim-frontend/blob/master/.vimrc
"
" Vim eunuch link and documentation
" https://github.com/tpope/vim-eunuch



"""""""""""""""""
"    Plugins    "
"""""""""""""""""

if &compatible
  set nocompatible
endif

filetype off

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

  " Dein plugin manager
  call dein#add('Shougo/dein.vim')
  call dein#add('wsdjeg/dein-ui.vim')

  " Basic plugins bundle
  call dein#add('scrooloose/nerdtree')
  call dein#add('matze/vim-move')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-eunuch')

  " Comments
  call dein#add('scrooloose/nerdcommenter')

  " Syntax checking for vim
  call dein#add('scrooloose/syntastic')

  " Display the indention levels with thin vertical lines
  call dein#add('Yggdroot/indentLine')

  " Vim Session
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-session')

  " Airline and themes
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Color schemes
  call dein#add('flazz/vim-colorschemes')

  " Language pack for neovim
  call dein#add('sheerun/vim-polyglot')

  " Highlight trailing whitespace
  call dein#add('bronson/vim-trailing-whitespace')

  " Insert and delete brackets, parens, quotes in pair
  call dein#add('jiangmiao/auto-pairs')

  " Tagbar displays the tags of the current file in a sidebar
  call dein#add('majutsushi/tagbar')

  " Gitgutter
  call dein#add('airblade/vim-gitgutter')

  " Multiple Cursors
  call dein#add('terryma/vim-multiple-cursors')

call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable



""""""""""""""""""""""
"   Basic settings   "
""""""""""""""""""""""

set showmatch
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set confirm
set hidden
set mousehide
set title
set history=500
set timeoutlen=500
set autoread
set noshowmode

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Searching
set magic
set hlsearch
set ignorecase
set smartcase
set nohlsearch
set incsearch

" Color scheme
colorscheme badwolf

" Indention
set nowrap
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set colorcolumn=120

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set writebackup

" Folding
set foldenable
set foldmethod=indent
set foldlevel=100



""""""""""""""""""""""""
" Some plugin settings "
""""""""""""""""""""""""

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif



"""""""""""""""""""
"     Snipets     "
"""""""""""""""""""

autocmd StdinReadPre * let s:std_in=1
autocmd FocusGained,BufEnter * :silent! !
autocmd FocusLost,WinLeave * :silent! noautocmd w

" Clean extra spaces on save
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

" Reload config
autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Autostart NerdTree if no file was selected or on current directory and exit if last window
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



""""""""""""""""
"     Maps     "
""""""""""""""""

nmap <F8> :TagbarToggle<CR>
nmap <leader>w :w!<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <Leader>0 :NERDTreeFocus<CR>



""""""""""""""""""""
"   Vim sessions   "
""""""""""""""""""""

let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1



"""""""""""""""""""""
" NerdTree settings "
"""""""""""""""""""""

let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'



"""""""""""""""""
"   Syntastic   "
"""""""""""""""""

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0



"""""""""""""""""
"    Airline    "
"""""""""""""""""

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

let g:airline_theme = 'badwolf'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1



""""""""""""""""""""""""""""
"     Windows 10 hacks     "
""""""""""""""""""""""""""""

let g:maximized = 0
function! ToggleMaximized()
    if has("gui_running")
        call GuiWindowFullScreen(!g:maximized)
    endif
    let g:maximized = !g:maximized
endfunc
nmap <F12> :call ToggleMaximized()<CR>



"""""""""""""""""
"   Functions   "
"""""""""""""""""

function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
