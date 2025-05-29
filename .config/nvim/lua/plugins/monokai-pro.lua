return {
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
}
