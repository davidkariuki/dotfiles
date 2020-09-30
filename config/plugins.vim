call plug#begin()
Plug 'lambdalisue/glyph-palette.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'antoinemadec/FixCursorHold.nvim' " nvim/fern
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
