-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"


local function get_python_path(workspace)
  local venv_path = workspace .. "/.venv/bin/python"
  if vim.fn.executable(venv_path) == 1 then
    return venv_path
  end
  return "/usr/bin/python3"
end


local servers = { "html", "cssls", "clangd", "pyright", "biome"}

for _, lsp in ipairs(servers) do
  if lsp == "pyright" then
    lspconfig.pyright.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      before_init = function(params)
        local workspace = nil
        if params.rootUri then
          local ok, path = pcall(vim.uri_to_fname, params.rootUri)
          if ok then
            workspace = path
          else
            -- fallback: convert to string and remove file:// prefix manually
            local uri_str = tostring(params.rootUri)
            workspace = uri_str:gsub("^file://", "")
          end
        elseif params.rootPath then
          workspace = params.rootPath
        else
          workspace = vim.fn.getcwd()
        end
        params.pythonPath = get_python_path(workspace)
      end,
    }
  else
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end
