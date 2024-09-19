local horizon = require'lualine.themes.horizon'

-- Change the background of lualine_c section for normal mode
horizon.normal.c.bg = '#112233'

require('lualine').setup {
  options = { theme  = horizon },
}
