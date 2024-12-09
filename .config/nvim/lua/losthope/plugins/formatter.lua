require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		c = { "astyle" },
		latex = { "latexindent" },
		-- You can customize some of the format options for the filetype (:help conform.format)
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
