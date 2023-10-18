return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      default = true,
      override = {
        html = {
          icon = "",
          color = "#E96228",
          name = "html",
        },
        css = {
          icon = "",
          color = "#88C0FC",
          name = "css",
        },
        js = {
          icon = "",
          color = "#EFD81D",
          name = "js",
        },
        ts = {
          icon = "ﯤ",
          color = "#88C0FC",
          name = "ts",
        },
        mp4 = {
          icon = "",
          color = "#C8CCD4",
          name = "mp4",
        },
        Dockerfile = {
          icon = "",
          color = "#88C0FC",
          name = "Dockerfile",
        },
        rb = {
          icon = "",
          color = "#EB635F",
          name = "rb",
        },
        vue = {
          icon = "﵂",
          color = "#3FB27F",
          name = "vue",
        },
        py = {
          icon = "",
          color = "#88C0FC",
          name = "py",
        },
        toml = {
          icon = "",
          color = "#88C0FC",
          name = "toml",
        },
        lock = {
          icon = "",
          color = "#dd732e",
          name = "lock",
        },
        zip = {
          icon = "",
          color = "#EBCB8B",
          name = "zip",
        },
        xz = {
          icon = "",
          color = "#EBCB8B",
          name = "xz",
        },
      },
    })
  end,
}
