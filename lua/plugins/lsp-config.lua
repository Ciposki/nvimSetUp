return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "omnisharp", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				cmd = {
					"/usr/bin/dotnet",
					"/home/cipo/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
				},
			})
			lspconfig.pyright.setup({
        capabilities  = capabilities
      })
      lspconfig.bashls.setup({
        capabilities=capabilities
      })

      lspconfig.html.setup({
        capabilities=capabilities
      })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
