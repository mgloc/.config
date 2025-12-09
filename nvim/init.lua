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
require("plugins.gitsigns")
require("plugins.harpoon")
require("plugins.lazygit")
require("plugins.supermaven")
require("plugins.undotree")
