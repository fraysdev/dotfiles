return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- ─── Diagnostic display (inline errors) ───────────────────────────

        vim.diagnostic.config({
            -- Virtual text: the inline ghost text at end of line
            virtual_text = {
                enabled = true,
                spacing = 4,        -- spaces between code and message
                prefix = "●",       -- dot before message; or use "■", "▶", "✘"
                suffix = "",
                source = "if_many", -- show source (e.g. "pyright") only if multiple LSPs
                severity = {        -- only show errors + warnings inline, not hints
                    min = vim.diagnostic.severity.WARN,
                },
            },

            -- Signs in the gutter
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN]  = " ",
                    [vim.diagnostic.severity.HINT]  = "󰠠 ",
                    [vim.diagnostic.severity.INFO]  = " ",
                },
            },

            -- Underline the problematic code
            underline = {
                severity = { min = vim.diagnostic.severity.WARN },
            },

            -- Don't show diagnostics while you're still typing
            update_in_insert = false,

            -- Most severe diagnostic shown first when multiple on same line
            severity_sort = true,

            -- Float popup config (shown on cursor hover or keymap)
            float = {
                border   = "rounded",
                source   = true,    -- always show source in float
                header   = "",
                prefix   = "",
                focusable = false,
            },
        })

        -- ─── Show float on cursor hold (VS Code hover behavior) ───────────

        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.diagnostic.open_float(nil, { focus = false })
            end,
        })

        -- How long before CursorHold fires (milliseconds)
        vim.opt.updatetime = 500


        -- ─── Keymaps ──────────────────────────────────────────────────────

        vim.keymap.set('n', 'K',          vim.lsp.buf.hover,           { desc = 'Hover Documentation' })
        vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,      { desc = 'Go to Definition' })
        vim.keymap.set('n', '<leader>r',  vim.lsp.buf.rename,          { desc = 'Rename Variable' })

        -- Diagnostic navigation (jump between errors)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'Previous Diagnostic' })
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count =  1, float = true }) end, { desc = 'Next Diagnostic' })
        vim.keymap.set('n', '[e', function() vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Previous Error' })
        vim.keymap.set('n', ']e', function() vim.diagnostic.jump({ count =  1, float = true, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Next Error' })

        -- Open diagnostic list for current buffer
        vim.keymap.set('n', '<leader>d',  vim.diagnostic.setloclist,   { desc = 'Diagnostics List' })
        -- Open float manually (if you don't want CursorHold auto-popup)
        vim.keymap.set('n', '<leader>e',  vim.diagnostic.open_float,   { desc = 'Line Diagnostics' })


        -- ─── Mason + servers (your existing config, untouched) ────────────

        require("mason").setup()
        require("mason-lspconfig").setup({})

        vim.lsp.config('clangd', {})
        vim.lsp.config('rust_analyzer', {})

        vim.lsp.config('basedpyright', {
            settings = {
                basedpyright = {
                    analysis = {
                        typeCheckingMode = "basic",
                        inlayHints = {
                            callArgumentNames = true,
                        }
                    }
                }
            }
        })
    end
}

