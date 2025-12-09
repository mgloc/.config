require("options")
require("keymaps")

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("lsp")
require("formatters")
require("files")

require("plugins.treesitter")
require("plugins.colors")
require("plugins.csvview")
require("plugins.git")
require("plugins.maximize")
require("plugins.harpoon")
require("plugins.supermaven")
require("plugins.undotree")

require("plugins.fun")
