require('plugins')
require('nvim_options')
require('keymap')
require('lualine').setup {
  options = { theme = 'tokyonight' },
}
require("toggleterm").setup()
require("bufferline").setup()
require("sqlite")
require("config.telescope")
require('telescope').setup { defaults = telescope_config}
require('telescope').load_extension('smart_history')
