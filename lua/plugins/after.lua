return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "java", "kotlin", "groovy", "xml" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      pickers = {
        find_files = {
          hidden = false,
        },
      },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function() end,
    -- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
    -- modified.
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },

      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },

      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dT",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    ---@type MasonNvimDapSettings
    opts = {
      -- This line is essential to making automatic installation work
      -- :exploding-brain
      handlers = {},
      automatic_installation = {
        -- These will be configured by separate plugins.
        exclude = {
          "delve",
          "python",
        },
      },
      -- DAP servers: Mason will be invoked to install these if necessary.
      ensure_installed = {
        "bash",
        "codelldb",
        "php",
        "python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim",
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    config = function()
      local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
      require("dap-python").setup(python)
    end,
    -- Consider the mappings at
    -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI",
      },
    },
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        sh = { "shfmt" },
        yaml = { "prettierd", "prettier" },
        python = { "black" },
      },
    },
  },
  {
    url = "https://codeberg.org/andyg/leap.nvim",
  },
  {
    "folke/flash.nvim",
    enabled = true,
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
        char = {
          jump_labels = true,
        },
      },
    },
    keys = {
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "F",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
    init = function()
      -- Don't create default mappings (sa/sd/sr) -> avoids Flash conflicts
      vim.g.sandwich_no_default_key_mappings = 1

      -- Load default recipes (common surrounds)
      vim.g["sandwich#recipes"] = vim.deepcopy(vim.g["sandwich#default_recipe"])
    end,
    config = function()
      local map = vim.keymap.set

      -- Add / Delete / Replace
      map({ "n", "x" }, "gsa", "<Plug>(sandwich-add)", { desc = "Sandwich add" })
      map("n", "gsd", "<Plug>(sandwich-delete)", { desc = "Sandwich delete" })
      map("n", "gsr", "<Plug>(sandwich-replace)", { desc = "Sandwich replace" })

      -- Optional: textobjects for �inside/around nearest surround�
      map({ "o", "x" }, "is", "<Plug>(textobj-sandwich-auto-i)", { desc = "Inside surround" })
      map({ "o", "x" }, "as", "<Plug>(textobj-sandwich-auto-a)", { desc = "Around surround" })
    end,
  },
  {
    "backdround/improved-search.nvim",
    keys = {
      {
        "n",
        mode = { "n", "x", "o" },
        function()
          require("improved-search").stable_next()
        end,
      },
      {
        "N",
        mode = { "n", "x", "o" },
        function()
          require("improved-search").stable_previous()
        end,
      },
      {
        "!",
        mode = { "n" },
        function()
          require("improved-search").current_word()
        end,
      },
      {
        "!",
        mode = { "x" },
        function()
          require("improved-search").in_place()
        end,
      },
      {
        "*",
        mode = { "x" },
        function()
          require("improved-search").forward()
        end,
      },
      {
        "#",
        mode = { "x" },
        function()
          require("improved-search").backward()
        end,
      },
      {
        "|",
        mode = { "n" },
        function()
          require("improved-search").in_place()
        end,
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = {
      ring = {
        storage = "memory",
      },
      textobj = {
        enabled = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
    },
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put After" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Before" },
      { "<C-p>", "<Plug>(YankyCycleForward)", desc = "Cycle forward yank history" },
      { "<C-n>", "<Plug>(YankyCycleBackward)", desc = "Cycle backward yank history" },
      {
        "iy",
        function()
          require("yanky.textobj").last_put()
        end,
        mode = { "o", "x" },
        desc = "Yank text object",
      },
    },
  },
}
