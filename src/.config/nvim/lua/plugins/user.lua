---@type LazySpec
return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
      vim.api.nvim_set_keymap("i", "<C-K>", "copilot#Dismiss()", { expr = true, silent = true })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right", -- This sets the explorer to the right side
      },
    },
  },

  -- Hide the tabline by default
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = {
      options = {
        opt = {
          showtabline = 0,
        },
      },
    },
  },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = false, -- Load the plugin immediately (disable lazy loading for colorschemes)
    priority = 9000, -- Ensure this plugin loads before other UI configurations
    config = function()
      require("monokai-pro").setup {
        filter = "classic", -- You can change this to 'octagon', 'machine', etc.
        transparent_background = false, -- Customize as needed
      }
      -- Set Monokai Pro as your colorscheme
      vim.cmd "colorscheme monokai-pro"
    end,
  },

  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = {},
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  },
  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  --   {
  --     "goolord/alpha-nvim",
  --     opts = function(_, opts)
  --       -- customize the dashboard header
  --       opts.section.header.val = {
  --         " █████  ███████ ████████ ██████   ██████",
  --         "██   ██ ██         ██    ██   ██ ██    ██",
  --         "███████ ███████    ██    ██████  ██    ██",
  --         "██   ██      ██    ██    ██   ██ ██    ██",
  --         "██   ██ ███████    ██    ██   ██  ██████",
  --         " ",
  --         "    ███    ██ ██    ██ ██ ███    ███",
  --         "    ████   ██ ██    ██ ██ ████  ████",
  --         "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
  --         "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
  --         "    ██   ████   ████   ██ ██      ██",
  --       }
  --       return opts
  --     end,
  --   },

  -- You can disable default plugins as follows:
  --  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
