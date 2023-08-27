-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

-- Plugins

lvim.plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },
  {
    "max397574/better-escape.nvim",
    opts = {},
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

}


-- Copilot
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
      require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    end, 100)
  end,
})

-- Options
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

lvim.colorscheme = "catppuccin-mocha"
lvim.transparent_window = true
vim.o.relativenumber = true

-- UI
lvim.builtin.alpha.dashboard.section.header.val = {

  [[                                                        ]],
  [[ __  __     ______     __   __     __   __     ______   ]],
  [[/\ \_\ \   /\  __ \   /\ "-.\ \   /\ "-.\ \   /\  __ \  ]],
  [[\ \  __ \  \ \  __ \  \ \ \-.  \  \ \ \-.  \  \ \  __ \ ]],
  [[ \ \_\ \_\  \ \_\ \_\  \ \_\\"\_\  \ \_\\"\_\  \ \_\ \_\]],
  [[  \/_/\/_/   \/_/\/_/   \/_/ \/_/   \/_/ \/_/   \/_/\/_/]],
  [[                                                        ]],
  [[                                                        ]],
  [[                                                        ]],
}
