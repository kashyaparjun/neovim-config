return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            ".git",
            "dist",
            "build"
          },
          vimgrep_arguments = {
            "/Users/arjun.kashyap/.nvm/versions/node/v20.19.2/lib/node_modules/@anthropic-ai/claude-code/vendor/ripgrep/arm64-darwin/rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        },
        pickers = {
          find_files = {
            find_command = {
              "/Users/arjun.kashyap/.nvm/versions/node/v20.19.2/lib/node_modules/@anthropic-ai/claude-code/vendor/ripgrep/arm64-darwin/rg",
              "--files",
              "--hidden",
              "--glob",
              "!**/.git/*"
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
