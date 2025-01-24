-- Setup Mason
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Setup Mason LSP Config
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd", -- C language server
		"html",
		"cssls",
		"pyright",
		-- Add more servers as required
	},
})

local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')  -- or require('snippy') if using nvim-snippy
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Set completeopt for better completion experience
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

-- Example for setting up a specific language server (e.g., lua_ls)
lspconfig.clangd.setup({
    capabilities = lsp_capabilities,
})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)  -- For luasnip
            -- or use nvim-snippy with:
            -- require('snippy').expand_snippet(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },  -- LSP completion
        { name = 'buffer' },    -- Buffer completion
        { name = 'path' },      -- Path completion
        { name = 'luasnip' },   -- Snippet completion from luasnip
        -- Add other sources as needed
    },
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'cmdline' }
    }, {
        { name = 'path' }
    })
})
