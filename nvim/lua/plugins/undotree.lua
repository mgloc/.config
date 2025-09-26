vim.pack.add({
  { src = "https://github.com/jiaoshijie/undotree" },
})

require("undotree").setup()

vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })
