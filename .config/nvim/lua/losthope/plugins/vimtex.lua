vim.g.vimtex_compiler_latexmk = {
	--executable = 'latexmk',
	executable = "pdflatex",
	build_dir = "pdf",
}

vim.g.vimtex_view_method = "zathura" -- Set PDF viewer

require("cmp").setup({
	sources = {
		{ name = "vimtex" },
	},
})

-- Enable syntax highlighting for Lua files
