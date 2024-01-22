local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
	   "git",
	   "clone",
	   "--filter=blob:none",
	   "https://github.com/folke/lazy.nvim.git",
	   "--branch=stable", 
	   lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/tokyonight.nvim", name = "tokyonight", priority = 1000, lazy = false, opts = {}, } ,
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "gruvbox-community/gruvbox", name = "gruvbox", priority = 1000 },
	{ "kyazdani42/nvim-tree.lua", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim", dependencies = "nvim-web-devicons" },
  { "nvim-telescope/telescope.nvim", name = "telescope", dependencies = "nvim-lua/plenary.nvim" },
  { "nvimdev/dashboard-nvim", event = 'VimEnter',  dependencies = "nvim-tree/nvim-web-devicons" },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
  { "nvim-treesitter/nvim-treesitter" },
  { "williamboman/mason.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim" },
})
