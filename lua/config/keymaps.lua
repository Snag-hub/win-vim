local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer navigation
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)

-- Harpoon
keymap("n", "<leader>a", function() require("harpoon.mark").add_file() end, opts)
keymap("n", "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, opts)
keymap("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end, opts)
keymap("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end, opts)
keymap("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end, opts)
keymap("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end, opts)

-- DAP
keymap("n", "<leader>db", function() require("dap").toggle_breakpoint() end, opts)
keymap("n", "<leader>dc", function() require("dap").continue() end, opts)
keymap("n", "<leader>di", function() require("dap").step_into() end, opts)
keymap("n", "<leader>do", function() require("dap").step_over() end, opts)
keymap("n", "<leader>dO", function() require("dap").step_out() end, opts)
keymap("n", "<leader>dr", function() require("dap").repl.open() end, opts)
keymap("n", "<leader>dl", function() require("dap").run_last() end, opts)
keymap("n", "<leader>du", function() require("dapui").toggle() end, opts)


