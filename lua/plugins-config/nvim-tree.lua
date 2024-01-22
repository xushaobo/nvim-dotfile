local status, nvim_tree = pcall(require, "nvim-tree")
if not status then 
	vim.notify("没有找到 nvim-tree")
	return 
end

nvim_tree.setup({
	sort_by  = "case_sensitive",
	git = {
		enable = true,
	},

	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},
	view = {
		side = "left",
		number =false,
		relativenumber = false,
		signcolumn = "yes",
		width = 30,
	},
	renderer = {
		group_empty = true,
	},

  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
