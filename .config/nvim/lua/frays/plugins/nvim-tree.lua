return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Adds file icons
    config = function()
        -- Disable netrw (Vim's native clunky explorer) at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            view = {
                width = 40,
                side = "left",
            },
            filters = {
                dotfiles = false, -- Set to true if you want to hide hidden files
            },
        })

        -- Map Leader + e to toggle the tree open and closed
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' })
        vim.keymap.set("n", "<leader>d", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle Find File Explorer" })
    end
}

