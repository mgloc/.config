-- files.lua - File manipulation and search
vim.pack.add({
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/stevearc/oil.nvim" },
})

local mini = require("mini.pick")
mini.setup({
  mappings = {
    choose_marked = "<C-q>",

    mark = "<C-x>",
    mark_all = "<C-w>",
    delete_word = "",
  },
})

vim.keymap.set("n", "<leader>sb", mini.builtin.buffers)
vim.keymap.set("n", "<leader>sf", mini.builtin.files)
vim.keymap.set("n", "<leader>sg", mini.builtin.grep_live)
vim.keymap.set("n", "<leader>sl", mini.builtin.grep)
vim.keymap.set("n", "<leader>sh", mini.builtin.help)

-- Search in package directories (node_modules, vendor, target, pkg)
vim.keymap.set("n", "<leader>sn", function()
  local package_dirs = {
    { path = "node_modules", label = "node_modules (npm)" },
    { path = "vendor", label = "vendor (Bundle)" },
    { path = "target", label = "target (Cargo)" },
    { path = "pkg", label = "pkg (Go)" },
  }
  -- Find which package directories exist
  local available_dirs = {}
  for _, dir in ipairs(package_dirs) do
    if vim.fn.isdirectory(dir.path) == 1 then
      table.insert(available_dirs, dir)
    end
  end

  if #available_dirs == 0 then
    vim.notify("No package directories found", vim.log.levels.INFO)
    return
  end

  -- Build choices
  local choices = {}
  for _, dir in ipairs(available_dirs) do
    table.insert(choices, dir.label)
  end

  if #choices == 1 then
    mini.builtin.files({}, { source = { cwd = available_dirs[1].path } })
    return
  end

  -- Show selector
  vim.ui.select(choices, { prompt = "Search in:" }, function(choice)
    if not choice then
      return
    end
    -- Find the selected directory path
    for _, dir in ipairs(available_dirs) do
      if dir.label == choice then
        mini.builtin.files({ tool = "rg" }, { source = { cwd = dir.path } })
        break
      end
    end
  end)
end)

require("oil").setup({
  keymaps = {
    -- Search in current Oil directory with grep_live
    ["<leader>sc"] = {
      callback = function()
        local dir = require("oil").get_current_dir()
        if dir then
          require("mini.pick").builtin.grep_live({}, { source = { cwd = dir } })
        end
      end,
      desc = "Grep at current Oil path",
    },
  },
})
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
