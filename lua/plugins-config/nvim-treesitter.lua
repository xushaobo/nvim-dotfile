local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then 
  vim.notify("没有找到 nvim-treesitter")
  return 
end


treesitter.setup({
  -- 安装language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { "json", "html", "css", "vim", "lua","javascript","go","rust" },

  -- 启动代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    }
  },
  -- 启用代码格式化，用于缩进(=)
  indent = {
    enable = true,
  },
})
  -- 启动代码折叠Folding 模块
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldlevel = 99
