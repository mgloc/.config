vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "query", "vim", "vimdoc", "sql", "javascript", "typescript" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "ruby" },
  },
  indent = { enable = true, disable = { "ruby" } },
})
