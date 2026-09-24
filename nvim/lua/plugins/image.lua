vim.pack.add({
  { src = "https://github.com/3rd/image.nvim" },
})

require("image").setup({
  backend = "kitty",
  processor = "magick_cli",
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  kitty_method = "normal",
})
