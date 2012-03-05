if exists("current_compiler")
  finish
endif
let current_compiler = "jikes"

set makeprg=clear;jikes\ +D\ -nowarn\ -depend\ %
set errorformat=%A%f:%l:%m,
                      \%-G%m,
                      \%-G%m,
                      \%-G%m
