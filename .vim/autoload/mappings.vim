" Cycle through relativenumber + number, number (only), and no numbering.
function! mappings#cycle_numbering() abort
	if exists('+relativenumber')
		execute {
			\ '00': 'set relativenumber   | set nonumber',
			\ '01': 'set relativenumber   | set number',
			\ '10': 'set norelativenumber | set nonumber',
			\ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
	else
		" No relative numbering, just toggle numbers on and off.
		set number!<CR>
	endif
endfunction



function! s:Visual()
  return visualmode() == 'V'
endfunction

function! s:Move(address, at_limit)
  if s:Visual() && !a:at_limit
    execute "'<,'>move " . a:address
    call feedkeys('gv=', 'n')
  endif
  call feedkeys('gv', 'n')
endfunction

function! mappings#visual_move_up() abort range
  let l:at_top=a:firstline == 1
  call s:Move("'<-2", l:at_top)
endfunction

function! mappings#visual_move_down() abort range
  let l:at_bottom=a:lastline == line('$')
  call s:Move("'>+1", l:at_bottom)
endfunction
