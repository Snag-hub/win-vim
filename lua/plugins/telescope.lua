return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
    { "<leader><leader>", "<cmd>Telescope close<CR>", desc = "Close Telescope" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<leader><leader>"] = "close",
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })
    telescope.load_extension("ui-select")
  end,
}
