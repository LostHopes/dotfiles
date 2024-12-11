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
	use({ "windwp/nvim-autopairs" }) -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integrationn and lazygit
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- gruvbox theme
	use("ellisonleao/gruvbox.nvim")

	-- comments

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- vs code like dev icons
	use("nvim-tree/nvim-web-devicons")

	-- markdown
	use({
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
	})

	-- Telescope (search files, etc)
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Linter, language server, debugging, formatter
	use({
		"williamboman/mason.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"stevearc/conform.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
	})

	-- startup page
	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			local dashboard = require("dashboard")
			local icons = require("losthope.lib.icons")
			local pwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

			dashboard.setup({
				theme = "hyper",
				disable_move = false,
				shortcut_type = "letter",
				change_to_vcs_root = true,
				hide = {
					statusline = true,
					tabline = false,
					winbar = false,
				},
				config = {
					week_header = {
						enable = true,
						append = { "", icons.documents.OpenFolder .. pwd },
					},
					packages = { enable = true },
					project = {
						enable = false, -- Enable project listing
						limit = 8, -- Limit number of projects shown
						icon = "📁", -- Icon for projects
						label = "Projects", -- Label for the section
					},
					mru = {
						enable = true,
						limit = 10,
						icon = "📝",
					},
					shortcut = {
						{
							desc = icons.ui.Package .. "Mason",
							group = "@property",
							action = "Mason",
							key = "m",
						},
						{
							desc = icons.ui.Package .. "Update",
							group = "@property",
							action = "PackerSync",
							key = "u",
						},
						{
							desc = icons.ui.Telescope .. "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = icons.ui.Project .. "Projects",
							group = "Label",
							action = "Telescope projects",
							key = "p",
						},
						{
							desc = icons.ui.Note .. "Todo",
							group = "Label",
							action = "Tdo",
							key = "d",
						},
						{
							desc = icons.ui.Power,
							group = "Action",
							action = "quit",
							key = "q",
						},
					},
					footer = { "", icons.ui.Heart .. " happiness is a state of mind " .. icons.ui.Heart },
				},
			})

			-- Show dashboard when lazy closes
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end
		end,
		requires = {
			"nvim-tree/nvim-web-devicons",
			"ahmedkhalf/project.nvim",
		},
	})

	-- Terminal integration
	use({ "akinsho/toggleterm.nvim" })

	-- use({ "rcarriga/nvim-notify" })

	-- For LaTeX
	use({
		"lervag/vimtex",
		requires = {
			{ "micangl/cmp-vimtex" },
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
