return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      show_end_of_buffer = true,
      integrations = {
        neotree = true,
        barbar = true,
        telescope = {
          enabled = true,
          style = "nvchad"
        },
        gitgutter =true,
      },
    })
--    vim.cmd.colorscheme("catppuccin")
  end,
}
