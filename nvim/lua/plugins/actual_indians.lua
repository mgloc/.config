vim.pack.add({
  -- { src = "https://github.com/supermaven-inc/supermaven-nvim" },
  { src = "https://github.com/github/copilot.vim" },
})

-- Supermaven Setup

-- require("supermaven-nvim").setup({})
-- local api = require("supermaven-nvim.api")
-- vim.keymap.set("n", "<Leader>ts", function()
--   api.toggle()
--   print("Supermaven " .. (api.is_running() and "ON" or "OFF"))
-- end)

-- GitHub Copilot Setup

vim.g.copilot_status = false

vim.keymap.set("n", "<Leader>ts", function()
  if vim.g.copilot_status then
    vim.cmd(":Copilot disable")
  else
    vim.cmd(":Copilot enable")
  end
  vim.g.copilot_status = not vim.g.copilot_status
  print("Copilot " .. (vim.g.copilot_status and "ON" or "OFF"))
end)

vim.g.copilot_filetypes = {
  csv = false,
}
