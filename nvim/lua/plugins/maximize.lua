vim.pack.add({
  { src = "https://github.com/declancm/maximize.nvim" },
})

local maximize = require("maximize")
maximize.setup()

vim.keymap.set("n", "<C-w>m", function()
  maximize.toggle()
  print(vim.t.maximized and "Maximized" or "Restored")
end)
