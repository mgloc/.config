-- files.lua - File manipulation and search
vim.pack.add({
  { src = "https://github.com/echasnovski/mini.pick" },
})

local mini = require("mini.pick")
mini.setup()

vim.keymap.set("n", "<leader>bb", mini.builtin.buffers)
vim.keymap.set("n", "<leader>sf", mini.builtin.files)
vim.keymap.set("n", "<leader>sg", mini.builtin.grep_live)
vim.keymap.set("n", "<leader>sh", mini.builtin.help)
