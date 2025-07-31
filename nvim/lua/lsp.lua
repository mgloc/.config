vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
vim.lsp.enable({ "lua_ls", "rust_analyzer" })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})
