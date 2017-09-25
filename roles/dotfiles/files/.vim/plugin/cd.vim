" CD - alternative :cd with more user-friendly completion  "{{{2

command! -complete=customlist,s:complete_cdpath -nargs=+ CD  cd <args>
function! s:complete_cdpath(arglead, cmdline, cursorpos)
  return split(globpath(&cdpath,
        \                     join(split(a:cmdline, '\s', s:TRUE)[1:], ' ') . '*/'),
        \            "\n")
endfunction

" Split - :split variants  "{{{2

command! -bar -nargs=1 Split  call s:cmd_Split(<q-args>)
function! s:cmd_Split(direction)
  let DIRECTION_MODIFIER_TABLE = {
        \   'Top': 'topleft',
        \   'Bottom': 'botright',
        \   'Left': 'vertical topleft',
        \   'Right': 'vertical botright',
        \   'above': 'leftabove',
        \   'below': 'rightbelow',
        \   'left': 'vertical leftabove',
        \   'right': 'vertical rightbelow',
        \ }

  let modifier = get(DIRECTION_MODIFIER_TABLE, a:direction, 0)
  if modifier is 0
    echoerr 'Invalid direction:' string(a:direction)
    return
  endif

  execute modifier 'split'
endfunction
