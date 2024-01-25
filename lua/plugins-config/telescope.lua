local status, telescope = pcall(require, "telescope")
if not status then 
  vim.notify("没有找到 telescope")
  return 
end


telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {

  },
})
