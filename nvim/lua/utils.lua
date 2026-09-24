vim.api.nvim_create_user_command("PackClean", function()
  local unused = vim
      .iter(vim.pack.get())
      :filter(function(p)
        return not p.active
      end)
      :map(function(p)
        return p.spec.name
      end)
      :totable()

  if #unused == 0 then
    vim.notify("No unused plugins")
    return
  end

  if vim.fn.confirm("Remove unused plugins?\n" .. table.concat(unused, "\n"), "&Yes\n&No", 2) == 1 then
    vim.pack.del(unused)
  end
end, { desc = "Delete plugins not added in this session" })
