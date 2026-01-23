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

    -- LSP-only keymaps
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    if client:supports_method("textDocument/completion") then
      -- todo convert to remove those parenthesis
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.keymap.set("i", "<c-space>", function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

vim.o.complete = ".,o"
vim.o.completeopt = "fuzzy,menuone,noselect,popup"
vim.o.autocomplete = true
vim.o.pumheight = 9

-- Servers
vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "ruby_lsp",
  "herb_ls",
  "pylsp",
  "gopls",
})

require("mason").setup()
