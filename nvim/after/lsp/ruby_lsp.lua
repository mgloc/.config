local has_ruby_lsp = vim.fn.system("bundle show ruby-lsp 2>/dev/null"):match("ruby%-lsp")
local ruby_lsp_cmd = has_ruby_lsp and { "bundle", "exec", "ruby-lsp" } or { vim.fn.expand("ruby-lsp") }

return {
  cmd = ruby_lsp_cmd,
  mason = false,
  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
