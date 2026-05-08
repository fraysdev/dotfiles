return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                -- Offsets the tabs so they don't overlap with nvim-tree
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true
                    }
                }
            }
        })

        -- Shift + H/L to cycle left and right through your open tabs
        vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
        vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
        
        -- Quickly close the current tab
        vim.keymap.set('n', '<leader>c', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })
    end
}

