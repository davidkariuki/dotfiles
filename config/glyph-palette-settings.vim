augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType startify call glyph_palette#apply()
augroup END

let g:glyph_palette#palette = copy(g:glyph_palette#defaults#palette)
