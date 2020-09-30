set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview',
    \ 'batcat --theme=TwoDark --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}']}, <bang>0)
