local status, bufferline = pcall(require, "lualine")
if not status then
    vim.notify("没有找到lualine")
  return 
end


bufferline.setup({
  options = {
    theme = "tokyonight",
  },
  extensions = { "nvim-tree", "toggleterm" },
})


