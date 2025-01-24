require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		c = { "clang_format" },
	},

	formatters = {
		clang_format = {
			command = "clang-format",
			args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
			stdin = true,
		},
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
