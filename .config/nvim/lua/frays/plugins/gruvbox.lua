return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,    -- Applies Gruvbox colors to the ToggleTerm embedded terminal
            undercurl = true,          -- Enables undercurls for spell check and LSP diagnostics
            underline = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = true,
                comments = true,       -- Italic comments look great in Gruvbox
                operators = false,
                folds = true,
            },
            -- 'hard', 'soft', or '' (default)
            -- 'hard' makes the background darker and the colors pop more
            contrast = "hard", 
            
            -- Set this to true if your terminal emulator has a transparent background
            -- and you want Neovim to match it.
            transparent_mode = false, 
        })

        -- Tell Neovim to prefer dark mode and apply the theme
        vim.opt.background = "dark" 
        vim.cmd("colorscheme gruvbox")
    end
}

