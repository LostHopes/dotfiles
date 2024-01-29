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

use("navarasu/onedark.nvim")


-- statusline
use("nvim-lualine/lualine.nvim")

-- Colorizer
use("norcalli/nvim-colorizer.lua")

-- C++
use("p00f/clangd_extensions.nvim")


-- auto closing
use ('windwp/nvim-autopairs') -- autoclose parens, brackets, quotes, etc...
use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" } -- autoclose tags

  -- git integration
  use ('lewis6991/gitsigns.nvim') -- show line modifications on left hand side


-- gruvbox theme
use("ellisonleao/gruvbox.nvim")

-- scrollbar
use("petertriho/nvim-scrollbar")

--project manager

use({
  "coffebar/neovim-project",
  config = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim"},
    { "Shatur/neovim-session-manager" },
  }
})

-- autocompletion

use{"neoclide/coc.nvim", branch="release"}

-- comments

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

-- vs code like dev icons
use("nvim-tree/nvim-web-devicons")

if packer_bootstrap then
    require("packer").sync()
  end
end)
