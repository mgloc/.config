vim.pack.add({
  -- { src = "https://github.com/supermaven-inc/supermaven-nvim" },
  -- { src = "https://github.com/github/copilot.vim" },
  { src = "https://github.com/ThePrimeagen/99" },
})

-- Supermaven Setup

-- require("supermaven-nvim").setup({})
-- local api = require("supermaven-nvim.api")
-- vim.keymap.set("n", "<Leader>ts", function()
--   api.toggle()
--   print("Supermaven " .. (api.is_running() and "ON" or "OFF"))
-- end)

-- GitHub Copilot Setup

-- vim.g.copilot_status = false
--
-- vim.keymap.set("n", "<Leader>ts", function()
--   if vim.g.copilot_status then
--     vim.cmd(":Copilot disable")
--   else
--     vim.cmd(":Copilot enable")
--   end
--   vim.g.copilot_status = not vim.g.copilot_status
--   print("Copilot " .. (vim.g.copilot_status and "ON" or "OFF"))
-- end)
--
-- vim.g.copilot_filetypes = {
--   csv = false,
-- }
--
-- vim.g.copilot_node_command = "mise x node@latest -- node"

-- 99 Setup

local _99 = require("99")
local cwd = vim.uv.cwd()
local basename = vim.fs.basename(cwd)

_99.setup({
  provider = _99.Providers.ClaudeCodeProvider,
  logger = {
    level = _99.DEBUG,
    path = "/tmp/" .. basename .. ".99.debug",
    print_on_error = true,
  },
  tmp_dir = "./tmp",
})

vim.keymap.set("v", "<leader>aiv", function()
  _99.visual({})
end)

vim.keymap.set("n", "<leader>aix", function()
  _99.stop_all_requests()
end)

vim.keymap.set("n", "<leader>ais", function()
  _99.search({})
end)
