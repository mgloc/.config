local pipe = "/tmp/godot.pipe"
local is_godot_project = vim.uv.fs_stat(vim.fn.getcwd() .. "/project.godot") ~= nil

if is_godot_project and not vim.uv.fs_stat(pipe) then
  vim.fn.serverstart(pipe)
end
