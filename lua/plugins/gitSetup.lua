return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gp+", ":Gitsigns nav_hunk next<CR>", {})
			vim.keymap.set("n", "<leader>gp-", ":Gitsigns nav_hunk prev<CR>", {})
			vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", {})
			vim.keymap.set("n", "<leader>gtd", ":Gitsigns toggle_word_diff<CR>", {})
		end,
	},
	{
    "tpope/vim-fugitive"
  },
}
