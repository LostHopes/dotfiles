-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
use("wbthomason/packer.nvim")

   -- treesitter configuration
use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
})

-- file explorer
use("nvim-tree/nvim-tree.lua")

-- statusline
use("nvim-lualine/lualine.nvim")

-- Colorizer
use("norcalli/nvim-colorizer.lua")

-- auto closing
use('windwp/nvim-autopairs') -- autoclose parens, brackets, quotes, etc...
use{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" } -- autoclose tags

  -- git integration
use('lewis6991/gitsigns.nvim') -- show line modifications on left hand side


-- gruvbox theme
use("ellisonleao/gruvbox.nvim")

-- comments

use{
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

-- vs code like dev icons
use("nvim-tree/nvim-web-devicons")

-- markdown
use{
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('render-markdown').setup({})
    end,
}

-- Telescope
use {
  'nvim-telescope/telescope.nvim', 
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- Linter, language server
use{
    "williamboman/mason.nvim",
    requires = { 
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim"
    }
}

if packer_bootstrap then
    require("packer").sync()
  end
end)
