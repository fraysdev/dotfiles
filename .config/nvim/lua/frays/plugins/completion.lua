return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      -- Sources
      "hrsh7th/cmp-nvim-lsp",        -- LSP completions
      "hrsh7th/cmp-nvim-lsp-signature-help", -- function signature popup
      "hrsh7th/cmp-buffer",          -- words from current buffer
      "hrsh7th/cmp-path",            -- filesystem paths
      "hrsh7th/cmp-cmdline",         -- : and / command line completions
      "hrsh7th/cmp-nvim-lua",        -- Neovim Lua API (useful if editing configs)

      -- Snippet engine
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Friendly snippet collection (optional but recommended)
      "rafamadriz/friendly-snippets",

      -- Icons in the menu
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Load VS Code-style snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        -- Snippet expansion — required
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- How the completion window looks
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        -- Completion behavior
        completion = {
          completeopt = "menu,menuone,noinsert", -- noinsert = don't auto-select
        },

        -- Keymaps
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),         -- force open menu
          ["<C-e>"]     = cmp.mapping.abort(),            -- close menu
          ["<CR>"]      = cmp.mapping.confirm({ select = false }), -- confirm only if selected
          ["<C-y>"]     = cmp.mapping.confirm({ select = true }),  -- confirm and select top

          -- Scroll docs popup
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- Navigate menu with Tab / Shift-Tab
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()   -- jump to next snippet placeholder
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        -- Sources, in priority order
        sources = cmp.config.sources({
          { name = "nvim_lsp",               priority = 1000 },
          { name = "nvim_lsp_signature_help", priority = 900 },
          { name = "luasnip",                priority = 800 },
          { name = "nvim_lua",               priority = 700 },
        }, {
          -- Fallback group — only used if first group is empty
          { name = "buffer",  keyword_length = 3 }, -- don't trigger on <3 chars
          { name = "path" },
        }),

        -- Menu item formatting with icons (lspkind)
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",   -- icon + text label
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {               -- source labels shown on the right
              nvim_lsp    = "[LSP]",
              luasnip     = "[Snip]",
              buffer      = "[Buf]",
              path        = "[Path]",
              nvim_lua    = "[Lua]",
            },
          }),
        },

        -- Don't show completions in comments
        enabled = function()
          local context = require("cmp.config.context")
          if vim.api.nvim_get_mode().mode == "c" then return true end
          return not context.in_treesitter_capture("comment")
              and not context.in_syntax_group("Comment")
        end,

        -- Sorting: boost exact matches and recently-used items
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,  -- floats recently used items up
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      -- Cmdline completions (:) 
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- Search completions (/)
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
  },
}

