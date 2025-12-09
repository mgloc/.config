vim.pack.add({
  { src = "https://github.com/vuciv/golf" },
  { src = "https://github.com/Eandrju/cellular-automaton.nvim" },
})

vim.keymap.set("n", "<leader>fml", function()
  local options = { "make_it_rain", "game_of_life", "scramble" }
  vim.ui.select(options, { prompt = "Choose your chaos:" }, function(choice)
    if choice then
      vim.cmd("CellularAutomaton " .. choice)
    end
  end)
end)
