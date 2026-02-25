return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = { "lua_ls", "clangd", "pyright", "neocmake" },
			})
			vim.keymap.set("i", "<C-o>", "<C-x><C-o>", {})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.lsp.config.lua_ls = {capabilities = capabilities }
			vim.lsp.config.clangd = {capabilities = capabilities }
			vim.lsp.config.pyright = {capabilities = capabilities }
			vim.lsp.config.neocmake = {capabilities = capabilities }
      

			vim.lsp.enable({ "lua_ls", "clangd", "pyright", "neocmake" })

			-- hover (explains the functionality)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

			-- code actions for errors
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.diagnostic.config({
				virtual_text = true,
				float = {
					source = "always",
					border = "rounded",
				},
			})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
