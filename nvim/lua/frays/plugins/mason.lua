return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'nvim-lua/plenary.nvim',
    },
    config = function(_, servers)
        require"lsp-zero".preset("recommended")
        require"lsp-zero".setup()
        require"mason".setup()

        require"mason-lspconfig".setup_handlers {
            function (server_name)
                require "lspconfig" [server_name].setup {}
            end
        }

        require"mason-lspconfig".setup {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "eslint",
                "pyright",
            },
            automatic_installation = true,
        }
    end,
}
