local has_ruby_lsp = vim.fn.system("bundle show ruby-lsp 2>/dev/null"):match("ruby%-lsp")
local ruby_lsp_cmd = has_ruby_lsp and { "bundle", "exec", "ruby-lsp" } or { vim.fn.expand("ruby-lsp") }

return {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start(ruby_lsp_cmd, dispatchers, config and config.root_dir and { cwd = config.cmd_cwd or config.root_dir })
  end,
  mason = false,
  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
