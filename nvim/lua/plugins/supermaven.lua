vim.pack.add({
  { src = "https://github.com/supermaven-inc/supermaven-nvim" },
})

require("supermaven-nvim").setup({})
local api = require("supermaven-nvim.api")
vim.keymap.set("n", "<Leader>ts", function()
  api.toggle()
  print("Supermaven " .. (api.is_running() and "ON" or "OFF"))
end)
