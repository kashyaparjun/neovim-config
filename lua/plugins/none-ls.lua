return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- JavaScript/TypeScript
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        
        -- Existing sources
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    
    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.{js,jsx,ts,tsx,json,css,scss,md}",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
