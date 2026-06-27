require("options")
require("keymaps")

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/junegunn/vim-easy-align" },
})

require("lsp")
require("formatters")
require("files")

require("godot")

require("plugins.actual_indians")
require("plugins.colors")
require("plugins.csvview")
require("plugins.git")
require("plugins.maximize")
require("plugins.sleuth")
require("plugins.treesitter")
require("plugins.undotree")

require("plugins.fun")
