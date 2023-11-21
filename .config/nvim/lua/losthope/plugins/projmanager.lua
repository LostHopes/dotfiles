require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

require('telescope').load_extension('projects')

require'telescope'.extensions.projects.projects{}

local project_nvim = require("project_nvim")
local recent_projects = project_nvim.get_recent_projects()

print(vim.inspect(recent_projects))


