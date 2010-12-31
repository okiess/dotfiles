" Font
set guifont=Monaco:h11.00

" No audible bell
set vb

" No toolbar
set guioptions-=T
set go-=T

" Use console dialogs
set guioptions+=c
colorscheme darkspectrum

" Project Tree
"autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
"autocmd FocusGained * call s:UpdateNERDTree()
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
"function s:CloseIfOnlyNerdTreeLeft()
"  if exists("t:NERDTreeBufName")
"    echo t:NERDTreeBufName
"    if bufwinnr(t:NERDTreeBufName) != -1
"      if winnr("$") == 1
"        q
"      endif
"    endif
"  endif
"endfunction

" If the parameter is a directory, cd into it
"function s:CdIfDirectory(directory)
"  let explicitDirectory = isdirectory(a:directory)
"  let directory = explicitDirectory || empty(a:directory)
"
"  if explicitDirectory
"    exe "cd " . a:directory
"  endif
"
"  if directory
"    NERDTree
"    wincmd p
"    bd
"  endif
"
"  if explicitDirectory
"    wincmd p
"  else
"
"  endif
"endfunction

" NERDTree utility function
"function s:UpdateNERDTree(...)
"  let stay = 0
"
"  if(exists("a:1"))
"    let stay = a:1
"  end

"  if exists("t:NERDTreeBufName")
"    let nr = bufwinnr(t:NERDTreeBufName)
"    if nr != -1
"      exe nr . "wincmd w"
"      exe substitute(mapcheck("R"), "<CR>", "", "")
"      if !stay
"        wincmd p
"      end
"    endif
"  endif

"  if exists(":CommandTFlush") == 2
"    CommandTFlush
"  endif
"endfunction

" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif

