require('zephyr')
-- Modify Theme Color
local syntax = {
  -- Line Number
  LineNr = {fg='#F0E68C'}
}
for group,conf in pairs(syntax) do
  vim.api.nvim_set_hl(0,group,conf)
end


