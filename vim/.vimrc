" == Global configurations ==

" Automatically move to correct indentation when going to the next line
set autoindent
" show existing tab with 4 space width
set tabstop=2
" When indenting with '>', use 4 space width
set shiftwidth=2
" expand tabs to spaces
set expandtab
" show line numbers
set number
" Ignore case unless you search with an upper case character
" or use \c (ignore case) or \C (pay attention to case) to override
set ignorecase
set smartcase

" Search as you type
set incsearch
" Highlight search results in light red text with a dark gray background
set hlsearch
" Set starting colour scheme
colo alduin

" enable syntax highlighting
syntax enable

" et  = expandtab
" ts  = tabstop
" sw  = shiftwidth
" sts = softtabstop

" == Per file-type configurations ==

" Set 2 spaces for html, js, ts, tsx, jsx files
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab

" Correct HTML indentation handling
filetype plugin indent on
let g:html_indent_script1='zero'

" === Vim cheat sheet: ===
"
" i - insert mode
" A - insert text at end of line
" a - insert text after cursor
"
" :wq! - Write quit force
" :o / :open <filename> - Open file
" :e <file> - Edit another file
" :ls - list buffers
" :b <#> - Open buffer number
" ctrl+f - Open command line mode with normal mode editing enabled
" u - undo last command
" U - undo whole line
" r - replace letter (eg `re` replaces letter with 'e')
" R - replace mode
"
" G - go to bottom of file
" gg - go to beginning of file
" <###> G - Go to line number
"
" :!<command> - run shell command
"
" === Cut Copy Paste ===
" v - Select characters
" V - select lines
" Ctrl+v - Select rectangular block
" d - cut (or x)
" dd - cut current line (with newline)
" y - copy
" Y / yy - Copy current line with newline
" Y$ - Copy current line without newline
" yiw - Yank current word (minus whitespace)
" yaw - Yank current word (with whitespace)
" P - paste before cursor
" p - paste after cursor
"
" === Searching ===
" / - start forward search, then <enter> to find.
" ? - start backward search
"   n - next
"   N - previous
"   % to find a matching `)]}`
"   ggn - first match
"   Gn  - last match
" * - search for next occurrance of currently selected word
" # - search backwards
"
" === Window Commands ===
" :sp / :split <file> - split window vertically and open file
" :vsp / :vsplit <file> - split window horizontally and open file
" :hide - Hide current window
" :only - Hide all but this window
" ctrl+w ctrl+w - Cycle window
" ctrl+w <arrow key> - go to window in direction
"
