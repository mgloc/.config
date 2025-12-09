-- lsp.lua - Lsp Configuration
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
})

-- Completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

vim.cmd([[set completeopt+=menuone,noselect,popup]])

-- Keymaps

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("i", "<c-space>", vim.lsp.completion.get)

-- Servers
vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "ruby_lsp",
})

require("mason").setup()

vim.lsp.config("ruby_lsp", {
  cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
})
