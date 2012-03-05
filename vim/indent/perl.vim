source $VIMRUNTIME/indent/perl.vim

set indentkeys+=!<Tab>
set cindent
set expandtab
set showmatch

set cinoptions=t0,+4,(0,)60,u0,*100  " cino:  all sorts of options
set cinwords=if,else,while,do,for,elsif,sub
set comments=n:#  " com:  Perlish comments
set formatoptions=crql  " fo:  word wrap, format comments
set nosmartindent  " nosi:  Smart indent useless when C-indent is on
