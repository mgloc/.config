require("options")
require("keymaps")

vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" }
})

require("lsp")
require("formatters")
require("files")

require("plugins.treesitter")
require("plugins.lazygit")
require("plugins.colors")
require("plugins.csvview")
require("plugins.undotree")
require("plugins.supermaven")
require("plugins.gitsigns")
