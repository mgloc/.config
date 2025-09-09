return {
  cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
  mason = false,
  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
