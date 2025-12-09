vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
})

require("tokyonight").setup({
  transparent = true,
  on_highlights = function(hl, _)
    hl.TelescopeNormal = {
      bg = "none",
      fg = "none",
    }
    hl.TelescopeBorder = {
      bg = "none",
      fg = "none",
    }
    hl.TelescopePromptNormal = {
      bg = "none",
    }
    hl.TelescopePromptBorder = {
      bg = "none",
      fg = "none",
    }
    hl.TelescopePromptTitle = {
      bg = "none",
      fg = "none",
    }
  end,
})

vim.cmd("colorscheme tokyonight")
