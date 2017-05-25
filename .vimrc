" ~/.vimrc
" Shane's vim configuration file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

"""""""""""""""""""""""""""""
" => Plugins {{{
"""""""""""""""""""""""""""""
" Using vundle to manage plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'
" integrate normal vim split movements with tmux!!!
Plugin 'tpope/vim-unimpaired'
"Colorscheming!
Plugin 'flazz/vim-colorschemes'
" YCM config generator
Plugin 'rdnetto/YCM-Generator'
" vim-fugitive: git support
Plugin 'tpope/vim-fugitive'
" auto end certain code structures
Plugin 'tpope/vim-endwise'
" automatic closing of quotes, braces, ...
Plugin 'Raimondi/delimitMate'
" un/comment code
Plugin 'scrooloose/nerdcommenter'
" file browser
Plugin 'scrooloose/nerdtree'
" highlight color codes with proper colors
Plugin 'Colorizer'
" fancy status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Color scheme previewer
Plugin 'ScrollColors'
" i3 config syntax highlighting
Plugin 'PotatoesMaster/i3-vim-syntax'
" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'chriskempson/base16-vim'
" Plugin to prevent opening a directory in a new tab w/ NT
" Plugin 'Nopik/vim-nerdtree-direnter'
" Built-in (?) plugin for better man page handling
Plugin 'vim-utils/vim-man'
" List-toggle plugin - check out error locations!
" Plugin 'Valloric/ListToggle'
" the above doesn't seem to work correctly, or I've configured it wrong
" doesn't populate location list or view it correctly
" whatevs, just write my own plugin for toggling / functions for quickfixes
Plugin 'nightsense/vim-crunchbang'
" tmux powerline vim integration coolness
Plugin 'edkolev/tmuxline.vim'

call vundle#end()
filetype plugin indent on
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lines of history to remember
set history=50

" auto read file when changed from the outside
set autoread

" command timeout
set ttimeout
set ttimeoutlen=100

" set word wrap 
set tw=79

" change <Leader> to space bar for easier action
let mapleader=','
let g:mapleader=','
" faster commands
noremap ; :
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface   {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast
set lazyredraw

" Set 5 lines to the cursor 
set so=5

" Turn on the Wild menu
set wildmenu

" Show line numbers
set number
" highlight current line
set cursorline
" highlight 80th column 
set colorcolumn=80

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Searching
set ignorecase      " ignore case 
set smartcase       " be smart
set hlsearch        " highlight
" clear highlight
nmap <leader><space> :nohlsearch<CR>

set incsearch       " incremental search
set magic           " regular expression magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Make NerdTree open files in a new tab
" let NERDTreeMapOpenInTab='<ENTER>'

" Set the column width of the NerdTree window
let g:NERDTreeWinSize = 25


" }}}

"""""""""""""""""""""""""""""
" => Folding {{{
"""""""""""""""""""""""""""""
set foldenable
set foldlevelstart=10  " open most folds by default
set foldnestmax=10     " 10 nested folds max
" open/close folds
nnoremap <space> za
set foldmethod=indent  " fold based on indent level
" Add a bit extra margin to the left
set foldcolumn=1
" To use markers {{{,}}}
" set foldmethod=marker
" set foldmarker={{{,}}}
" }}}

"""""""""""""""""""""""""""""
" => Colors and Fonts {{{
"""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

"" below is my old jellybeans config
set t_Co=256
set background=dark
colorscheme jellybeans 

" current solarized config w/ light and dark toggle
" set t_Co=256
" colorscheme solarized
" set background=dark
"let g:solarized_termtrans=1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" }}}

"""""""""""""""""""""""""""""
" => Backups and undo {{{
"""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" separate undo dir
set undofile
set undodir=~/.vim/undo
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" not for kernel patches!
autocmd BufNewFile,BufRead *.patch set noexpandtab
autocmd BufNewFile,BufRead *.patch set shiftwidth=8
autocmd BufNewFile,BufRead *.patch set tabstop=8

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" use pastetoggle to fix indenting when pasting
set pastetoggle=<F2>

" make vim use X11 clipboard (needs clipboard support)
set clipboard=unnamedplus

"" NOTE: for some reason, on these few commands, I can't get ctrl/Shift+Enter
"" to function properly as mappings... they don't register when typing in vim

" handle curly braces like an IDE
" inoremap {<CR> {<CR><BS>}<Esc>ko}<BS><esc>i<tab>
inoremap {<CR> {<CR><CR><BS>}<Esc>2ko<del>
inoremap {<c-CR> {<CR><CR><BS>}<Esc>2ko<CR>

" use enter to make a new line, shift+enter for break at current point
nnoremap <CR> o<Esc>
nnoremap <S-CR> i<CR><Esc>
" Needed for GVIm
nnoremap ^[0M i<CR><Esc>
" Needed for CLI VIm (Note: ^[0M was created with Ctrl+V Shift+Enter, don't type it directly)

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow files to be open but not displayed
set hidden

" open man pages with viman from plugin
nnoremap K :execute 'Man '.expand("<cword>")<cr>
nnoremap <C-K> :execute 'tabnew ! Man '.expand("<cword>")<cr>

" relative line numbers as well as absolute current line
set relativenumber
set number

" moving between recent buffers
" doesn't work since this is nerdtree toggle: nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
" set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" open list of buffers with <F5>
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
map <Up> gk
map <Down> gj

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Navigate through open windows using Alt + arrow keys :3
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

"}}}

"""""""""""""""""""""""""""""
" => Status line {{{
"""""""""""""""""""""""""""""
" note: syntastic settings also modify status line

" Always show the status line
set laststatus=2

" if airline is running, we do not need showmode
set noshowmode

set ruler
set showtabline=2
set showcmd
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Delete Whitespace {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py,*.coffee :call DeleteTrailingWS()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc   {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" TECS files
autocmd BufNewFile,BufRead *.jack :set filetype=jack
autocmd BufNewFile,BufRead *.vm   :set filetype=vm

" .md is markdown
autocmd BufNewFile,BufRead *.md :set filetype=markdown

" mutt files
autocmd BufNewFile,BufRead *mutt-* :set filetype=mail

" command line mode more like a command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>
map <C-t> :tabnew<CR>
" map <C-q> :q<CR>
map <C-w> :w<CR>
map <C-z> :tabp<CR>
map <C-c> :tabn<CR>
map <C-x> :x<CR>

" <Ctrl-I> redraws the screen and removes any search highlighting
nnoremap <silent> <C-I> :nohl<CR><C-I>

" toggle wrapping
nmap \w :setlocal wrap!<CR> :setlocal wrap?<CR>

" set global fallback config file for YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/.ycm_global_conf.py'
let g:ycm_confirm_extra_conf = 0

" set python server to point to python 2 by default
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'

" use shift+cntrl+A to decrement numbers
nnoremap <C-s> <C-x>


" }}}

"""""""""""""""""""""""""""""
" => Spellchecking {{{
"""""""""""""""""""""""""""""
set spellsuggest=best,10

" use spell checking for mail and markdown
autocmd FileType mail     :setlocal spell spelllang=en_us
autocmd FileType markdown :setlocal spell spelllang=en_us

" toggle spell
nmap \s :setlocal spell!<CR> :setlocal spell?<CR>
" }}}

"""""""""""""""""""""""""""""
" => Vim-airline {{{
"""""""""""""""""""""""""""""
let g:airline_detect_modified=1
let g:airline_detect_paste=1

" install powerline fonts to use special symbols
let g:airline_powerline_fonts=1

let g:airline_theme='ubaryd'
" let g:airline_theme='jellybeans'
" let g:airline_theme='solarized'

" show buffers in tabline
let g:airline#extensions#tabline#enabled=1
" }}}

"""""""""""""""""""""""""""""
" => You Complete Me {{{
"""""""""""""""""""""""""""""
" seed identifier database with keywords from vim syntax files
let g:ycm_seed_identifiers_with_syntax=1

" location of global extra conf files (c and c++)
autocmd BufRead,BufNewFile *.c,*.h :let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.c.py"
autocmd BufRead,BufNewFile *.cpp,*hpp :let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.cpp.py"

" disable confirmation of conf files
let g:ycm_confirm_extra_conf=0

" enable for looking through location list - view errors all at once
let g:ycm_always_populate_location_list = 1

" autoclose preview window
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

" Force YCM to recompile entire file - note: gui freezes during this process
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>

" <list toggle setting which I use as a complement to YCM so included here>
" toggle location and quickfix lists
nnoremap <F7> :lt_location_list_toggle_map<CR>
nnoremap <F8> :lt_quickfix_list_toggle_map<CR>

" Automatically accept a QuickFix
nnoremap <F9> :YcmCompleter FixIt<CR>


 

" }}}

"""""""""""""""""""""""""""""
" => NerdTree {{{
"""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" close vim if only nerdtree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" open nerdtree if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}
"

"""""""""""""""""""""""""""""
" => Syntastic {{{
"""""""""""""""""""""""""""""

" recommended default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""
" => NerdCommenter {{{
""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

