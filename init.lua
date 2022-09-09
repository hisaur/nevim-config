-- examples for your init.lua
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-commentary'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'EdenEast/nightfox.nvim'
vim.call('plug#end')



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
-- Functional wrapper for mapping hjkl for Nvim tree
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")


local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        -- view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        -- view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end
local config = {
     sort_by = "case_sensitive",
     open_on_setup = true,
     sync_root_with_cwd = true,

    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit", action_cb = edit_or_open },
                { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all", action_cb = collapse_all }
            }
        },
    },
    actions = {
        open_file = {
            quit_on_open = false
        }
    }
}

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
local set = vim.opt
set.number = true
set.relativenumber = true
set.updatetime = 100
set.ignorecase = true
set.splitbelow = true
set.splitright = true
vim.opt.list = true
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd("colorscheme carbonfox")
require('lualine').setup()
require("indent_blankline").setup {
    show_end_of_line = true,
}
require('nvim-tree').setup(config)
vim.cmd "source ~/.config/nvim/coc.vim"
vim.opt.termguicolors = true
require("toggleterm").setup{}
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<CR>', {noremap = true , silent = true})
vim.keymap.set('n', '<Leader>f', ':NvimTreeFocus<CR>',{noremap = true , silent = true})

vim.api.nvim_set_keymap('n', '<Leader>ff',':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-[>','<C-\\><C-n>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>',':split term://zsh<CR>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>q',':bdelete!<CR>',{noremap = true, silent = true})
-- Copy to system clipboard. Useful for X11 sessions.
vim.api.nvim_set_keymap('v', '<C-y>','"*y',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>','"*p',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-P>','"*P',{noremap = true, silent = true})
