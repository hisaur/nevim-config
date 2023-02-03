
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- WhichKey
  use {
   "folke/which-key.nvim",
   config = function()
     require("config.whichkey").setup()
   end,
  }
   -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
        { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
        { "p00f/nvim-ts-rainbow", event = "BufReadPre", disable = true },
        { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
        { "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
        { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre", disable = true },
        { "mfussenegger/nvim-treehopper", module = { "tsht" }, disable = true },
        {
          "m-demare/hlargs.nvim",
          config = function()
            require("config.hlargs").setup()
          end,
          disable = false,
        },
        {
          "AckslD/nvim-FeMaco.lua",
          config = function()
            require("femaco").setup()
          end,
          ft = { "markdown" },
          cmd = { "Femaco" },
          module = { "femaco_edit" },
          disable = true,
        },
      },
    }

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use 'folke/tokyonight.nvim'
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}
use { "kkharji/sqlite.lua" }
use { "nvim-telescope/telescope-smart-history.nvim" }
use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  end)

