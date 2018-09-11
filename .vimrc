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
:map <F5> :w<CR>

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

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
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
:set pastetoggle=<F2>
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
