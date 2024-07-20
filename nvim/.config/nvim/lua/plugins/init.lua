return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Update my workspaces once finished cleaning up Obsidian vault
      workspaces = {
        {
          name = "personal",
          path = "/Users/johnmclevey/Documents/JVPM",
        },
        {
          name = "work",
          path = "/Users/johnmclevey/Documents/JVPM",
        },
      },
      completion = {
        nvim_cmp = true,
      },
      -- Add any additional options here
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier"
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "markdown",
        "markdown_inline"
      },
      highlight = {
        enable = true,
      },
    },
  },
}