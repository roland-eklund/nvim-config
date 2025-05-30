return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- ~/.config/nvim/lua/custom/plugins/nvimtree.lua (or wherever you override plugins)
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "javascript",
        "markdown",
        "python",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "github/copilot.vim",
    keys = { {
      "<leader>cop",
      mode = "n",
      desc = "Enable Copilot",
    } },
    config = function()
      -- Optional: Add any specific Copilot settings here
      -- vim.g.copilot_filetypes = { markdown = false, ['*'] = true }

      -- IMPORTANT: Copilot usually enables itself automatically when loaded.
      -- If you find it doesn't enable after pressing the keybinding,
      -- you *might* need to explicitly enable it here:
      -- vim.cmd('Copilot enable')
      -- However, try without this first.
      print "GitHub Copilot plugin configured after loading."
    end,
  },
}
