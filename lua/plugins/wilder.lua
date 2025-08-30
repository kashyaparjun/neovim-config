return {
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",          -- to refresh remote plugins support
    dependencies = { "romgrk/fzy-lua-native" },
    event = "CmdlineEnter",                   -- lazy-load when entering command-line
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":", "/", "?" } })
      -- Optional: configure pipeline, renderer, highlighter...
    end,
  },
}

