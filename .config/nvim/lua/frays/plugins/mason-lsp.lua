return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({})

        -- Boot up the servers
        vim.lsp.config('clangd', {})
        vim.lsp.config('rust_analyzer', {})

        -- Add this where you configure your individual servers
        vim.lsp.config('basedpyright', {
            settings = {
                basedpyright = {
                    analysis = {
                        -- This keeps it from yelling at you for untyped scripts
                        typeCheckingMode = "basic",
                        -- Toggles inlay hints (the ghost text showing variable names)
                        inlayHints = {
                            callArgumentNames = true,
                        }
                    }
                }
            }
        })

        -- Setup global LSP keymaps (only active when an LSP attaches to a file)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename Variable' })
    end
}

