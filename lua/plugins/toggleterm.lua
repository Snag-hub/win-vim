return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      direction = "float",
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1, -- the degree by which to darken and lighten the background color of the selected window
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- Bottom terminal
    local term_bottom = Terminal:new({
      direction = "horizontal",
      cmd = vim.o.shell,
      hidden = true,
    })
    function _LAZYGIT_TOGGLE()
      term_bottom:toggle()
    end

    -- Side terminal
    local term_side = Terminal:new({
      direction = "vertical",
      cmd = vim.o.shell,
      hidden = true,
    })
    function _NODE_TOGGLE()
      term_side:toggle()
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>tb", ":lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle bottom terminal" })
    vim.keymap.set("n", "<leader>ts", ":lua _NODE_TOGGLE()<CR>", { desc = "Toggle side terminal" })

    -- Terminal mode keymaps
    vim.keymap.set("t", "<leader>tc", "<cmd>ToggleTermClose<CR>", { desc = "Close current terminal" })
    vim.keymap.set("t", "<leader>tf", ":lua require('toggleterm.terminal').Terminal:new({direction = 'float'}):toggle()<CR>", { desc = "Open new floating terminal" })
  end,
}
