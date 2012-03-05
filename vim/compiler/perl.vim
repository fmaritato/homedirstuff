if exists("current_compiler")
  finish
endif
let current_compiler = "perl"

setlocal makeprg=clear;perl\ -cw\ %
setlocal errorformat=%+Gsyntax\ error\ at\ %f\ line\ %l\\\,\ %m,
                     \%A%m\ at\ %f\ line\ %l%.%#,
                     \%C%*\\s%m,
                     \%-G%.%#\ had\ compilation\ errors.,
                     \%-G%.%#\ syntax\ OK

