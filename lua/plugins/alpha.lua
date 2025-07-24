return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "",
      "███████╗███╗   ██╗███████╗███╗   ██╗██╗███╗   ██╗",
      "██╔════╝████╗  ██║██╔════╝████╗  ██║██║████╗  ██║",
      "█████╗  ██╔██╗ ██║█████╗  ██╔██╗ ██║██║██╔██╗ ██║",
      "██╔══╝  ██║╚██╗██║██╔══╝  ██║╚██╗██║██║██║╚██╗██║",
      "███████╗██║ ╚████║███████╗██║ ╚████║██║██║ ╚████║",
      "╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝",
      "",
      "  Snag",
      "",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
      dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
      
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "Git  Live Grep", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  Quit", ":qa <CR>"),
    }

    dashboard.section.footer.val = "" -- You can add a custom footer here

    alpha.setup(dashboard.config)

    -- Set alpha to open on VimEnter
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("AlphaStart", { clear = true }),
      pattern = "*",
      callback = function()
        if vim.o.filetype == "" and vim.fn.argc() == 0 then
          require("alpha").start(false, require("alpha.themes.dashboard").config)
        end
      end,
    })
  end,
}
