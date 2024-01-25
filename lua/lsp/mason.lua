-- mason.lua
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  vim.notify("没有找到 mason")
  return
end

local nlsp_status, nvim_lsp = pcall(require, "lspconfig")
if not nlsp_status then
  vim.notify("没有找到 lspconfig")
  return
end
local mlsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

-- :h mason-default-settings
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
 -- 确保安装，根据需要填写
ensure_installed = {
  "lua_ls",
  "html",
  "gopls",
},
})

require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

function LspKeybind(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
end
-- 绑定快捷键
  require("keybinding").lspKeybinding(buf_set_keymap)
end

