local ENABLED_THEME = 'tokyonight'

local function pickTheme(theme)
  if theme == ENABLED_THEME then
    vim.cmd('colorscheme ' .. ENABLED_THEME)
  end
end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        disable_background = true,
        styles = {
          transparency = true,
          italic = false,
        },
      }
      pickTheme 'rose-pine'
    end,
  },
  {
    'folke/tokyonight.nvim',
    opts = {},
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        transparent = true,
        on_highlights = function(hl, _)
          hl.TelescopeNormal = {
            bg = 'none',
            fg = 'none',
          }
          hl.TelescopeBorder = {
            bg = 'none',
            fg = 'none',
          }
          hl.TelescopePromptNormal = {
            bg = 'none',
          }
          hl.TelescopePromptBorder = {
            bg = 'none',
            fg = 'none',
          }
          hl.TelescopePromptTitle = {
            bg = 'none',
            fg = 'none',
          }
        end,
      }
      pickTheme 'tokyonight'
    end,
  },
}
