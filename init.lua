require('user.plugins')
require('user.options')
require('user.nvim-tree')
require('user.treesitter')
require('user.whichkey')
require('user.telescope')
require('user.gitsigns')
-- Lsp
require('lsp')
require('user.autopairs')
-- Get zephyr color
require('zephyr')
require('user.keymaps')
require('user.galaxyline')
require('user.bufferline')


-- Modify Theme Color
local syntax = {
  -- Line Number
  LineNr = {fg='#F0E68C'}
}
for group,conf in pairs(syntax) do
  vim.api.nvim_set_hl(0,group,conf)
end
