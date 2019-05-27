" Theme stuff
" Dynamically switch color scheme and have things respect it
function! SwitchColorScheme(name)
  let g:VIM_COLOR_SCHEME = a:name
  call ColorScheme()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! ColorScheme()
  if g:VIM_COLOR_SCHEME ==# 'palenight'
    let g:palenight_terminal_italics=1
    colorscheme palenight
    let g:lightline.colorscheme = 'palenight_alter'
  endif

  if g:VIM_COLOR_SCHEME ==# 'night-owl'
    colorscheme night-owl
    let g:lightline.colorscheme = 'challenger_deep'
  endif

  if g:VIM_COLOR_SCHEME ==# 'nord'
    let g:nord_underline = 1
    let g:nord_italic_comments = 1
    let g:nord_italic = 1
    let g:nord_cursor_line_number_background = 1
    colorscheme nord
    let g:lightline.colorscheme = 'nord'
  endif

  if g:VIM_COLOR_SCHEME == 'one-dark'
    set background=dark
    colorscheme one
    let g:lightline.colorscheme = 'one-dark'
  endif

  if g:VIM_COLOR_SCHEME == 'ayu-light'
    let ayucolor="light"
    set background=light
    colorscheme ayu
    let g:lightline.colorscheme = 'ayu_light'
  endif

  if g:VIM_COLOR_SCHEME == 'ayu-mirage'
    set background=dark
    let ayucolor="mirage"
    colorscheme ayu

    let g:lightline.colorscheme = 'ayu_mirage'
  endif
endfunction

" The Defaults
let g:VIM_COLOR_SCHEME = 'night-owl'
set background=dark
colorscheme night-owl
