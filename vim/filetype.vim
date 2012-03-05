
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.jad     setf java
  au! BufNewFile,BufRead *.jj      setf java
  au! BufNewFile,BufRead *.zsh*    setf zsh
  au! BufNewFile,BufRead *.xml     setf xml
  au! BufNewFile,BufRead *.xml.pre setf xml
  au! BufNewFile,BufReadPre *.xsd  setf xml
  au! BufNewFile,BufRead *.jsp     setf xml
augroup END
