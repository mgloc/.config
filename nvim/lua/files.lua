-- files.lua - File manipulation and search
vim.pack.add({
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

-- Harpoon

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-s>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })
  end,
})

-- Mini Pick

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

-- Search in harpoon file list
vim.keymap.set("n", "<leader>se", function()
  local items = {}

  for i = 1, harpoon:list():length() do
    local item = harpoon:list():get(i)
    if item and item.value then
      table.insert(items, item.value)
    end
  end

  mini.start({
    source = {
      items = items,
      name = "Harpoon",
    },
  })
end)

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

  -- vim.pack plugin directory (works regardless of nvim install path, e.g. bob)
  local pack_dir = vim.fn.stdpath("data") .. "/site/pack"
  if vim.fn.isdirectory(pack_dir) == 1 then
    table.insert(available_dirs, { path = pack_dir, label = "pack (vim.pack)" })
  end

  -- Resolve Ruby gem path dynamically (works with mise/rbenv/rvm)
  local gem_dir = vim.fn.system("gem env gemdir 2>/dev/null"):gsub("\n", "")
  if gem_dir ~= "" and vim.fn.isdirectory(gem_dir .. "/gems") == 1 then
    table.insert(available_dirs, { path = gem_dir .. "/gems", label = "gems (Ruby/mise)" })
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

-- Oil
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

-- Open config in a new tab
vim.keymap.set("n", "<leader>ec", function()
  local config_dir = vim.fn.stdpath("config")
  vim.cmd("tabnew")
  vim.cmd("tcd " .. config_dir)
  require("oil").open()
end, { desc = "Open nvim config in Oil (new tab)" })
