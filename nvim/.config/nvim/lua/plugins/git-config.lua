return {
	{
		"tpope/vim-fugitive",
    config = function ()
      vim.keymap.set("n", "<leader>gg", ":Git status %<CR>")
      vim.keymap.set("n", "<leader>ga", ":Git stage %<CR>")
      vim.keymap.set("n", "<leader>gc", ":Git commit %<CR>")
      vim.keymap.set("n", "<leader>g<S-p>", ":Git push<CR>")
    end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
}
