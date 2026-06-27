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
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
    end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))

    -- clangd: switch between header and source file
    if client.name == "clangd" then
      vim.keymap.set("n", "<leader>ch", function()
        vim.lsp.buf_request(0, "textDocument/switchSourceHeader", { uri = vim.uri_from_bufnr(0) }, function(_, result)
          if result then
            vim.cmd("edit " .. vim.uri_to_fname(result))
          else
            vim.notify("No matching header/source found", vim.log.levels.WARN)
          end
        end)
      end, vim.tbl_extend("force", opts, { desc = "[C]langd switch [H]eader/source" }))
    end

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

-- SQL quick fix https://github.com/neovim/neovim/issues/14433
vim.g.omni_sql_default_compl_type = "syntax"

-- Servers
vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "ruby_lsp",
  "herb_ls",
  "pylsp",
  "gopls",
  "gdscript",
  "ts_ls", -- typescript-language-server
  "clangd",
})

require("mason").setup()
