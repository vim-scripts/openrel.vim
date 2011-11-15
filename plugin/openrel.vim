" openrel.vim - Open relatively-described files under the cursor
" Author:       Ryo Shibayama <ryo.shibayama@gree.co.jp>
" Last Change:  2011 Nov 15
" Version: 0.1
" DESCRIPTION:
"  This plugin enables vim to open relatively-described files under the cursor.
"
"  If :call GotoRelTargetFile(), jump to the file
"  Ctrl-O : You can go back to source file
"  let g:openrel_root_dirs = ['/var/www/']
"
"  Please add following setting to your .vimrc
" ==================================================
" nnoremap gaf :<C-u>call GotoRelTargetFile()<CR>
" ==================================================
if !exists('g:openrel_root_dirs')
  let g:openrel_root_dirs = ['/var/www/']
endif
function! GotoRelTargetFile()
  let filename = expand('<cfile>')
  let filepath = filename
    for dir in g:openrel_root_dirs
      if isdirectory(dir) == 1
        let filepath = dir . filename
        break
      endif
    endfor
  if filereadable(filepath)
    execute 'edit ' . filepath
  else
    echohl ErrorMsg
    echo 'no such file ' . filename
    echohl None
  endif
endfunction