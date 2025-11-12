return {
    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- Telescope enhancements
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },

    -- Snippet engine
    {
        "L3MON4D3/LuaSnip",
    },

    -- Add more plugins here:
    --
    -- Bufferline
    -- {
    --     "akinsho/bufferline.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = function()
    --         require("bufferline").setup({})
    --     end,
    -- },
    --
    -- Auto-closing and auto-renaming HTML tags
    -- {
    --     "windwp/nvim-ts-autotag",
    --     config = function()
    --         require("nvim-ts-autotag").setup()
    --     end,
    -- },
    --
    -- Colorizer
    -- {
    --     "norcalli/nvim-colorizer.lua",
    --     config = function()
    --         require("colorizer").setup()
    --     end,
    -- },
    --
    -- Git integration
    -- {
    --     "NeogitOrg/neogit",
    --     dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    --     config = true,
    -- },
    --
    -- Enhanced diagnostics
    -- {
    --     "folke/trouble.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = function()
    --         require("trouble").setup({})
    --         vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end, { desc = "Toggle Trouble" })
    --         vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Workspace Diagnostics" })
    --         vim.keymap.set("n", "<leader>d", function() require("trouble").toggle("document_diagnostics") end, { desc = "Document Diagnostics" })
    --         vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix List" })
    --         vim.keymap.set("n", "<leader>l", function() require("trouble").toggle("loclist") end, { desc = "Location List" })
    --         vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "LSP References" })
    --     end,
    -- },
    --
    -- Distraction-free writing
    -- {
    --     "folke/zen-mode.nvim",
    --     config = function()
    --         require("zen-mode").setup({})
    --     end,
    -- },
}