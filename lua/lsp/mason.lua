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

mason.setup()
mason_lspconfig.setup({})


nvim_lsp.lua_ls.setup({
  on_attach = LspKeybind,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.setttings, {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { 'vim' }
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
})

function LspKeybind(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  require("keymapping").lspKeybinding(buf_set_keymap)
end


