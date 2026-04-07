vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local nvim_treesitter = require("nvim-treesitter")

local langs = {
  "bash",
  "c",
  "diff",
  "html",
  "lua",
  "luadoc",
  "query",
  "vim",
  "vimdoc",
  "sql",
  "javascript",
  "typescript",
  "jinja",
  "ruby",
  "yaml",
  "gdscript",
}

nvim_treesitter.install(langs)

local parsers = nvim_treesitter.get_installed()
local filetypes = {}
for _, lang in ipairs(parsers) do
  for _, filetype in ipairs(vim.treesitter.language.get_filetypes(lang) or {}) do
    filetypes[filetype] = true
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(filetypes),
  callback = function(ev)
    vim.treesitter.start(ev.buf)

    -- Enable legacy vim regex syntax highlighting for ruby
    local buffer_options = vim.bo[ev.buf]
    if buffer_options.filetype == "ruby" then
      buffer_options.syntax = "ON"
    end
  end,
})
