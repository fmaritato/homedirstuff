if exists("current_compiler")
  finish
endif
let current_compiler = "wigwam"
set makeprg=clear;\ projectctl\ build
set errorformat=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
    \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
