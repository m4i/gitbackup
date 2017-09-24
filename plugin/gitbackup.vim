if exists('g:loaded_gitbackup')
  finish
endif
let g:loaded_gitbackup = 1

let s:__dir__ = expand('<sfile>:p:h')

function! s:BufWritePost()
  let l:out = systemlist(s:__dir__ . '/../bin/gitbackup backup ' . expand('%:p:S'))
  if v:shell_error != 0
    for line in l:out
      echoerr line
    endfor
  endif
endfunction

augroup gitbackup
  autocmd!
  autocmd BufWritePost * call s:BufWritePost()
augroup END
