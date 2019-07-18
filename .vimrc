set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Common
Plugin 'scrooloose/nerdtree'
"Plugin 'valloric/youcompleteme'
"Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matze/vim-move'
Plugin 'raimondi/delimitmate'
Plugin 'mattn/emmet-vim'
"Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'SyntaxAttr.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'


"PHP plugins
Plugin 'stanangeloff/php.vim'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'arnaud-lb/vim-php-namespace'

"Javascript
Plugin 'pangloss/vim-javascript'

"HTML
Plugin 'othree/html5.vim'


"CSS
Plugin 'mtscout6/vim-tagbar-css'

call vundle#end()            " required
filetype plugin indent on    " required


let tab=4
exe 'set tabstop=' .tab
exe 'set shiftwidth=' . tab
exe 'set softtabstop=' . tab
set expandtab

" Показывать номера строк
set number
"
" " Показывать в строке статуса координаты курсора
set ruler
"
" " Тип терминала
set term=xterm
"
" " Автовыравнивание
set autoindent
"
" " Мышь во всех режимах
set mouse=a
set ttymouse=xterm2
"
" " При поиске подсвечивает все совпадения (:nohl уберет подсветку)
set hlsearch
"
" Backspace грамотно съедает автовыравнивание, концы строк и тест до начала
" вставленного
set backspace=indent,eol,start
"
" При открывании файлов командами :e, :tabedit и др. автодополнение работать
" приятным образом
set wildmode=longest,list
"
" Включить подсветку синтаксиса
syntax enable
"
set background=dark
set t_Co=256 
colors gruvbox
"colors paper
"colors bjorn 

if &term == "screen"
  set t_Co=256
endif

" " Цветовая схема с разумными изменениями
"colorscheme delek
"highlight Search ctermfg=Black
"highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
"highlight DiffChange term=reverse cterm=bold ctermbg=yellow ctermfg=black
"highlight DiffText term=reverse cterm=bold ctermbg=green ctermfg=white
"highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

if has("autocmd")
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif " has("autocmd")

" AUTO CLOSE TAG HTML
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Name of file in ruler
set laststatus=2

"Going throuh tabs by Alt+arrowkey
:nnoremap <Esc>^[[1;3C :tabn<CR>
:nnoremap <Esc>^[[1;3D :tabp<CR>

"Folding by indent
:set foldmethod=indent
:set foldlevel=1

"Saving by F5
:nnoremap <F5> <ESC>:w<CR>
:inoremap <F5> <ESC>:w<CR>

:noremap <C-N><C-N> :set invnumber<CR>

"HTML syntax highlight for ejs templates by default
autocmd BufNewFile,BufRead *.ejs set syntax=html
autocmd BufNewFile,BufRead *.vue set filetype=html

"Functions for copy/paste from outerClipBoard
function! NormalMode()
    set mouse=a
    set nu
    set nopaste
endfunc

function! CopyToClipBoardMode()
    set mouse=
    set nu!
    set paste
endfunc

function! PasteFromClipBoardMode()
    set mouse=a
    set nu
    set paste
endfunc

:nmap <F2> <ESC>:call NormalMode()<CR>
:imap <F2> <ESC>:call NormalMode()<CR>
:nmap <F3> <ESC>:call CopyToClipBoardMode()<CR>
:imap <F3> <ESC>:call CopyToClipBoardMode()<CR>
:nmap <F4> <ESC>:call PasteFromClipBoardMode()<CR>
:imap <F4> <ESC>:call PasteFromClipBoardMode()<CR>

"GoBuffer
:set hidden
:noremap gb <ESC>:tabe 
:noremap gd <ESC>:tabe ./
:noremap ge <ESC>:e 

"Search what is selected
:map <F7> y<ESC>/<C-R>"

"Clear screen after closing
:set t_te=[H[39;49m[2J

"Make cursor as block on Cygwin terminal
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"Map leader
:let mapleader = ","

"Run scripts
:map <leader>r <ESC>:w!<CR>:!./%<CR>


" nerdtree
let NERDTreeAutoDeleteBuffer = 1

" youcompleteme
"let g:ycm_server_python_interpreter='python'
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:= ['<Down>']

" emmet
let g:user_emmet_expandabbr_key = '<C-e>'

" airline
let g:airline_theme='hybridline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" session
let g:session_autosave = 'no'

"Ultisnips
let g:UltiSnipsExpandTrigger="<c-n>"

" Tab to autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

"Suppress new line after autocomplete selection
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

