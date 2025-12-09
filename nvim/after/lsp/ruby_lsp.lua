local ruby_lsp_cmd = vim.fn.filereadable("Gemfile") == 1 and { "bundle", "exec", "ruby-lsp" } or { vim.fn.expand("~/.asdf/shims/ruby-lsp") }

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
