-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

if vim.g.neovide then
  vim.opt.linespace = 15
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_show_border = true
  -- vim.g.neovide_opacity = 0.0
  -- vim.g.transparency = 0.9
  -- vim.g.neovide_scale_factor = 1.0
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()
end
