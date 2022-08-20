-- examples for your init.lua
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'shaunsingh/nord.nvim'
Plug 'folke/which-key.nvim'
vim.call('plug#end')

require("nvim-tree").setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "lua", "go","python","java","json","json5" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}
-- keymap('n', '<leader>t', 'NvimTreeToggle<cr>')
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>f', ':NvimTreeFocus<CR>')
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
vim.cmd[[colorscheme nord]]
