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
}