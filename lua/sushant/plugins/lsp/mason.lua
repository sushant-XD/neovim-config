return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local lsp_servers = {
			"lua_ls",
			"cmake",
			"bashls",
			"basedpyright",
		}

		-- Docker LSP changed names in newer versions
		if vim.fn.has("nvim-0.11") == 1 then
			table.insert(lsp_servers, "docker_language_server")
		else
			table.insert(lsp_servers, "dockerls")
		end

		mason_lspconfig.setup({
			ensure_installed = lsp_servers,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"ruff",
				"biome",
				"gersemi",
			},
		})
	end,
}
