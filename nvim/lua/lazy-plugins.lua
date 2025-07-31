-- [[ Configure and install plugins ]]
require("lazy").setup({
  require("plugins/cmp"),
  require("plugins/colors"),
  require("plugins/conform"),
  require("plugins/csvview"),
  require("plugins/debug"),
  require("plugins/diffview"),
  require("plugins/gitsigns"),
  require("plugins/harpoon"),
  require("plugins/lazygit"),
  require("plugins/lspconfig"),
  require("plugins/mini"),
  require("plugins/peek"),
  require("plugins/supermaven"),
  require("plugins/telescope"),
  require("plugins/todo-comments"),
  require("plugins/treesitter"),
  require("plugins/undotree"),
  require("plugins/which-key"),
})

-- vim: ts=2 sts=2 sw=2 et
