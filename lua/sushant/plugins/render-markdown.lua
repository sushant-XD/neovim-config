return {
	"MeanderingProgrammer/render-markdown.nvim",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-mini/mini.nvim",
	},

	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		image = {
			enabled = true,
			max_width = 100,
			max_height = 20,
		},
	},
}
