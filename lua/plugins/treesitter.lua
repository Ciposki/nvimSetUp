local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "c", "python", "c_sharp", "rust", "html", "css", "javascript" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

return { M }
