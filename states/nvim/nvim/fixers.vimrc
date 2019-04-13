" Ale stuff
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'elixir':  ['mix_format']
\}
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'javascript.jsx': ['eslint']
\}

let g:ale_fix_on_save = 1
" Letting coc.vim do the completion instead of all
let g:ale_completion_enabled = 0
" use projects prettier and eslint settings
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_local_config = 1
let g:ale_sign_error = '●'

" Test support
" Neomake & vim-test
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:neomake_open_list = 1
let g:test#strategy = 'neomake'
let g:neomake_warning_sign = {
  \   'text': '◉'
  \ }
let g:neomake_error_sign = {
  \   'text': '◉'
  \ }

" Show message that tests have started
function! MyOnNeomakeJobStarted() abort
  echom printf('🔮 Running tests...')
endfunction

" Show message when all tests are passing
function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    echom printf('🧙 All tests passed ')
  endif
  if context.jobinfo.exit_code == 1
    echom printf('🤬 Failing tests')
  endif
endfunction

augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
  autocmd User NeomakeJobStarted call MyOnNeomakeJobStarted()
augroup END
