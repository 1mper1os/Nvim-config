require("conform").setup({
  formatters_by_ft = {
    -- JavaScript/TypeScript
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    
    -- Web
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    
    -- Lua
    lua = { "stylua" },
    
    -- Python
    python = { "isort", "black" },
    
    -- Rust
    rust = { "rustfmt" },
    
    -- Go
    go = { "gofmt", "goimports" },
    
    -- C/C++
    c = { "clang_format" },
    cpp = { "clang_format" },
    
    -- Shell
    sh = { "shfmt" },
    bash = { "shfmt" },
    
    -- SQL
    sql = { "sql_formatter" },
    
    -- PHP
    php = { "php_cs_fixer" },
    
    -- Java
    java = { "google-java-format" },
  },
  
  -- Formatear al guardar
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  
  -- Formatear después de un delay
  format_after_save = {
    lsp_fallback = true,
  },
  
  -- Notificar errores de formateo
  notify_on_error = true,
})