return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        config = function()
            require("project_nvim").setup {
                manual_mode = false, -- Automatically detect projects
                detection_methods = { "pattern", "lsp" }, -- Methods for detecting projects
                patterns = { ".git", "Makefile", "package.json" }, -- Project markers
                -- show_hidden = true, -- Show hidden files in project listing
            }
        end,
    },

    -- {
    --     "lervag/vimtex",
    --     -- lazy = false, -- we don't want to lazy load VimTeX
    --     -- tag = "v2.15", -- uncomment to pin to a specific release
    --     init = function()
    --         -- VimTeX configuration goes here, e.g.
    --         vim.g.vimtex_view_method = "zathura"
    --     end,
    -- },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
            },
        },
    },
}
