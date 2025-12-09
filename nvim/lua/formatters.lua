-- formatters.lua - File formatting without lsp
vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
  notify_on_error = true,
  notify_no_formatters = false,
  format_on_save = function(bufnr)
    local ignore_filetypes = { "csv" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match("/node_modules/") then
      return
    end
    return { timeout_ms = 500, lsp_format = "first" }
  end,
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    ruby = { "rubocop" },
    eruby = { "erb_format" },
    markdown = { "prettier" },
    yml = {},
    yaml = {},
  },
})

-- Manual format
vim.keymap.set("n", "<leader>ff", function()
  require("conform").format({ async = false, lsp_format = "first" })
end)

-- Autoformat toggle
vim.keymap.set("n", "<leader>tf", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  print("Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end)
