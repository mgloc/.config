-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open file explorer
vim.keymap.set("n", "<leader>ss", vim.cmd.Ex, { desc = "Open Ex" }) -- replaced by Oil

-- Recenter on big moves
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Lists
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Search and replace visual
vim.keymap.set("v", "<leader>s", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])

-- Remove ^M chars
vim.keymap.set("n", "<leader>gm", function()
  vim.cmd("%s/\r//g")
end, { desc = "Remove all ^M characters" })

-- Quickfix
function ToggleQuickFix()
  vim.cmd(vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 1 and "copen" or "cclose")
end

vim.api.nvim_create_user_command("ToggleQuickFix", ToggleQuickFix, {})
vim.keymap.set("n", "<leader>q", ToggleQuickFix, { desc = "Toogle [Q]uickfix list" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, { desc = "Send [B]uffer diagnostics to [Q]list" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show [D]iagnostic" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
