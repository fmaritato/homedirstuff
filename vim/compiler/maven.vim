if exists("current_compiler")
  finish
endif
let current_compiler = "maven"
" -b supresses banner
set makeprg=clear;\ maven\ -b\ -Dmaven.test.skip\ -f\ project.xml
set errorformat=%f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
"set errorformat=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
"    \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
