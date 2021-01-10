" Remap Leader  ***************************************************************
let mapleader=","

" vim-plug Plugins **************************************************************
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
source ~/.config/nvim/plugins.vim

if exists('g:vscode')
  nmap <leader>w :w<cr>
  nmap <leader>v :vsp ~/.vimrc<cr>
else
  " Plugin-specific settings
  source ~/.config/nvim/glyph-palette-settings.vim
  source ~/.config/nvim/fern-settings.vim
  source ~/.config/nvim/coc-settings.vim
  source ~/.config/nvim/fzf-settings.vim

  " Indentline settings
  let g:indentLine_char = '│'

  " Emmet
  let g:user_emmet_leader_key='<C-E>'

  " Conceal level for markdown
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_frontmatter = 1

  " Colors/Themes *****************************************************************
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  set background=dark
  colorscheme one
  let g:airline_theme='one'
  let g:airline_powerline_fonts = 1

  " Status Line *****************************************************************
  set ruler " Show ruler
  set ch=1 " Make command line two lines high
  set laststatus=2

  " Insert New Line **************************************************************
  set ch=1 " Make command one line high

  " Misc ************************************************************************
  set nowrap
  set number " Show line numbers
  set relativenumber " Show relative line numbers
  set vb t_vb= " Turn off bell

  " Tabs ************************************************************************
  set tabstop=2
  set softtabstop=2
  set expandtab
  set shiftwidth=2

  " Windows *********************************************************************
  set equalalways " Multiple windows, when created, are equal in size
  set splitbelow splitright

  " Searching *******************************************************************
  set hlsearch  " highlight search
  set incsearch  " incremental search, search as you type
  set ignorecase " Ignore case when searching
  set smartcase " Ignore case when searching lowercase
  nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


  " Mapping ********************************************************************
  imap ii <Esc>
  map <leader>d :pu=strftime('%b %d, %Y %X')<cr>
  map <leader>w :up<cr>
  map <leader>v :vsp ~/.vimrc<cr>
  noremap <silent> <Leader>f :Fern . -drawer -reveal=% -width=28<CR><C-w>=
  nnoremap <silent> <C-p> :Files<CR>
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")
  set pastetoggle=<leader>p

  " Speedy.vim ********************************************************************
  set ttyfast " you got a fast terminal
  set lazyredraw " to avoid scrolling problems
  set timeoutlen=250

  " Cursorline/CursorColumn for current window only ****************
  augroup Cursor
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorcolumn
  augroup END
endif

