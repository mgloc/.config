vim.pack.add({
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/tpope/vim-fugitive" },
})

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")

-- Gitsigns
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})
