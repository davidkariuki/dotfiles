-- local actions = require('telescope.actions')

require("telescope").setup {
  defaults = {
    prompt_position = "top",
    prompt_prefix = " 🔎 ",
    generic_sorter =  require"telescope.sorters".get_fzy_sorter,
    file_sorter =  require"telescope.sorters".get_fzy_sorter,
    layout_strategy = "flex",
    shorten_path = true,
    use_less = true,
    layout_defaults = {
      horizontal = {
        mirror = false,
        preview_width = 0.6
      },
      vertical = {
        mirrot = false
      }
    }
  }
}

