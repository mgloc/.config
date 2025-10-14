-- files.lua - File manipulation and search
vim.pack.add({
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/stevearc/oil.nvim" },
})

local mini = require("mini.pick")
mini.setup({
  mappings = {
    choose_marked = "<C-q>",

    mark = "<C-x>",
    mark_all = "<C-w>",
    delete_word = "",
  },
})

vim.keymap.set("n", "<leader>sb", mini.builtin.buffers)
vim.keymap.set("n", "<leader>sf", mini.builtin.files)
vim.keymap.set("n", "<leader>sg", mini.builtin.grep_live)
vim.keymap.set("n", "<leader>sl", mini.builtin.grep)
vim.keymap.set("n", "<leader>sh", mini.builtin.help)

require("oil").setup()
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
