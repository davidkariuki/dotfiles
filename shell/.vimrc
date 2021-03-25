

if exists('g:vscode')
  nmap <leader>w :w<cr>
  nmap <leader>v :vsp ~/.vimrc<cr>
else

  " Indentline settings
  let g:indentLine_char = '│'

  " Emmet
  let g:user_emmet_leader_key='<C-E>'


endif

