local overrides = require "custom.configs.overrides"
local usercmd = vim.api.nvim_create_user_command

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "User FilePost",
  },

  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleNext", "TroublePrevious" },
    config = function()
      dofile(vim.g.base46_cache .. "trouble")
      require("trouble").setup()
      usercmd("TroubleNext", function()
        require("trouble").next { skip_groups = true, jump = true }
      end, {})
      usercmd("TroublePrevious", function()
        require("trouble").previous { skip_groups = true, jump = true }
      end, {})
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "LazyGit", "LazyGitConfig" },
  },

  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Undotree",
    config = function()
      require("undotree").setup()
      usercmd("Undotree", require("undotree").toggle, {})
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        server_opts_overrides = {
          settings = {
            advanced = {
              listCount = 10, -- #completions for panel
              inlineSuggestCount = 3, -- #completions for getCompletions
            },
          },
        },
      }
      require("copilot_cmp").setup {}
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "Harpoon",
      "HarpoonUI",
      "HarpoonNext",
      "HarpoonPrev",
      "HarpoonSelect1",
      "HarpoonSelect2",
      "HarpoonSelect3",
      "HarpoonSelect4",
      "HarpoonSelect5",
    },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()
      usercmd("Harpoon", function()
        harpoon:list():append()
      end, {})
      usercmd("HarpoonUI", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, {})
      usercmd("HarpoonNext", function()
        harpoon:list():next()
      end, {})
      usercmd("HarpoonPrev", function()
        harpoon:list():prev()
      end, {})
      for i = 1, 5, 1 do
        usercmd("HarpoonSelect" .. i, function()
          harpoon:list():select(i)
        end, {})
      end
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
