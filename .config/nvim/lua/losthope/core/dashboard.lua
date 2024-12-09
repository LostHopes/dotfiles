require("dashboard").setup({
	theme = "hyper",
	header = require("ascii").art.text.neovim.sharp,
	date_format = "%d %B %Y %H:%M",
	directories = {
		"~/Documents/University/coding/tech-blog",
		"~/Documents/University/coding/dotfiles",
		"~/Documents/University/coding/python/Flask-labs",
		"~/Documents/notes/Interests",
		"~/Documents/University/coding/C/utils",
		"~/Documents/University/Other/Books/Resume",
	}
})
