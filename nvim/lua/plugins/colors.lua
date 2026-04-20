vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
})

local function set_theme(light)
  local is_light = light == "light"

  vim.o.background = light

  -- Tokyonight
  require("tokyonight").setup({
    transparent = not is_light, -- transparent background if dark
  })
  vim.cmd("colorscheme tokyonight" .. (is_light and "-day" or ""))
end

set_theme("dark")

vim.keymap.set("n", "<leader>tt", function()
  set_theme(vim.o.background == "dark" and "light" or "dark")
end, { desc = "Toggle light/dark theme" })
