return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp", -- enables regex in snippets (optional)
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local luasnip = require("luasnip")

    luasnip.config.set_config({
      history = true,                    -- jump back into exited snippets
      updateevents = "TextChanged,TextChangedI", -- live updates as you type
      region_check_events = "InsertEnter",
    })

    -- Load snippet collections
    require("luasnip.loaders.from_vscode").lazy_load()  -- friendly-snippets
    require("luasnip.loaders.from_lua").lazy_load({      -- your own Lua snippets
      paths = { vim.fn.stdpath("config") .. "/snippets" }
    })
  end,
}

