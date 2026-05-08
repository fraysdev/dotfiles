return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup({
            -- Add the specific languages you work with heavily
            ensure_installed = { "c", "cpp", "python", "lua", "qmljs", "rust" },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end
}

