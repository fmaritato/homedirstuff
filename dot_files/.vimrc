version 7.0
set list
" set number

" line length
"set wrapmargin=500

" Quick way to resource vimrc
map ,u :source ~/.vimrc<cr>

" This file turns on matching of html tags using the % key. Cool!
if filereadable('/usr/share/vim/vim70/macros/matchit.vim')
  source /usr/share/vim/vim70/macros/matchit.vim
endif

" No f'n beeping
set vb t_vb=

set fileencodings=utf-8,japan,latin1

" Dont indent text files
set formatoptions-=t
"set textwidth=79

" have % bounce between angled brackets, as well as other kinds:
set matchpairs+=<:>

" Allow backspacing over everything in insert mode
set backspace=start,indent,eol

" set insensitive case searching
set ic

" Don't try to format when pasting into window
set pastetoggle=<F8>
set paste
" Show tabs
set listchars=tab:>+,trail:+

" Fix the problem with the backspace key
:if &term == "termname"
:  set t_kb=^V<BS>
:  fixdel
:endif
":fixdel

"######################################################################
" Steve's vimrc here

" Write the contents of the file, if it has been modified, on each :next, etc.
set autowrite

" Used for highlighting
set background=dark

" List of directories for the backup file, separated with commas.
set backupdir=~/tmp

" List of directory names for the swap file, separated with commas.
set directory=~/tmp

" Name of the errorfile for the QuickFix mode
set errorfile=o

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
" explicitly set for different file types below.
set expandtab

set history=100

" While typing a search pattern, show immediately where the so far
" typed pattern matches.
set incsearch

" The value of this option influences when the last window will 
" have a status line:
"   0: never
"   1: only if there are at least two windows
"   2: always
set laststatus=2

" Enable the use of the mouse.  Only works for certain terminals.
"set mouse=a

" Show (partial) command in status line.
set noshowcmd

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" If in Insert, Replace or Visual mode put a message on the last line.
set showmode

" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase

" sets labels that can be jumped to.
"set tags=$GOTO_HOME/src/java/.tags

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" When on, the title of the window will be set to the value of 'titlestring'
"set title
"set titlestring=%{$USER}@%{hostname()}:\ VIM\ %t

" When non-empty, the viminfo file is read upon startup and written when exiting Vim
set viminfo='0,f0,\"0,h
"set viminfo=

" A file that matches with one of these patterns is ignored when completing file or directory names.
set wildignore+=*.class
set wildignore+=CVS

" Completion mode that is used for the character specified with 'wildchar'
" "full"          Complete the next full match.
" "longest"       Complete till longest common string.
set wildmode=longest,full
set winheight=8

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu

" Highlight searches by default and provide a mapping (below) to turn it off
set hlsearch

map <F1> :make java:compile<CR>
map <F2> :make clean jar:install-snapshot<CR>
map <F3> :make dist<CR>
map <F4> :%s/=\([a-z_0-9.()#%-]\+\)/="\1"/gc<CR>
map <F5> :%s/\r//g<CR>
map <F8> :JI<CR>:JIS<CR>
map <F9> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
map <F10> :nohlsearch<CR>
map <F11> :if exists("list") <Bar> set nolist <Bar> else <Bar> set list <Bar> endif <CR>
map <F12> :JIFS<CR>

vmap ;b :!propToBean<CR>
vmap ;i :!sortImports<CR>
vmap ;t :!fix_indentation.pl<CR>
vmap ;x :!xml_indent.pl<CR>
vmap ;q :!xml_reformat.pl<CR>=G
nmap ,cl :1<CR>O<ESC>:1<CR>:r!date<CR>0i* <ESC>$a Frank Maritato <frank.maritato@openx.com><ESC>:1<CR>dd

" When a character is present this indicates vi-compatible behavior.
"set cpo-=<

if (has("syntax"))
  let java_highlight_all=1
  let java_highlight_debug=1
  let java_highlight_nctions="style"
  let java_allow_cpp_keywords=1
endif

filetype plugin indent on
syntax on

" YAY!
let g:JavaImpDataDir = $HOME . "/tmp"
let g:JavaImpPaths = expand("$HOME") . "/jdk-1.4.2_07," .
      \ expand("$HOME") . "/jakarta-struts-1.2.4-src/src/share," .
      \ expand("$HOME") . "/hibernate-3.0/src," .
      \ expand("$HOME") . "/spring-framework-1.1.5/src,"


if (has("autocmd"))
  " Clear out group created by RedHat VIM install
  augroup cprog
    au!
  augroup END

  au BufNewFile *.java        0r!makeJavaTemplate.pl %:~:h %:t:r
  au BufNewFile *.java  execute "/class ".expand("%:t:r")."/"
  au BufNewFile,BufRead *.fun,*.pks,*.pkb,*.sql,*.pls,*.plsql    setf plsql

  autocmd BufReadPre,BufNewFile *.jsp,*.jhtml,*.html set encoding=utf-8
endif

" Added for Rails
set nocompatible  " We don't want vi compatibility.
" Add recently accessed projects menu (project plugin)
set viminfo^=!
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
" END Rails
