vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 定义快捷键到行首和行尾
map("n", "LB", "0", opt)
map("n", "LE", "$", opt)
-- 插入模式下行首行尾
map("i", "<C-a>", "<Esc>I", opt)
map("i", "<C-e>", "<Esc>A", opt)
-- 设置快捷键将选中文本块复制至系统剪贴板
map("v", "<Leader>y", '"+y', opt)
map("n", "<Leader>p", '"+p', opt)
-- 设置快捷键关闭当前分割窗口
map("n", "<Leader>q", ":q<CR>", opt)
-- 设置快捷键保存当前窗口内容
map("n", "<Leader>w", ":w<CR>", opt)
-- 设置快捷键保存并退出当前窗口内容
map("n", "<Leader>wq", ":wq<CR>", opt)
-- 不做任何保存，直接退出Vim
map("n", "<Leader>Q", ":qa!<CR>", opt)
-- 依次遍历子窗口
map("n", "<Leader>nw", "<C-W><C-W>", opt)
map("n", "<Leader>lw", "<C-W>l", opt)
map("n", "<Leader>hw", "<C-W>h", opt)
map("n", "<Leader>kw", "<C-W>k", opt)
map("n", "<Leader>jw", "<C-W>j", opt)
-- 在结对符之间跳转
map("n", "<Leader>M", "%", opt)

