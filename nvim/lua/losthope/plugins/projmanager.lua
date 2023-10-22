require "neoproj".setup {
  -- Directory which contains all of your projects
  project_path = "~/Documents/coding",
}

vim.api.nvim_create_autocmd({"VimLeavePre"}, {
  callback = function()
    if vim.g.project_root ~= nil then
      require "neoproj".save_session()
    end
  end,
})
