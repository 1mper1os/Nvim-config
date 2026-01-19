-- Configurar diagnósticos
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- Símbolos para diagnósticos
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Función para configurar keymaps cuando LSP se adjunta a un buffer
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- Navegación de código
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

  -- Información
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

  -- Refactoring
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

  -- Diagnósticos
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

  -- Formateo
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, opts)

  -- Workspace
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
end

-- Capacidades mejoradas con blink.cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

-- Configuración de servidores LSP usando la nueva API
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  },

  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      }
    }
  },

  tailwindcss = {
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
  },

  html = {
    filetypes = { 'html', 'htmldjango' },
  },

  cssls = {},
  jsonls = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    }
  },

  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = { command = "clippy" },
      },
    },
  },

  gopls = {},

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
    },
  },
}

-- Configurar cada servidor usando vim.lsp.config (nueva API)
for server_name, config in pairs(servers) do
  -- Combinar configuración personalizada con on_attach y capabilities
  local server_config = vim.tbl_deep_extend('force', {
    on_attach = on_attach,
    capabilities = capabilities,
  }, config)

  -- Usar la nueva API de Neovim 0.11+
  vim.lsp.config(server_name, server_config)

  -- Habilitar el servidor
  vim.lsp.enable(server_name)
end
