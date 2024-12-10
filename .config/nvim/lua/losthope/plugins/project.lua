require("project_nvim").setup({
	manual_mode = false, -- Automatically detect projects
	detection_methods = { "pattern", "lsp" }, -- Methods for detecting projects
	patterns = { ".git", "Makefile", "package.json" }, -- Project markers
	-- show_hidden = true, -- Show hidden files in project listing
})
