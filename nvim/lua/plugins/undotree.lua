vim.pack.add({
    { src = 'https://github.com/jiaoshijie/undotree' }
})

vim.keymap.set('', '<leader>u', "<cmd>lua require('undotree').toggle()<cr>")
